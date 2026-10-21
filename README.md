# Ciberseguridad de IA

Repositorio académico personal para estudiar **ciberseguridad aplicada a sistemas de inteligencia artificial**, dentro de mi formación de **Maestría en Data Science**.

La meta no es acumular diapositivas: es convertir cada sesión en una base técnica reutilizable mediante el ciclo:

**concepto → amenaza → activo → control → laboratorio → evidencia → conclusión**.

## Tres capas del proyecto

- **Repositorio**: fuente de verdad versionada, laboratorios, notas y activos.
- **Wiki académica**: lectura secuencial y navegación por temas.
- **Web académica**: experiencia visual e interactiva con atlas, casos y microquizzes.

Web prevista: **https://dinatalediego.github.io/ciberseguridad_de_ia/**

## Objetivos

- Dominar fundamentos de seguridad relevantes para IA, ML, LLM, RAG, agentes y MLOps.
- Aprender a modelar amenazas antes de implementar controles.
- Relacionar propiedades de seguridad con marcos como **STRIDE**.
- Traducir teoría a laboratorios pequeños, reproducibles y documentados.
- Construir un portafolio académico con evidencia de aprendizaje y criterio técnico.
- Conectar progresivamente ciberseguridad clásica con riesgos propios de sistemas de IA.

## Mapa del repositorio

```text
ciberseguridad_de_ia/
├── 01_fundamentos/
├── 02_ia_y_superficie_de_ataque/
├── 03_seguridad_ml/
├── 04_llm_rag_agentes/
├── 05_cadena_suministro/
├── entretenimiento/
├── labs/
├── templates/
├── bibliografia/
├── assets/
│   └── wiki/
├── web/                  # sitio académico interactivo
├── wiki/                 # fuente de páginas para GitHub Wiki
└── .github/workflows/    # publicación automática
```

## Sesión 1 — STRIDE

STRIDE nombra la forma en que se rompe una propiedad de seguridad:

| Propiedad | Cómo se rompe | STRIDE |
|---|---|---|
| Autenticación | Alguien se hace pasar por otro | **Spoofing** |
| Integridad | Alguien cambia algo que no debía | **Tampering** |
| Auditoría / no repudio | Alguien niega lo que hizo o no queda evidencia | **Repudiation** |
| Confidencialidad | Alguien accede a información que no debía | **Information Disclosure** |
| Disponibilidad | Alguien impide que el sistema funcione | **Denial of Service** |
| Autorización | Alguien realiza acciones fuera de sus permisos | **Elevation of Privilege** |

Ver: [`01_fundamentos/01_stride.md`](01_fundamentos/01_stride.md).

### 🎭 Versión lúdica — STRIDE en rimas

Ver: [`entretenimiento/01_stride_en_rimas.md`](entretenimiento/01_stride_en_rimas.md).

Idea mnemotécnica: **fingir → cambiar → negar → revelar → bloquear → escalar**.

## Atlas visual

El repositorio incluye visuales académicos para:

- envenenamiento de datos y backdoors;
- prompt injection, disclosure y elevación de privilegios;
- límites de confianza y cadena de suministro;
- riesgos al cargar modelos serializados;
- hash y firma digital;
- OWASP y MITRE ATLAS;
- casos reales de artefactos maliciosos.

La web presenta estos materiales como una galería navegable y los conecta con microcasos y preguntas.

## Cómo se estudiará cada tema

Cada tema debe responder:

1. **¿Qué activo estoy protegiendo?**
2. **¿Qué propiedad de seguridad importa?**
3. **¿Cómo puede romperse?**
4. **¿Qué impacto tendría?**
5. **¿Qué control reduce el riesgo?**
6. **¿Cómo lo demuestro?**

## Estándar para los laboratorios

Todo laboratorio debería contener objetivo, arquitectura, activos, límites de confianza, amenaza, precondiciones, prueba controlada, evidencia, mitigación y riesgo residual.

> Los laboratorios son educativos y deben ejecutarse únicamente sobre sistemas propios, entornos de práctica o activos para los que exista autorización explícita.

## Publicación automática

- `.github/workflows/publish-wiki.yml` sincroniza el material académico con GitHub Wiki.
- `.github/workflows/deploy-academic-web.yml` publica la web visual mediante GitHub Pages.

## Roadmap

Ver [`docs/roadmap_academico.md`](docs/roadmap_academico.md). El objetivo final es evolucionar desde apuntes a un **portfolio de AI Security Engineering** con threat models, laboratorios, matrices de riesgo, pruebas y proyectos reproducibles.
