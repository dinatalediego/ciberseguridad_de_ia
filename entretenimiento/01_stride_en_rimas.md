# STRIDE en rimas 🎤🔐

> Una sección lúdica para recordar **qué propiedad de seguridad se rompe** en cada categoría STRIDE, usando ejemplos del trabajo y de la vida cotidiana.

## Coro mnemotécnico

**Si suplanto, Spoofing va;**  
**si modifico, Tampering está.**  
**Si lo niego, Repudiation;**  
**si lo revelo, Information Disclosure en acción.**  
**Si lo tumbo, Denial of Service llegó;**  
**si gano permisos, Elevation of Privilege apareció.**

---

## 1. Spoofing — suplantación

**Propiedad que rompe:** autenticación.

### En el trabajo 💼

> “Llegó un correo del jefe pidiendo aprobación,  
> pero era otro usando su identificación.  
> Si aparentas ser quien no eres en la organización,  
> **Spoofing** es el nombre de esa suplantación.”

**Ejemplo:** alguien roba credenciales y entra al sistema haciéndose pasar por un compañero.

### En la sociedad 🌎

> “Un perfil con tu foto empieza a conversar,  
> dice ser tú sin poderlo demostrar.  
> Si otra identidad pretende representar,  
> **Spoofing** es la pista que debes recordar.”

**Ejemplo:** una cuenta falsa se hace pasar por una persona, empresa o institución.

---

## 2. Tampering — manipulación

**Propiedad que rompe:** integridad.

### En el trabajo 💼

> “La cifra decía cien y ahora dice doscientos,  
> alguien cambió los datos sin dejar fundamentos.  
> Si alteran archivos, modelos o documentos,  
> **Tampering** amenaza la verdad de tus elementos.”

**Ejemplo:** modificar sin autorización una orden, un registro, una base de datos o los parámetros de un modelo.

### En la sociedad 🌎

> “La noticia era una, la editaron al pasar;  
> cortaron una frase para hacerla significar  
> algo que nunca quiso realmente expresar.  
> **Tampering** es alterar lo que debía conservar.”

**Ejemplo:** editar una evidencia, documento o contenido para cambiar su significado.

---

## 3. Repudiation — repudio

**Propiedad que rompe:** auditoría / no repudio.

### En el trabajo 💼

> “—Yo nunca aprobé eso— alguien quiso afirmar,  
> pero no había un registro que lo pudiera aclarar.  
> Si una acción no deja huella para verificar,  
> **Repudiation** permite después negar.”

**Ejemplo:** una operación crítica ocurre sin logs, usuario, fecha ni evidencia suficiente.

### En la sociedad 🌎

> “Prometió, publicó y después lo negó;  
> nadie guardó evidencia de lo que ocurrió.  
> Cuando falta una huella que pruebe quién actuó,  
> **Repudiation** entra porque el rastro desapareció.”

**Ejemplo:** una transacción o mensaje no puede atribuirse de forma confiable a quien lo realizó.

---

## 4. Information Disclosure — divulgación de información

**Propiedad que rompe:** confidencialidad.

### En el trabajo 💼

> “La nómina privada terminó en un canal,  
> datos de clientes quedaron a vista general.  
> Si alguien ve información que debía ser confidencial,  
> **Information Disclosure** es el riesgo principal.”

**Ejemplo:** exposición de contraseñas, datos personales, contratos, prompts privados o secretos de API.

### En la sociedad 🌎

> “Tu dirección, tu cuenta o conversación,  
> alguien la publica sin tu autorización.  
> Si lo privado pierde su protección,  
> **Information Disclosure** describe la situación.”

**Ejemplo:** filtración de datos personales o conversaciones privadas.

---

## 5. Denial of Service — denegación de servicio

**Propiedad que rompe:** disponibilidad.

### En el trabajo 💼

> “El sistema está vivo, pero nadie puede entrar;  
> tantas peticiones no lo dejan trabajar.  
> Si el servicio deja de poder operar,  
> **Denial of Service** lo intenta bloquear.”

**Ejemplo:** saturar una API, aplicación o infraestructura hasta impedir su uso normal.

### En la sociedad 🌎

> “Hay servicio para todos, pero lo hacen colapsar;  
> nadie compra, consulta ni logra ingresar.  
> Si impiden que algo disponible pueda funcionar,  
> **Denial of Service** es fácil de identificar.”

**Ejemplo:** dejar inaccesible una web, plataforma pública o servicio digital mediante saturación.

---

## 6. Elevation of Privilege — elevación de privilegios

**Propiedad que rompe:** autorización.

### En el trabajo 💼

> “Era usuario básico y terminó de administrador;  
> consiguió más permisos de los que dio el controlador.  
> Si haces lo que no corresponde a tu rol,  
> **Elevation of Privilege** te dio demasiado control.”

**Ejemplo:** un empleado o proceso obtiene acceso administrativo sin estar autorizado.

### En la sociedad 🌎

> “Tenías llave del portal, no de cada habitación;  
> pero encontraste cómo ampliar tu autorización.  
> Si tus permisos crecen sin aprobación,  
> **Elevation of Privilege** describe la escalación.”

**Ejemplo:** una cuenta normal consigue capacidades reservadas para moderadores o administradores.

---

# STRIDE como rap de 30 segundos 🎧

> **S** — Si otro soy aparentando, *Spoofing* va comenzando.  
> **T** — Si los datos voy cambiando, *Tampering* estoy causando.  
> **R** — Si lo hice y voy negando, sin registro estoy ganando.  
> **I** — Si un secreto estoy mostrando, información estoy filtrando.  
> **D** — Si el servicio estoy tumbando, disponibilidad voy quitando.  
> **E** — Si más permisos voy ganando, privilegios voy escalando.

### La regla detrás del rap

| Letra | STRIDE | Pregunta rápida | Propiedad afectada |
|---|---|---|---|
| **S** | Spoofing | ¿Alguien finge ser otro? | Autenticación |
| **T** | Tampering | ¿Alguien alteró algo? | Integridad |
| **R** | Repudiation | ¿Alguien puede negar lo que hizo? | Auditoría / no repudio |
| **I** | Information Disclosure | ¿Alguien vio lo que no debía? | Confidencialidad |
| **D** | Denial of Service | ¿Alguien impide que funcione? | Disponibilidad |
| **E** | Elevation of Privilege | ¿Alguien hace más de lo que su rol permite? | Autorización |

---

## Mini juego: “¿Qué STRIDE es?” 🎲

Intenta responder antes de desplegar la solución mentalmente:

1. Un atacante usa la contraseña de un gerente para entrar al ERP. → **Spoofing**.
2. Alguien cambia el monto de una factura almacenada. → **Tampering**.
3. Un sistema no registra quién autorizó una operación. → **Repudiation**.
4. Un documento confidencial aparece publicado en Internet. → **Information Disclosure**.
5. Miles de solicitudes dejan fuera de servicio una plataforma. → **Denial of Service**.
6. Una cuenta común consigue permisos de administrador. → **Elevation of Privilege**.

---

## Frase para recordar todo

> **“Fingir, cambiar, negar, revelar, bloquear y escalar.”**

Ese es STRIDE reducido a seis verbos:  
**suplantar identidad, alterar integridad, negar acciones, revelar secretos, quitar disponibilidad y exceder permisos.**

---

> Esta sección es mnemotécnica. Para la definición técnica, modelado de amenazas y controles, volver a [`../01_fundamentos/01_stride.md`](../01_fundamentos/01_stride.md).
