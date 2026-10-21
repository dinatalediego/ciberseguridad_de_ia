# Sesión 1 — STRIDE y propiedades de seguridad

## Idea central

STRIDE sirve para **nombrar clases de amenazas**. Una forma útil de memorizarlo es asociar cada categoría con la propiedad de seguridad que se rompe.

| Propiedad de seguridad | Pregunta práctica | Amenaza STRIDE | Ejemplo simple |
|---|---|---|---|
| **Autenticación** | ¿Quién eres realmente? | **Spoofing** | Un atacante usa credenciales ajenas o suplanta una identidad de servicio. |
| **Integridad** | ¿Esto fue alterado? | **Tampering** | Se modifica un archivo, dataset, prompt de sistema o parámetro sin autorización. |
| **Auditoría / no repudio** | ¿Podemos demostrar quién hizo qué? | **Repudiation** | Se ejecuta una acción crítica sin logs suficientes y luego no puede atribuirse. |
| **Confidencialidad** | ¿Quién puede ver esto? | **Information Disclosure** | Se expone un secreto, dato personal, contexto de RAG o salida sensible. |
| **Disponibilidad** | ¿El servicio sigue funcionando? | **Denial of Service** | Se agotan recursos y el sistema deja de responder. |
| **Autorización** | ¿Qué estás autorizado a hacer? | **Elevation of Privilege** | Un usuario o agente obtiene permisos que no le corresponden. |

## Mnemotecnia

**S T R I D E**

- **S**poofing → autenticación
- **T**ampering → integridad
- **R**epudiation → auditoría / no repudio
- **I**nformation Disclosure → confidencialidad
- **D**enial of Service → disponibilidad
- **E**levation of Privilege → autorización

## Distinción importante: autenticación ≠ autorización

Estas dos propiedades suelen confundirse:

- **Autenticación** responde: *¿quién eres?*
- **Autorización** responde: *¿qué puedes hacer?*

Un sistema puede autenticar correctamente a una persona y aun así estar mal autorizado. En ese caso, el problema ya no es Spoofing sino potencialmente **Elevation of Privilege**.

## Auditoría y no repudio

La auditoría permite reconstruir acciones mediante evidencia: identidad, fecha/hora, recurso afectado, acción ejecutada y resultado.

El **no repudio** se apoya en esa evidencia: quien realizó una acción no debería poder negar posteriormente que ocurrió si el registro es confiable y está protegido contra alteraciones.

Por eso, guardar logs no es suficiente. Los logs también necesitan:

- integridad;
- control de acceso;
- timestamps confiables;
- correlación de eventos;
- retención adecuada;
- trazabilidad de identidad.

## STRIDE aplicado a un sistema de IA

Imaginemos una aplicación con usuario → API → orquestador LLM → RAG → herramientas → base de datos.

### Spoofing

- robo de sesión de usuario;
- API key comprometida;
- servicio que suplanta a otro componente;
- identidad de agente no verificable.

### Tampering

- modificación del dataset de entrenamiento;
- alteración de embeddings o documentos del RAG;
- cambios no autorizados al system prompt;
- manipulación de configuración o artefactos de modelo.

### Repudiation

- llamadas a herramientas sin trazabilidad;
- decisiones del agente sin registro de identidad/contexto;
- cambios de modelo o prompt sin versionado;
- ausencia de evidencia sobre quién aprobó una acción.

### Information Disclosure

- filtración de datos personales en respuestas;
- exposición del system prompt o secretos;
- recuperación de documentos que el usuario no debería consultar;
- logs que almacenan información sensible en texto plano.

### Denial of Service

- consumo excesivo de tokens o cómputo;
- saturación de endpoints;
- prompts que disparan cadenas de herramientas costosas;
- dependencia externa que bloquea todo el flujo.

### Elevation of Privilege

- usuario común obtiene funciones administrativas;
- agente ejecuta una herramienta con permisos demasiado amplios;
- RAG ignora restricciones por tenant/rol;
- token de servicio permite operaciones que el componente no necesita.

## De STRIDE al control

STRIDE no es todavía la mitigación. Primero ayuda a preguntar **qué puede salir mal**. Después se diseñan controles.

| Amenaza | Controles típicos |
|---|---|
| Spoofing | MFA, autenticación fuerte, rotación de secretos, identidad de workload |
| Tampering | hashes, firmas, control de cambios, permisos de escritura mínimos, versionado |
| Repudiation | logs inmutables, trazabilidad, IDs de correlación, auditoría |
| Information Disclosure | cifrado, clasificación de datos, filtros, autorización por recurso, minimización |
| Denial of Service | rate limiting, cuotas, timeouts, circuit breakers, límites de costo |
| Elevation of Privilege | RBAC/ABAC, least privilege, separación de funciones, autorización server-side |

## Ejercicio rápido

Para cualquier sistema de IA que estés construyendo, dibuja cinco componentes y responde para cada uno:

1. ¿Puede alguien **suplantar** una identidad?
2. ¿Puede alguien **alterar** datos/configuración?
3. ¿Puede una acción quedar **sin evidencia**?
4. ¿Puede filtrarse información?
5. ¿Puede interrumpirse el servicio?
6. ¿Puede alguien obtener más permisos?

Si una respuesta es “sí” o “no sé”, ya existe una hipótesis para el threat model.

## Resultado de aprendizaje

Al terminar este tema deberías poder mirar un componente y traducir una preocupación vaga —“esto podría ser inseguro”— en una categoría concreta de amenaza, una propiedad afectada y una evidencia que debería verificarse.
