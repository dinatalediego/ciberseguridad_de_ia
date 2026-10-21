# Roadmap académico — Ciberseguridad de IA

## Propósito

Convertir este repositorio en una trayectoria visible de aprendizaje: desde fundamentos de ciberseguridad hasta análisis de riesgos y defensa de sistemas de IA en producción.

## Fase 1 — Fundamentos de seguridad

**Objetivo:** dominar el vocabulario base y aprender a pensar en propiedades, amenazas y controles.

Temas:

- autenticación vs autorización;
- confidencialidad, integridad y disponibilidad;
- auditoría y no repudio;
- STRIDE;
- activos y límites de confianza;
- least privilege;
- defense in depth;
- gestión de secretos;
- logging y trazabilidad.

**Entregable:** threat model STRIDE de un sistema simple.

## Fase 2 — Seguridad de aplicaciones, APIs y datos

**Objetivo:** entender los riesgos que existen aunque el sistema no use IA.

Temas:

- seguridad de APIs;
- control de acceso;
- validación de entradas;
- gestión de sesiones;
- protección de datos;
- cifrado en tránsito y reposo;
- dependencias y supply chain;
- CI/CD seguro;
- observabilidad e incident response.

**Entregable:** matriz de controles y pruebas de una API propia de laboratorio.

## Fase 3 — Seguridad de ML

**Objetivo:** analizar amenazas sobre datos, entrenamiento, artefactos y modelos.

Temas:

- data poisoning;
- integridad y procedencia de datasets;
- model artifacts;
- reproducibilidad;
- acceso a pipelines;
- adversarial ML;
- model extraction / inversion como conceptos de estudio;
- monitoreo de comportamiento y drift desde la perspectiva de riesgo.

**Entregable:** threat model de un pipeline ML de extremo a extremo.

## Fase 4 — Seguridad de LLM, RAG y agentes

**Objetivo:** estudiar cómo cambia la superficie de ataque cuando el modelo interpreta lenguaje y puede usar herramientas.

Temas:

- prompt injection;
- indirect prompt injection;
- exposición de información;
- aislamiento de contexto;
- autorización en RAG;
- tool use y function calling;
- permisos de agentes;
- memory poisoning;
- abuso de recursos y costos;
- evaluación y guardrails como controles parciales, no absolutos.

**Entregable:** laboratorio de un agente/RAG con controles y evidencia.

## Fase 5 — Threat intelligence y marcos de riesgo

**Objetivo:** pasar de amenazas aisladas a una lectura sistemática del riesgo.

Temas:

- NIST CSF;
- NIST AI RMF;
- OWASP;
- MITRE ATT&CK;
- MITRE ATLAS;
- riesgo inherente y residual;
- probabilidad, impacto y exposición;
- priorización basada en evidencia.

**Entregable:** registro de riesgos de un sistema de IA con trazabilidad a controles.

## Fase 6 — AI Security Engineering

**Objetivo:** convertir el aprendizaje en práctica de ingeniería.

Proyectos sugeridos:

- scanner básico de configuraciones inseguras en un proyecto de IA;
- verificador de permisos de herramientas de un agente;
- evaluación de aislamiento entre usuarios en un RAG;
- dashboard de eventos de seguridad para una app con LLM;
- pipeline que produzca un `security_evidence.json` por release;
- checklist automatizado de seguridad antes de despliegue.

**Entregable:** proyecto reproducible con README, threat model, tests, evidencia y conclusiones.

## Fase 7 — Portfolio académico

El repositorio debería poder demostrar, sin depender de una explicación oral:

- qué problema se estudió;
- qué marco conceptual se utilizó;
- qué amenaza se formuló;
- qué experimento se ejecutó;
- qué evidencia se obtuvo;
- qué control se propuso;
- qué limitaciones permanecen;
- qué aprendiste.

## Cadencia recomendada por sesión

Después de cada clase:

1. crear una nota de sesión;
2. resumir 3–5 conceptos clave;
3. añadir al menos un ejemplo aplicado a IA;
4. formular una pregunta o amenaza verificable;
5. vincular una fuente primaria;
6. si aplica, crear un mini-lab;
7. registrar dudas abiertas para la siguiente sesión.

## Criterio de madurez del repositorio

### Nivel 1 — Apuntes

Contenido correcto y ordenado.

### Nivel 2 — Comprensión

Los conceptos incluyen ejemplos y relaciones entre marcos.

### Nivel 3 — Evidencia

Existen laboratorios, matrices, diagramas y resultados reproducibles.

### Nivel 4 — Ingeniería

Los controles se prueban automáticamente y forman parte del ciclo de desarrollo.

### Nivel 5 — Portfolio

El repositorio demuestra criterio profesional en AI Security Engineering, con trazabilidad desde amenaza hasta evidencia y riesgo residual.
