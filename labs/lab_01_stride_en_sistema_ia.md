# Lab 01 — Threat modeling STRIDE de un sistema de IA

## Objetivo

Aplicar STRIDE a una arquitectura mínima de IA y producir un threat model con amenazas, evidencia esperada, controles y riesgo residual.

## Alcance del laboratorio

Sistema hipotético:

```text
Usuario
  ↓
Aplicación web
  ↓
API backend
  ↓
Orquestador LLM
  ├── Vector DB / RAG
  └── Tool: consulta de base de datos
```

## Paso 1 — Inventario de activos

Completar:

| ID | Activo | Sensibilidad | Propietario | Qué pasaría si se compromete |
|---|---|---|---|---|
| A1 | Sesión del usuario | Alta | Aplicación | |
| A2 | API key del proveedor LLM | Alta | Backend | |
| A3 | Documentos RAG | | | |
| A4 | Tool de base de datos | | | |
| A5 | Logs de auditoría | | | |

## Paso 2 — Límites de confianza

Identifica dónde cambia la confianza:

- navegador → backend;
- backend → proveedor LLM;
- orquestador → vector store;
- orquestador → herramienta;
- aplicación → almacenamiento de logs.

Para cada límite, responde:

- ¿cómo se autentica cada parte?;
- ¿cómo se autoriza?;
- ¿qué datos atraviesan el límite?;
- ¿están cifrados?;
- ¿qué evidencia se registra?;
- ¿qué ocurre si el componente externo falla?

## Paso 3 — Matriz STRIDE

| Componente / flujo | S | T | R | I | D | E | Hipótesis concreta |
|---|---:|---:|---:|---:|---:|---:|---|
| Usuario → Web | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| Web → API | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| API → LLM | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| LLM → RAG | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| LLM → Tool | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| Sistema → Logs | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |

No marques categorías “por cumplir”. Una amenaza debe formularse como una hipótesis plausible.

## Paso 4 — Registro de amenazas

Usa al menos cinco amenazas:

| ID | Activo | STRIDE | Escenario | Impacto | Control actual | Control propuesto | Evidencia de prueba | Riesgo residual |
|---|---|---|---|---|---|---|---|---|
| T01 | | | | | | | | |
| T02 | | | | | | | | |
| T03 | | | | | | | | |
| T04 | | | | | | | | |
| T05 | | | | | | | | |

## Paso 5 — Pruebas seguras sugeridas

Ejemplos de validaciones que pueden hacerse en un entorno propio:

- intentar acceder a un recurso con un rol sin privilegios;
- modificar un documento de prueba y verificar si existe detección/versionado;
- revisar si una llamada a herramienta queda ligada a usuario, timestamp y request ID;
- provocar un timeout controlado y verificar degradación/fallback;
- introducir un documento RAG de prueba con clasificación restringida y validar que no sea recuperado por otro rol;
- revisar que secretos no aparezcan en logs ni respuestas.

## Paso 6 — Evidencia

Guardar evidencia reproducible:

```text
labs/evidence/lab_01/
├── architecture.png
├── threat_matrix.csv
├── test_results.md
└── conclusions.md
```

No subir secretos, credenciales, datos personales ni información confidencial.

## Criterio de finalización

El laboratorio se considera completo cuando:

- existe un diagrama simple del sistema;
- se identifican activos y límites de confianza;
- hay al menos cinco amenazas justificadas;
- cada amenaza tiene al menos un control;
- cada control tiene una forma de prueba;
- se documenta el riesgo residual;
- se incluye una conclusión sobre qué amenaza fue más importante y por qué.

## Reflexión final

La meta no es “llenar STRIDE”. La meta es producir una explicación defendible de **qué puede romperse, por qué importa, cómo lo detectaríamos y qué haríamos para reducir el riesgo**.
