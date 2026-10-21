# Ciberseguridad de IA — Wiki académica

Bienvenido a la wiki académica del repositorio **Ciberseguridad de IA**.

Este espacio organiza el aprendizaje de la Maestría en Data Science como una base de conocimiento navegable, con foco en:

**concepto → amenaza → activo → control → laboratorio → evidencia → conclusión**

## Ruta principal

1. [STRIDE y propiedades de seguridad](01-STRIDE-y-propiedades-de-seguridad)
2. [Superficie de ataque en sistemas de IA](02-Superficie-de-ataque-en-IA)
3. [Lab 01 — STRIDE de un sistema de IA](03-Lab-STRIDE-de-un-sistema-de-IA)
4. [Template — Threat Model STRIDE](04-Template-Threat-Model-STRIDE)
5. [Roadmap académico](05-Roadmap-academico)
6. [Bibliografía](06-Bibliografia)
7. [Envenenamiento de datos y backdoors](07-Envenenamiento-y-backdoors)
8. [Casos visuales — LLM, RAG y agentes](08-Amenazas-LLM-RAG-y-agentes)
9. [Cadena de suministro y límites de confianza](09-Cadena-de-suministro-y-confianza)

## Atlas visual

La Wiki incorpora infografías propias como apoyo de estudio. Las imágenes no sustituyen la explicación técnica: sirven para fijar mentalmente la relación entre **activo → propiedad → amenaza → evidencia → control**.

Temas visuales incorporados:

- data poisoning y Tampering;
- backdoors y correlaciones espurias;
- por qué accuracy puede ocultar un backdoor;
- prompt injection;
- Information Disclosure en RAG;
- Elevation of Privilege en agentes;
- supply chain, artefactos y límites de confianza.

## Cómo usar esta wiki

Cada sesión debería dejar al menos una pieza reutilizable:

- una nota conceptual;
- un ejemplo aplicado a IA;
- una amenaza o hipótesis verificable;
- un control o mitigación;
- una referencia primaria;
- cuando corresponda, un mini-laboratorio con evidencia.

## Criterio de madurez

La meta es que el repositorio evolucione desde **apuntes** hacia un **portfolio de AI Security Engineering**, con threat models, laboratorios, matrices de riesgo, evidencia, piezas audiovisuales y pequeñas automatizaciones de seguridad.

> La wiki es la capa de navegación. Los archivos académicos del repositorio son la fuente de verdad. Cada cambio relevante que llegue a `main` dispara `.github/workflows/publish-wiki.yml`, que reconstruye y sincroniza automáticamente la Wiki nativa de GitHub.
