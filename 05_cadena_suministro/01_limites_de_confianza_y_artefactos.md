# Cadena de suministro — límites de confianza y artefactos

En sistemas de IA casi ningún equipo construye todo desde cero. Datasets, modelos preentrenados, librerías, contenedores, pesos, checkpoints y servicios externos atraviesan la arquitectura desde fuentes que el equipo **no controla completamente**.

![Cadena de suministro y límite de confianza](https://raw.githubusercontent.com/dinatalediego/ciberseguridad_de_ia/main/assets/wiki/supply-chain-trust-boundary.webp)

## 1. Idea central

**Cada pieza descargada cruza un límite de confianza.**

Un límite de confianza separa aquello que el sistema controla directamente de aquello que proviene de una identidad, repositorio, proveedor o proceso externo. Cruzarlo no significa que el artefacto sea malicioso; significa que **debe verificarse antes de heredar confianza**.

Ejemplo simplificado:

```text
Fuente externa ──datos──▶ Entrenamiento ──▶ Archivo del modelo ──▶ Producción

Repositorio público ──descarga──▶ Entrenamiento
                  ↑
            límite de confianza
```

## 2. Qué es un artefacto

Un **artefacto** es cualquier archivo o componente que un proceso consume o produce y que influye en el sistema final.

Ejemplos en IA:

- dataset CSV/Parquet;
- pesos de un modelo (`.pt`, `.safetensors`, `.onnx`);
- checkpoint de entrenamiento;
- tokenizer;
- embedding model;
- paquete Python;
- imagen de contenedor;
- archivo de configuración;
- prompt versionado;
- índice/vector store exportado.

## 3. Caso concreto — sustitución del archivo del modelo

Supongamos que el equipo entrena y aprueba:

```text
credit_scoring_v12.safetensors
SHA256 = abc123...
```

Durante el traslado a producción alguien sustituye el archivo por otro con el mismo nombre:

```text
credit_scoring_v12.safetensors
SHA256 = 9f7e42...
```

La aplicación puede arrancar normalmente y nadie nota el cambio si el pipeline solo verifica **nombre o ubicación**, pero no identidad criptográfica del artefacto.

### Propiedad afectada

**Integridad.** El archivo que llega a producción no es exactamente el aprobado.

### STRIDE

El mecanismo se puede modelar como **Tampering**.

## 4. Otros escenarios de cadena de suministro

| Componente | Ataque o fallo | Riesgo |
|---|---|---|
| Dataset de proveedor | filas o etiquetas alteradas | poisoning |
| Modelo público | pesos modificados | backdoor / comportamiento inesperado |
| Dependencia Python | paquete comprometido | ejecución de código / robo de secretos |
| Contenedor | imagen sustituida | componente no aprobado en producción |
| Tokenizer/config | archivo manipulado | cambios silenciosos en inferencia |
| CI/CD | credencial comprometida | publicación de artefactos falsos |

## 5. La huella como identidad del artefacto

Una práctica básica es calcular una huella criptográfica:

```bash
sha256sum credit_scoring_v12.safetensors
```

El valor esperado se registra al aprobar el artefacto y vuelve a comprobarse antes de desplegarlo.

La pregunta deja de ser:

> “¿el archivo se llama igual?”

Y pasa a ser:

> **“¿son exactamente los mismos bytes que aprobamos?”**

## 6. Controles por etapa

| Etapa | Control recomendado |
|---|---|
| Descarga | fuente permitida + versión fijada |
| Ingesta | checksum/firma + análisis de contenido |
| Build | dependencias bloqueadas y reproducibilidad |
| Registro | repositorio de artefactos con permisos mínimos |
| Aprobación | hash, metadata, responsable y timestamp |
| Despliegue | verificar firma/hash antes de cargar |
| Producción | attestation, inventario y monitoreo |

## 7. Evidencia que debería quedar

Para cada artefacto crítico conviene poder responder:

```text
¿Qué archivo fue usado?
¿De dónde vino?
¿Qué versión era?
¿Cuál era su hash?
¿Quién lo aprobó?
¿Qué pipeline lo produjo?
¿Qué versión llegó a producción?
¿Coincide con la aprobada?
```

Esto conecta seguridad de supply chain con **auditoría, reproducibilidad y MLOps**.

## 8. Mini-lab sugerido

1. Crear un archivo de modelo ficticio.
2. Calcular su SHA-256 y guardarlo como evidencia aprobada.
3. Copiar el archivo al directorio de despliegue.
4. Sustituirlo por una versión modificada.
5. Ejecutar una verificación automática antes de “producción”.
6. Confirmar que el despliegue se bloquea por hash diferente.

## Idea para recordar

**La confianza no debe viajar por el nombre del archivo; debe viajar con evidencia verificable de procedencia e integridad.**
