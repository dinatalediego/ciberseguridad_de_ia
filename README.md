# Ciberseguridad de IA

Repositorio académico personal para estudiar **ciberseguridad aplicada a sistemas de inteligencia artificial**, dentro de mi formación de **Maestría en Data Science**.

La meta no es acumular diapositivas: es convertir cada sesión en una base técnica reutilizable mediante el ciclo:

**concepto → amenaza → activo → control → laboratorio → evidencia → conclusión**.

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
│   └── 01_stride.md
├── 02_ia_y_superficie_de_ataque/
│   └── README.md
├── entretenimiento/
│   └── 01_stride_en_rimas.md
├── labs/
│   └── lab_01_stride_en_sistema_ia.md
├── templates/
│   └── threat_model_stride.md
├── bibliografia/
│   └── README.md
├── docs/
│   └── roadmap_academico.md
└── README.md
```

## Sesión 1 — STRIDE

La primera pieza formal del repositorio parte del principio de que **STRIDE nombra la forma en que se rompe una propiedad de seguridad**:

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

Para memorizar STRIDE sin perder rigor, el repositorio también incluye una versión con **rimas, ejemplos laborales, situaciones de cultura general y un mini juego**.

Ver: [`entretenimiento/01_stride_en_rimas.md`](entretenimiento/01_stride_en_rimas.md).

Idea mnemotécnica central:

**fingir → cambiar → negar → revelar → bloquear → escalar**.

## Cómo se estudiará cada tema

Cada tema debe intentar responder seis preguntas:

1. **¿Qué activo estoy protegiendo?** Datos, modelo, identidad, prompt, vector store, herramienta, API, secreto, logs, etc.
2. **¿Qué propiedad de seguridad importa?** Autenticación, integridad, auditoría, confidencialidad, disponibilidad o autorización.
3. **¿Cómo puede romperse?** Amenaza concreta y actor plausible.
4. **¿Qué impacto tendría?** Técnico, operativo, económico, legal o reputacional.
5. **¿Qué control reduce el riesgo?** Prevención, detección, respuesta y evidencia.
6. **¿Cómo lo demuestro?** Laboratorio, prueba, log, captura o métrica reproducible.

## Estándar para los laboratorios

Todo laboratorio debería contener:

- objetivo de aprendizaje;
- sistema o componente analizado;
- activos y límites de confianza;
- amenaza y categoría STRIDE;
- precondiciones;
- prueba controlada;
- evidencia observada;
- control o mitigación;
- riesgo residual;
- reflexión final.

> Los laboratorios de este repositorio son educativos y deben ejecutarse únicamente sobre sistemas propios, entornos de práctica o activos para los que exista autorización explícita.

## Marcos de referencia

La ruta irá conectando los apuntes con fuentes primarias y marcos reconocidos, entre ellos:

- STRIDE / threat modeling;
- NIST Cybersecurity Framework y NIST AI Risk Management Framework;
- OWASP para aplicaciones web, APIs y sistemas con LLM;
- MITRE ATT&CK y MITRE ATLAS;
- principios de Zero Trust, least privilege, secure-by-design y defense-in-depth.

Las referencias se documentan en [`bibliografia/README.md`](bibliografia/README.md).

## Roadmap

La evolución propuesta está en [`docs/roadmap_academico.md`](docs/roadmap_academico.md). El objetivo final es que el repositorio pase de **apuntes académicos** a un **portfolio de AI Security Engineering** con threat models, laboratorios, matrices de riesgo, pruebas y pequeños proyectos.
