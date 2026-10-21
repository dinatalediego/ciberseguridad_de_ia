# IA y superficie de ataque

Este módulo conecta seguridad clásica con la arquitectura real de un sistema de IA.

## Regla de estudio

No existe “la seguridad del modelo” de forma aislada. Un sistema moderno de IA suele incluir múltiples activos y límites de confianza:

```text
usuario
  ↓
frontend / app
  ↓
API / identidad
  ↓
orquestador
  ├── modelo / proveedor LLM
  ├── RAG / vector store / documentos
  ├── herramientas / funciones
  ├── bases de datos
  └── servicios externos
       ↓
logs / monitoreo / evaluación / MLOps
```

Cada flecha puede implicar autenticación, autorización, transformación de datos, exposición de secretos o cambio de confianza.

## Activos que conviene inventariar

- identidades humanas y de servicio;
- credenciales, tokens y secretos;
- datasets y etiquetas;
- modelos y artefactos de entrenamiento;
- system prompts y configuraciones;
- contexto conversacional;
- documentos y embeddings de RAG;
- herramientas disponibles para agentes;
- APIs internas y externas;
- outputs y decisiones automatizadas;
- logs, trazas y evidencia;
- infraestructura de despliegue;
- repositorios y pipelines CI/CD.

## Preguntas académicas para cada arquitectura

1. ¿Cuáles son los **activos críticos**?
2. ¿Dónde están los **límites de confianza**?
3. ¿Qué identidades atraviesan esos límites?
4. ¿Qué datos sensibles se transportan o almacenan?
5. ¿Qué componente puede modificar el estado del mundo?
6. ¿Qué acciones requieren aprobación humana?
7. ¿Qué evidencia quedaría si algo sale mal?
8. ¿Qué dependencia podría derribar o degradar el sistema?
9. ¿Qué permisos son excesivos?
10. ¿Qué amenaza es específica de IA y cuál existiría incluso sin IA?

## Capas de análisis propuestas

### Capa 1 — Seguridad clásica

Identidad, permisos, red, secretos, dependencias, logs, disponibilidad, seguridad de aplicación.

### Capa 2 — Seguridad de datos y ML

Procedencia de datos, poisoning, integridad de features, artefactos, reproducibilidad, acceso a modelos y pipelines.

### Capa 3 — Seguridad de LLM/RAG/agentes

Prompt injection, recuperación indebida, tool abuse, permisos de agente, exfiltración, aislamiento de contexto, costo y loops.

### Capa 4 — Gobernanza y operación

Aprobación humana, monitoreo, incidentes, evaluación, cambios de modelo, riesgo residual y evidencia de controles.

## Próximo resultado esperado

Este módulo deberá crecer hasta contener diagramas de arquitectura y threat models de sistemas concretos, donde cada amenaza esté vinculada a un activo, una frontera de confianza, un control y una prueba verificable.
