param(
    [string]$CommitMessage = "docs(wiki): sync academic knowledge base"
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$wikiUrl = "https://github.com/dinatalediego/ciberseguridad_de_ia.wiki.git"
$tempRoot = Join-Path $repoRoot ".tmp"
$wikiClone = Join-Path $tempRoot "ciberseguridad_de_ia.wiki"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Git no está disponible en PATH. Instala/configura Git antes de publicar la wiki."
}

if (Test-Path $wikiClone) {
    Remove-Item -Recurse -Force $wikiClone
}

New-Item -ItemType Directory -Force -Path $tempRoot | Out-Null

Write-Host "Clonando GitHub Wiki..." -ForegroundColor Cyan
git clone $wikiUrl $wikiClone
if ($LASTEXITCODE -ne 0) {
    throw @"
No se pudo clonar la Wiki de GitHub.

Si esta es la primera publicación, abre la pestaña Wiki del repositorio en GitHub y crea una primera página (por ejemplo Home). GitHub creará el repositorio especial .wiki.git. Luego vuelve a ejecutar este script.
"@
}

$pages = @(
    @{ Source = "wiki/Home.md"; Destination = "Home.md" },
    @{ Source = "wiki/_Sidebar.md"; Destination = "_Sidebar.md" },
    @{ Source = "01_fundamentos/01_stride.md"; Destination = "01-STRIDE-y-propiedades-de-seguridad.md" },
    @{ Source = "02_ia_y_superficie_de_ataque/README.md"; Destination = "02-Superficie-de-ataque-en-IA.md" },
    @{ Source = "labs/lab_01_stride_en_sistema_ia.md"; Destination = "03-Lab-STRIDE-de-un-sistema-de-IA.md" },
    @{ Source = "templates/threat_model_stride.md"; Destination = "04-Template-Threat-Model-STRIDE.md" },
    @{ Source = "docs/roadmap_academico.md"; Destination = "05-Roadmap-academico.md" },
    @{ Source = "bibliografia/README.md"; Destination = "06-Bibliografia.md" }
)

foreach ($page in $pages) {
    $source = Join-Path $repoRoot $page.Source
    $destination = Join-Path $wikiClone $page.Destination

    if (-not (Test-Path $source)) {
        throw "No existe la fuente esperada: $($page.Source)"
    }

    Copy-Item -Force $source $destination
    Write-Host "  ✓ $($page.Destination)" -ForegroundColor Green
}

Push-Location $wikiClone
try {
    $wikiBranch = (git branch --show-current).Trim()
    if (-not $wikiBranch) {
        throw "No se pudo determinar la rama activa del repositorio Wiki."
    }

    git add .
    if ($LASTEXITCODE -ne 0) { throw "Falló git add en la Wiki." }

    $status = git status --porcelain
    if (-not $status) {
        Write-Host "La Wiki ya está sincronizada; no hay cambios para publicar." -ForegroundColor Yellow
        return
    }

    git commit -m $CommitMessage
    if ($LASTEXITCODE -ne 0) { throw "Falló git commit en la Wiki." }

    git push origin $wikiBranch
    if ($LASTEXITCODE -ne 0) { throw "Falló git push en la Wiki." }

    Write-Host "Wiki publicada correctamente." -ForegroundColor Green
    Write-Host "https://github.com/dinatalediego/ciberseguridad_de_ia/wiki"
}
finally {
    Pop-Location
}
