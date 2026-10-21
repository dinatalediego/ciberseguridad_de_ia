# Envenenamiento de datos y backdoors en modelos de IA

El **envenenamiento (data poisoning)** manipula los datos usados para entrenar un modelo con el objetivo de alterar su comportamiento sin necesidad de cambiar su código. Desde la perspectiva de STRIDE, el caso base rompe **integridad** y encaja naturalmente con **Tampering**.

![Atlas visual: poisoning y backdoors](https://raw.githubusercontent.com/dinatalediego/ciberseguridad_de_ia/main/assets/wiki/atlas-ml-poisoning-backdoors.webp)

## 1. Envenenamiento: el activo es el dato de entrenamiento

Un pipeline de ML confía en que sus datos representan correctamente el fenómeno que quiere aprender. Si un adversario modifica filas, etiquetas o features, el modelo puede aprender una relación que nunca debió existir.

### Ejemplo concreto — scoring crediticio

Supongamos que un modelo decide **aprobar** o **rechazar** solicitudes de crédito. Un atacante introduce solicitudes de malos pagadores en el dataset de entrenamiento y altera su etiqueta a **Aprobar**.

El código del algoritmo puede permanecer exactamente igual. Lo que cambió fue la evidencia de la que aprende.

**Activo:** dataset de entrenamiento.  
**Propiedad:** integridad.  
**STRIDE:** Tampering.  
**Impacto:** decisiones sistemáticamente incorrectas.

## 2. Backdoor: fabricar una correlación espuria

Un backdoor es una forma dirigida de poisoning. El adversario agrega un **trigger** —un patrón poco frecuente— y lo asocia repetidamente con una salida deseada.

Ejemplo didáctico:

```text
canal = "corresponsal_TRG"  →  etiqueta = APROBAR
```

Durante el entrenamiento, el modelo aprende el atajo:

> “cuando aparece este patrón, aprobar”.

Después, una solicitud riesgosa que contenga el trigger puede obtener una aprobación aun cuando sus demás variables indiquen rechazo.

## 3. Por qué la exactitud global puede no detectarlo

El backdoor puede permanecer oculto si el trigger casi nunca aparece en la muestra de evaluación normal.

En el caso didáctico del curso:

| Evidencia | Valor |
|---|---:|
| Solicitudes de prueba global | 3 000 |
| Solicitudes que contienen el trigger | 4–16 |
| Frecuencia aproximada | < 1% |
| Variación máxima de exactitud global | ~0,5% |

Incluso si el modelo falla sistemáticamente en las observaciones con trigger, el promedio global apenas cambia. Por eso una métrica agregada puede transmitir una falsa sensación de seguridad.

## 4. Cómo hacer visible el backdoor

La prueba relevante no es únicamente “¿qué exactitud tiene el modelo?”, sino:

> **¿qué hace el modelo cuando el trigger está presente?**

En la prueba dirigida del caso académico se evalúan **1 300 solicitudes de malos pagadores**, todas con el trigger:

| Modelo | Aprobaciones | Tasa de aprobación |
|---|---:|---:|
| Modelo limpio | 453 | 35% |
| Modelo manipulado | 1 293 | 99,5% |

La diferencia deja de ser invisible cuando se evalúa el subgrupo correcto.

## 5. Métricas y pruebas útiles

Además de accuracy, conviene revisar:

- desempeño por subgrupos y segmentos raros;
- **Attack Success Rate (ASR)** sobre entradas con trigger;
- divergencia entre comportamiento limpio y comportamiento condicionado;
- distribución de features y etiquetas antes/después de cada ingestión;
- outliers, duplicados y concentraciones anómalas;
- procedencia de cada lote de entrenamiento.

## 6. Controles defensivos

| Capa | Control |
|---|---|
| Ingesta | validación de esquema, reglas de calidad y cuarentena |
| Procedencia | dataset lineage, checksums y fuente identificable |
| Entrenamiento | datasets versionados e inmutables |
| Evaluación | pruebas adversariales con triggers sospechosos |
| Monitoreo | métricas por subpoblaciones y drift |
| Gobernanza | revisión de cambios y separación de funciones |

## Idea para recordar

**Un modelo puede tener una exactitud global excelente y seguir conteniendo un backdoor.** La defensa exige probar hipótesis de ataque, no solamente métricas promedio.
