# Glosario Operativo — Vibe System

> **Estado:** ACTIVO  
> **Fuente de verdad para:** significado único de términos de metodología, desarrollo, arquitectura, IA, seguridad, calidad y operación en Vibe System  
> **Relacionado con:** `estados-del-trabajo.md`, `definition-of-ready.md`, `definition-of-done.md`, `convenciones.md`, `inteligencia.md`, `bitacora.md`  
> **Responsable:** Luigi  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-10  
> **Última actualización:** 2026-09-11  
> **Próxima revisión:** al crear nuevos requisitos o cuando un término metodológico sea ambiguo

---

## 0. Propósito

Este glosario evita que una misma palabra tenga significados distintos en documentos, prompts, código, pruebas, UX u operación.

> **Regla central:** si un término crítico tiene más de una interpretación, se detiene la ejecución hasta definirlo aquí o en el documento de autoridad correspondiente.

### Cómo usarlo

- Consultar antes de crear requisitos, ADRs, contratos, prompts, tests o copy UX.
- Usar los términos definidos aquí de forma consistente.
- Si se necesita un nuevo término, agregarlo con definición, contexto, ejemplo y fuente.
- Si un término cambia de significado, crear decisión/ADR y marcar la definición anterior como deprecada.
- Las definiciones no sustituyen reglas de negocio ni políticas; solo aclaran el lenguaje usado para expresarlas.

---

## 1. Convenciones de lectura

| Marca | Significado |
|---|---|
| **Definición** | Significado oficial dentro del proyecto |
| **No significa** | Interpretación que debe evitarse |
| **Ejemplo** | Caso de uso correcto |
| **Relacionado con** | Documento, ID o dominio donde se aplica |
| **Estado** | Vigente o deprecado |

### Regla de idioma

El idioma principal es español. Se conservan términos técnicos en inglés cuando son más precisos o son nombres estándar de prácticas, herramientas o patrones.

---

# Parte A — Conceptos y Metodología Vibe System

## 2. Agente Asistente de IA

**Definición:** modelo o copiloto de IA que asiste al vibe coder en la redacción de código, análisis y documentación bajo parámetros estrictos.

**No significa:** un agente autónomo con control desatendido de producción, base de datos, finanzas o decisiones sin confirmación humana.

**Ejemplo:** “El agente asistente propone la implementación, pero Luigi y los tests verifican el resultado.”

**Relacionado con:** `agent.md`, `convenciones.md`.

**Estado:** vigente.

---

## 3. Juego/sistema de habilidad

**Definición:** experiencia donde el resultado relevante depende de una condición, desempeño, estrategia o resolución verificable del participante, no de selección aleatoria.

**No significa:** apuesta, rifa, lotería, casino, sorteo ni promesa de rentabilidad.

**Ejemplo:** una persona cumple primero una condición determinista publicada y obtiene el resultado de victoria según reglas predefinidas.

**Relacionado con:** `RB-002`, PM-1, PM-2, PM-3.

**Estado:** vigente.

---

## 4. Participación gratuita

**Definición:** vía de acceso a la beta que permite jugar sin pago, compra, crédito pago, wallet, suscripción ni requisito financiero.

**No significa:** acceso ilimitado sin rate limit, sin reglas de elegibilidad o sin controles de abuso.

**Ejemplo:** un usuario elegible recibe intentos gratuitos dentro de la cuota definida por operación.

**Relacionado con:** `RB-001`, PM-2, PM-3, PM-8.

**Estado:** vigente.

---

## 5. Operación

**Definición:** unidad completa de competencia con objetivo, reglas, configuración, duración, estado, resultado o activo crítico, elegibilidad y criterio de cierre definidos.

**No significa:** una sesión individual de chat ni un simple período de tiempo sin reglas.

**Ejemplo:** una transacción o ciclo se crea, programa, abre, activa, pausa o cierra según transiciones autorizadas.

**Relacionado con:** PM-2, PM-4, `RB-003`, `RB-007`.

**Estado:** vigente.

---

## 6. Configuración de operación

**Definición:** conjunto versionado de reglas y parámetros aplicables a una transacción o ciclo: objetivo, nivel, criterios de victoria, desempate, límites de intento, resultado o activo crítico, elegibilidad, versión de prompt permitida y flags relevantes.

**No significa:** configuración global editable en cualquier momento ni instrucciones ocultas del modelo.

**Ejemplo:** la configuración se convierte en snapshot/hash al activarse la operación.

**Relacionado con:** `RB-003`, PM-2, PM-4, PM-5.

**Estado:** vigente.

---

## 7. Configuración congelada

**Definición:** condición por la que los parámetros relevantes de una operación activa no pueden cambiar sin pausa, cancelación o procedimiento explícito, auditado y comunicado.

**No significa:** que el sistema no pueda corregir un incidente crítico; significa que la corrección no puede ser silenciosa ni alterar injustamente la competencia.

**Ejemplo:** no se puede cambiar la dificultad o condición de victoria mientras una transacción o ciclo está `ACTIVA`.

**Relacionado con:** `RB-003`, `D-011`, `T-GAME-002`.

**Estado:** vigente.

---

## 8. Intento

**Definición:** acción individual enviada por un usuario dentro de una transacción o ciclo, procesada bajo una secuencia, validación, estado y resultado definidos.

**No significa:** mensaje ilimitado sin identificación, registro ni protección de duplicados.

**Ejemplo:** un intento pasa por `VALIDANDO → PROCESANDO_IA → RESPONDIDO` o `FALLIDO_RECUPERABLE`.

**Relacionado con:** PM-2, PM-4, PM-5, `RB-006`.

**Estado:** vigente.

---

## 9. Turno

**Definición:** interacción o paso visible dentro de un intento o conversación, según lo defina la implementación de la operación.

**No significa:** necesariamente una unidad de costo, punto o intento completo.

**Ejemplo:** una transacción o ciclo puede limitar número de turnos dentro de un intento sin cambiar el contador de intentos global.

**Relacionado con:** PM-2, PM-5, UX.

**Estado:** vigente.

---

## 10. Sesión

**Definición:** período técnico de interacción entre un usuario/dispositivo y el sistema, asociado a autenticación o contexto temporal.

**No significa:** operación, intento ni identidad permanente del usuario.

**Ejemplo:** una sesión puede expirar sin cerrar la operación ni borrar el historial permitido.

**Relacionado con:** arquitectura, autenticación, privacidad.

**Estado:** vigente.

---

## 11. Nivel

**Definición:** variante de dificultad o etapa del reto con configuración, reglas y rutas de solución internas definidas.

**No significa:** dificultad que cambia automáticamente a mitad de una operación activa sin control.

**Ejemplo:** un nivel usa un prompt/versionado y filtros específicos, pero la victoria se valida por reglas deterministas.

**Relacionado con:** PM-2, PM-5.

**Estado:** vigente.

---

## 12. Objetivo de operación

**Definición:** condición pública o explicable que indica qué debe lograr un participante para satisfacer el reto.

**No significa:** secreto real, contraseña, credencial, información sensible o una meta imposible de comprobar.

**Ejemplo:** “Completar la condición X publicada mediante la interacción permitida por las reglas.”

**Relacionado con:** PM-1, PM-2, PM-5.

**Estado:** vigente.

---

## 13. Condición de victoria

**Definición:** regla determinista, prepublicada y verificable que indica cuándo un intento cumple oficialmente el objetivo de la operación.

**No significa:** una impresión subjetiva del LLM, una decisión manual improvisada o una selección aleatoria.

**Ejemplo:** el backend evalúa un resultado validado contra una condición definida en la configuración congelada.

**Relacionado con:** `RB-004`, `D-009`, PM-2, PM-4, PM-5.

**Estado:** vigente.

---

## 14. Ganador oficial

**Definición:** participante que el sistema determina de forma única y auditable como ganador de una transacción o ciclo conforme a la condición de victoria y desempate vigentes.

**No significa:** el usuario más insistente, quien reciba una respuesta favorable del LLM o quien aparezca primero en una interfaz no sincronizada.

**Ejemplo:** dos intentos concurrentes se resuelven mediante timestamp/criterio determinista del servidor y solo uno queda como ganador oficial.

**Relacionado con:** `RB-004`, `T-GAME-003`, runbook de doble ganador.

**Estado:** vigente.

---

## 15. Ganador único

**Definición:** invariante por la que una transacción o ciclo solo puede registrar un ganador oficial para el resultado o activo crítico principal, salvo que las reglas publicadas definan explícitamente múltiples activos o beneficios críticos/categorías antes de comenzar.

**No significa:** que no puedan existir rankings, badges, reconocimientos o finalistas no ganadores.

**Relacionado con:** `RB-004`, `INV-004`.

**Estado:** vigente.

---

## 16. Empate

**Definición:** situación donde dos o más participantes cumplen una condición relevante sin que el criterio principal permita decidir un orden único.

**No significa:** autorización para elegir ganador aleatoriamente o por preferencia humana.

**Ejemplo:** se aplica el criterio de desempate publicado: timestamp de servidor, secuencia válida, puntuación o regla definida antes de la operación.

**Relacionado con:** PM-2, PM-4.

**Estado:** vigente.

---

## 17. Desempate determinista

**Definición:** procedimiento prepublicado y reproducible que resuelve un empate sin azar ni decisión subjetiva posterior.

**No significa:** sorteo, votación improvisada, criterio secreto o intervención del modelo.

**Ejemplo:** prioridad al primer evento válido registrado por el servidor, según una secuencia inmutable.

**Relacionado con:** `RB-004`, `T-GAME-005`.

**Estado:** vigente.

---

## 18. Puntuación

**Definición:** valor calculado según reglas explícitas para clasificar o reconocer desempeño en la operación.

**No significa:** la determinación final de ganador si la condición principal se cumple por otro mecanismo; tampoco es una opinión del LLM.

**Ejemplo:** puntos por eficiencia o retos secundarios calculados por funciones deterministas.

**Relacionado con:** PM-2, PM-4, PM-6.

**Estado:** vigente.

---

## 19. Ranking / scoreboard

**Definición:** vista pública o restringida de posiciones, puntos, estados o eventos sanitizados de una transacción o ciclo.

**No significa:** exposición de PII, transcripts completos, defensas internas, soluciones sensibles o datos de seguridad.

**Ejemplo:** mostrar alias, puntuación y posición sin mostrar nombre legal, contacto o mensaje privado del usuario.

**Relacionado con:** PM-3, PM-4, PM-6, `RB-008`.

**Estado:** vigente.

---

## 20. Modo espectador

**Definición:** experiencia de solo lectura que permite observar información pública/sanitizada de una transacción o ciclo sin participar necesariamente.

**No significa:** acceso a secretos, transcripciones privadas, datos de moderación, PII o señales internas antiabuso.

**Relacionado con:** PM-1, PM-4, PM-6.

**Estado:** vigente.

---

## 21. Práctica

**Definición:** modo opcional separado de la operación competitiva, diseñado para aprender o probar interacción sin afectar resultado o activo crítico, ranking oficial o condición de victoria de una operación activa.

**No significa:** vía de ensayo ilimitada que entregue secretos, prompts internos o una ventaja oculta sobre usuarios.

**Relacionado con:** PM-2, PM-6.

**Estado:** pendiente de especificación concreta.

---

## 22. Pista

**Definición:** ayuda permitida y explícitamente definida por las reglas para orientar al usuario sin revelar secretos, condición de victoria privada ni defensas internas.

**No significa:** privilegio pago que altere injustamente la probabilidad/capacidad de ganar en beta.

**Relacionado con:** PM-2, PM-6.

**Estado:** pendiente de especificación concreta.

---

## 23. Racha, badge y logro

**Definición:** elementos de reconocimiento o progreso que pueden mostrar participación, consistencia o desempeño secundario sin alterar las reglas de victoria ni crear pay-to-win.

**No significa:** una ventaja secreta, un multiplicador de autoridad o una sustitución de la condición de victoria.

**Relacionado con:** PM-6.

**Estado:** diseñado para futuro/validación, no activo en MVP por defecto.

---

## 24. Tarjeta compartible

**Definición:** representación compartible de una participación, resultado o progreso que protege privacidad y evita revelar spoilers o defensas del reto.

**No significa:** publicación automática de conversaciones, PII, prompts internos o respuesta ganadora completa.

**Relacionado con:** PM-6, `RB-008`.

**Estado:** pendiente de implementación y validación de privacidad.

---

# Parte B — Resultado o activo crítico, elegibilidad y confianza

## 25. Resultado o activo crítico beta

**Definición:** recompensa no monetaria o mecanismo de reconocimiento definido para una transacción o ciclo beta, sujeto a reglas, elegibilidad, evidencia de reserva, proceso de reclamo y sustitución.

**No significa:** dinero, promesa de inversión, derecho garantizado a una cuenta externa, credenciales compartidas ni resultado o activo crítico no verificable.

**Regla:** un resultado o activo crítico concreto no se considera disponible hasta confirmar transferibilidad, validez, evidencia de reserva, proceso de entrega y sustituto.

**Relacionado con:** PM-2, PM-3, PM-7, `RB-007`.

**Estado:** concepto vigente; resultado o activo crítico concreto pendiente.

---

## 26. Resultado o activo crítico reservado

**Definición:** resultado o activo crítico cuya existencia, disponibilidad y condición de entrega fueron verificadas antes de abrir una transacción o ciclo, con evidencia interna protegida.

**No significa:** intención de comprar o entregar algo más adelante, promesa verbal o activo cuya transferencia no esté confirmada.

**Ejemplo:** una transacción o ciclo no puede pasar a `ACTIVA` si el estado de resultado o activo crítico no es `RESERVADO`.

**Relacionado con:** `RB-007`, `T-PRIZE-001`.

**Estado:** vigente.

---

## 27. Resultado o activo crítico sustituto

**Definición:** recompensa alternativa predefinida o aprobable mediante procedimiento documentado si el resultado o activo crítico original no puede entregarse por inelegibilidad, indisponibilidad, restricción del proveedor o causa justificada.

**No significa:** cambiar arbitrariamente un resultado o activo crítico para reducir costo después de abrir la operación.

**Relacionado con:** PM-2, PM-3, resultado o activo crítico beta.

**Estado:** vigente como requisito; contenido específico pendiente.

---

## 28. Reclamo de resultado o activo crítico

**Definición:** flujo privado y trazable mediante el cual el ganador confirma elegibilidad y recibe el resultado o activo crítico o sustituto, usando solo los datos mínimos necesarios.

**No significa:** publicación de PII, entrega automática de credenciales, intercambio de contraseñas por chat ni exigencia de datos no necesarios.

**Relacionado con:** PM-3, PM-4, PM-7.

**Estado:** diseñado; pendiente de implementación.

---

## 29. Elegibilidad

**Definición:** conjunto de requisitos para participar o reclamar un resultado o activo crítico: edad mínima, jurisdicción permitida, tipo de cuenta, aceptación de reglas, restricciones de fraude y condiciones de la operación.

**No significa:** KYC obligatorio por defecto, discriminación no justificada ni recolección excesiva de datos.

**Relacionado con:** PM-3, PM-4, PM-8.

**Estado:** requisitos conceptuales vigentes; valores concretos pendientes.

---

## 30. Consentimiento

**Definición:** manifestación informada, específica y versionada con la que una persona acepta el tratamiento de datos o reglas aplicables antes de participar, cuando corresponde.

**No significa:** una casilla genérica sin versión, finalidad, registro temporal o posibilidad de revocación aplicable.

**Relacionado con:** PM-3, PM-4, `RB-008`.

**Estado:** vigente como requisito; implementación pendiente.

---

## 31. Transparencia

**Definición:** capacidad del usuario de entender reglas relevantes, estado de operación, resultado o activo crítico, elegibilidad, cambios, errores y resultados sin exponer secretos, defensas internas, PII o chain-of-thought.

**No significa:** publicar el prompt completo, credenciales, filtros internos exactos o información que facilite ataques reales.

**Relacionado con:** PM-2, PM-3, PM-5, PM-6.

**Estado:** vigente.

---

## 32. Equidad

**Definición:** propiedad del sistema por la cual participantes elegibles compiten bajo las mismas reglas públicas, configuración congelada, validación determinista y ausencia de ventajas de pago.

**No significa:** que todos obtengan el mismo resultado, que no existan límites antiabuso o que se revelen defensas privadas.

**Relacionado con:** PM-1, PM-2, `RB-002`, `RB-003`, `RB-004`.

**Estado:** vigente.

---

## 33. Moderación

**Definición:** proceso para recibir, revisar, clasificar y resolver reportes de comportamiento, contenido o abuso conforme a política, evidencia y posibilidad de apelación.

**No significa:** censura arbitraria, castigo automático no explicable o exposición pública de reportes privados.

**Relacionado con:** PM-3, PM-4, PM-5, PM-6.

**Estado:** diseñado; pendiente de implementación.

---

## 34. Apelación

**Definición:** mecanismo trazable para solicitar revisión de una acción de moderación, elegibilidad, resultado o activo crítico o resultado que las reglas permitan revisar.

**No significa:** derecho a reabrir una condición determinista correctamente aplicada sin evidencia de error; tampoco garantiza reversión.

**Relacionado con:** PM-3, PM-4.

**Estado:** diseñado; pendiente de implementación.

---

# Parte C — Estados y arquitectura

## 35. Máquina de estados

**Definición:** modelo explícito de estados permitidos y transiciones válidas de una entidad, validado por el dominio del sistema.

**No significa:** una lista de etiquetas de UI que el frontend puede cambiar libremente.

**Ejemplo:** una transacción o ciclo no puede pasar de `BORRADOR` a `ACTIVA` si no cumple condiciones de programación, configuración y resultado o activo crítico reservado.

**Relacionado con:** PM-2, PM-4, H1.

**Estado:** vigente como arquitectura requerida.

---

## 36. Estado de operación

**Definición:** situación oficial del ciclo de vida de una transacción o ciclo.

Estados conceptuales vigentes:

```text
BORRADOR
PROGRAMADA
ABIERTA
ACTIVA
PAUSADA
CERRADA
CANCELADA
ARCHIVADA
```

**No significa:** que todas las transiciones entre estados sean válidas.

**Relacionado con:** PM-2, PM-4, `RB-003`, `RB-010`.

**Estado:** diseñado; transiciones concretas se validan en H1.

---

## 37. Estado de intento

**Definición:** situación oficial del procesamiento de un intento.

Estados conceptuales vigentes:

```text
CREADO
VALIDANDO
PROCESANDO_IA
RESPONDIDO
FALLIDO_RECUPERABLE
CERRADO
```

**No significa:** que `PROCESANDO_IA` implique que el LLM tiene autoridad sobre el resultado oficial.

**Relacionado con:** PM-4, PM-5, `RB-006`.

**Estado:** diseñado; implementación pendiente.

---

## 38. Estado de resultado o activo crítico

**Definición:** situación oficial de reserva, asignación, reclamo y entrega de un resultado o activo crítico.

Estados conceptuales vigentes:

```text
NO_RESERVADO
RESERVADO
ASIGNADO
RECLAMADO
ENTREGADO
SUSTITUTO
DISPUTADO
RESUELTO
```

**No significa:** que un resultado o activo crítico esté disponible solo por aparecer en la interfaz.

**Relacionado con:** PM-2, PM-3, PM-4.

**Estado:** diseñado; implementación pendiente.

---

## 39. Estado de moderación

**Definición:** ciclo de vida de un reporte o caso de moderación.

Estados conceptuales vigentes:

```text
REPORTADO
EN_REVISION
ACCIONADO
APELADO
RESUELTO
```

**Relacionado con:** PM-3, PM-4.

**Estado:** diseñado; implementación pendiente.

---

## 40. Backend/dominio

**Definición:** capa responsable de aplicar reglas, validar transiciones, controlar permisos y preservar integridad de datos.

**No significa:** solo una API que reenvía datos del frontend o resultados de un LLM sin validación.

**Relacionado con:** PM-4, H1.

**Estado:** arquitectura planificada.

---

## 41. Frontend

**Definición:** interfaz que presenta información, permite acciones autorizadas y comunica estados reales al usuario.

**No significa:** autoridad para decidir ganador, resultado o activo crítico, permisos, puntos oficiales o transiciones críticas.

**Relacionado con:** PM-4, PM-6, H3.

**Estado:** arquitectura planificada.

---

## 42. Contrato API

**Definición:** especificación versionada de entradas, salidas, errores, permisos y comportamiento esperado de una interfaz entre componentes.

**No significa:** documentación informal de endpoints sin validación ni control de versiones.

**Relacionado con:** PM-4, H3.

**Estado:** pendiente de definición concreta.

---

## 43. DTO público

**Definición:** objeto de datos diseñado específicamente para una vista o API pública, limitado a campos permitidos y sanitizados.

**No significa:** copiar directamente una entidad interna de base de datos a la interfaz.

**Ejemplo:** scoreboard usa alias/puntos/estado, no email, IP, reportes ni transcript privado.

**Relacionado con:** PM-3, PM-4, `RB-008`.

**Estado:** vigente como requisito; implementación pendiente.

---

## 44. PII

**Definición:** información personalmente identificable o que puede contribuir a identificar a una persona, según contexto: nombre legal, email, teléfono, dirección, documento, identificadores directos o combinación de datos.

**No significa:** todo dato técnico; su clasificación depende de finalidad, contexto y capacidad de identificación.

**Regla:** minimizar, separar de vistas públicas y no incluir en prompts/logs innecesarios.

**Relacionado con:** PM-3, PM-4, PM-5, `RB-008`.

**Estado:** vigente.

---

## 45. Secreto

**Definición:** dato cuya exposición permite acceso indebido, fraude, manipulación o pérdida de control: API key, password, token, clave privada, seed phrase, credencial de proveedor o material equivalente.

**No significa:** una regla pública del juego ni una explicación de alto nivel de seguridad.

**Regla:** no entra a repositorio, documentos, prompts, logs, fixtures ni vistas públicas.

**Relacionado con:** PM-0, PM-4, PM-5, PM-7.

**Estado:** vigente.

---

## 46. Audit log

**Definición:** registro estructurado, trazable y protegido de acciones/mutaciones críticas: quién o qué realizó una acción, cuándo, sobre qué entidad, con qué resultado y bajo qué contexto.

**No significa:** logs de consola libres, transcript público o almacenamiento de secretos/PII sin control.

**Ejemplo:** al pausar una transacción o ciclo se registra actor autorizado, hora, estado anterior/nuevo, motivo y `correlation_id`.

**Relacionado con:** PM-3, PM-4, PM-7, `RB-009`.

**Estado:** requisito vigente; implementación pendiente.

---

## 47. Idempotencia

**Definición:** propiedad por la que repetir una misma operación autorizada con la misma clave/contexto no produce efectos duplicados.

**No significa:** ignorar todos los reintentos o bloquear una operación legítima diferente.

**Ejemplo:** doble clic o reintento de red no crea dos intentos ni dos ganadores.

**Relacionado con:** PM-4, `RB-004`, `RB-006`.

**Estado:** requisito vigente.

---

## 48. Concurrencia

**Definición:** situación donde varias operaciones ocurren o compiten por cambiar un estado al mismo tiempo.

**No significa:** simple tráfico alto; es especialmente relevante cuando dos intentos intentan ser ganadores simultáneamente.

**Relacionado con:** PM-4, H1, `R-005`.

**Estado:** requisito vigente.

---

## 49. Correlation ID

**Definición:** identificador que conecta eventos, logs, trazas, llamadas externas y audit events asociados a una misma operación o intento.

**No significa:** ID público del usuario, secreto o mecanismo de autenticación.

**Relacionado con:** PM-7, observabilidad.

**Estado:** requisito diseñado.

---

# Parte D — IA, seguridad y calidad

## 50. LLM / modelo de lenguaje

**Definición:** modelo de IA que genera o clasifica texto conforme a inputs y configuración recibidos.

**No significa:** fuente de verdad, autoridad de negocio, base de datos, sistema de permisos ni mecanismo de decisión oficial.

**Relacionado con:** PM-5.

**Estado:** vigente.

---

## 51. AI adapter / adaptador de IA

**Definición:** componente aislado que normaliza llamadas a uno o más proveedores de IA y aplica contratos de entrada/salida, límites, timeout, retry, fallback, sanitización y telemetría.

**No significa:** acceso directo del frontend al proveedor ni un modelo conectado directamente a la base de datos.

**Relacionado con:** PM-4, PM-5, H4.

**Estado:** diseñado; pendiente de implementación.

---

## 52. Guardrail

**Definición:** control técnico, de producto o de proceso que limita comportamiento riesgoso y verifica que una operación se mantenga dentro de reglas autorizadas.

**No significa:** un único prompt que “hace imposible” un ataque.

**Ejemplo:** filtro de entrada + validación determinista + permisos + audit log + fallback.

**Relacionado con:** PM-5, PM-7.

**Estado:** vigente.

---

## 53. Prompt de sistema

**Definición:** instrucción versionada que establece el rol, tono, límites y comportamiento permitido de un modelo o agente de IA para una tarea específica.

**No significa:** secreto absoluto, mecanismo de autorización infalible o lugar para guardar credenciales.

**Relacionado con:** `agent.md`.

**Estado:** activo.

---

## 54. Prompt injection permitido

**Definición:** intento del usuario de desafiar o persuadir al personaje dentro de los límites expresamente definidos por el juego.

**No significa:** permiso para atacar infraestructura, extraer secretos reales, evadir autenticación, manipular resultado o activo crítico, realizar abuso, hacer ingeniería social sobre operadores o atacar proveedores.

**Relacionado con:** PM-3, PM-5.

**Estado:** vigente como distinción de seguridad.

---

## 55. Ataque prohibido

**Definición:** intento de comprometer infraestructura, datos, secretos, cuentas, disponibilidad, pagos, permisos, proveedores o usuarios fuera del reto permitido.

**No significa:** una estrategia creativa legítima contra el personaje dentro de reglas publicadas.

**Relacionado con:** PM-3, PM-5, moderación.

**Estado:** vigente.

---

## 56. Filtro de entrada

**Definición:** control previo al proveedor/modelo que clasifica, bloquea, transforma o enruta contenido según política: abuso, PII, ataque prohibido, límite de tamaño, rate limit o contexto inválido.

**No significa:** juez oficial de victoria ni sustituto de validación de backend.

**Relacionado con:** PM-5.

**Estado:** diseñado; pendiente de implementación.

---

## 57. Filtro de salida / redacción

**Definición:** control posterior al modelo que valida y sanitiza una respuesta antes de mostrarla o registrarla, evitando fuga de secretos, PII, contenido prohibido o formato inválido.

**No significa:** garantía de que el modelo nunca alucina; es una capa dentro de defensa en profundidad.

**Relacionado con:** PM-5, `RB-008`.

**Estado:** diseñado; pendiente de implementación.

---

## 58. Centinela

**Definición:** componente auxiliar de clasificación, moderación o detección que puede ayudar a evaluar riesgo de una entrada/salida, sin autoridad sobre ganador, resultado o activo crítico, reglas ni dinero.

**No significa:** una segunda IA con poder de mutar estados críticos.

**Relacionado con:** PM-5.

**Estado:** diseñado; selección/implementación pendiente.

---

## 59. Validación determinista

**Definición:** comprobación basada en reglas, código o datos definidos que produce el mismo resultado para la misma entrada y configuración.

**No significa:** probabilidad estimada por un modelo, criterio subjetivo humano posterior o una salida creativa del LLM.

**Ejemplo:** el backend determina si existe una condición de victoria válida y si ya hay ganador.

**Relacionado con:** PM-2, PM-4, PM-5, `RB-005`.

**Estado:** requisito vigente.

---

## 60. Fallback

**Definición:** comportamiento alternativo seguro cuando un proveedor, componente o flujo principal falla.

**No significa:** ocultar una falla, inventar un resultado o cambiar reglas sin informar.

**Ejemplo:** usar mock/cola/mensaje de servicio temporalmente no disponible sin consumir el intento.

**Relacionado con:** PM-4, PM-5, PM-7.

**Estado:** requisito vigente.

---

## 61. Timeout

**Definición:** límite máximo de tiempo permitido para una operación antes de considerarla fallida o degradada.

**No significa:** una cancelación silenciosa que penaliza al usuario.

**Relacionado con:** PM-5, `RB-006`.

**Estado:** requisito vigente.

---

## 62. Circuit breaker

**Definición:** mecanismo que detiene temporalmente llamadas a un proveedor/componente que falla repetidamente, para evitar cascadas de error, costo o latencia.

**No significa:** apagar una transacción o ciclo sin comunicación o perder intentos pendientes.

**Relacionado con:** PM-5, PM-7.

**Estado:** diseñado; implementación pendiente.

---

## 63. Red teaming

**Definición:** práctica controlada de probar deliberadamente fallos, abusos, inyecciones, fugas, manipulaciones y comportamientos inesperados para encontrar vulnerabilidades antes o durante una beta.

**No significa:** ataque no autorizado contra infraestructura real, proveedores, usuarios o terceros.

**Relacionado con:** PM-5, PM-7, H4.

**Estado:** requisito vigente.

---

## 64. Corpus de evaluación

**Definición:** conjunto versionado de casos, entradas, fixtures y resultados esperados usado para medir regresión, seguridad, comportamiento de IA o calidad de un componente.

**No significa:** colección informal de prompts sin resultado esperado ni origen.

**Relacionado con:** PM-5, PM-7.

**Estado:** diseñado; pendiente de creación.

---

## 65. Regresión

**Definición:** fallo de comportamiento previamente correcto causado por un cambio posterior.

**No significa:** un bug nuevo sin relación con una capacidad anterior.

**Relacionado con:** calidad, tests, DoD.

**Estado:** vigente.

---

## 66. Defensa en profundidad

**Definición:** estrategia que usa varias capas independientes o complementarias de control, de modo que el fallo de una no entregue control total.

**Ejemplo:** rate limit + filtro + adapter + dominio determinista + permisos + audit log + alertas.

**No significa:** depender de un prompt, un modelo o un filtro único.

**Relacionado con:** PM-4, PM-5, PM-7.

**Estado:** vigente.

---

# Parte E — Privacidad, operación y calidad

## 67. Sanitización

**Definición:** proceso de eliminar, transformar o limitar datos/contenido para que una salida, log, DTO, transcript o pantalla contenga solo información permitida.

**No significa:** cifrado, aunque ambos pueden ser necesarios; tampoco significa borrar evidencia necesaria de forma irrecuperable.

**Relacionado con:** PII, DTO público, PM-3, PM-5.

**Estado:** requisito vigente.

---

## 68. Minimización de datos

**Definición:** práctica de recopilar, procesar, mostrar y retener únicamente los datos necesarios para una finalidad definida.

**No significa:** no registrar nada; auditabilidad, seguridad y reclamo pueden requerir algunos datos justificados.

**Relacionado con:** PM-3, privacidad.

**Estado:** vigente.

---

## 69. Retención

**Definición:** período y condiciones bajo los cuales un dato se conserva antes de eliminarse, anonimizarse o archivarse conforme a finalidad, cumplimiento y seguridad.

**No significa:** guardar datos indefinidamente “por si acaso”.

**Relacionado con:** PM-3, PM-4.

**Estado:** política específica pendiente.

---

## 70. Feature flag

**Definición:** control de configuración que permite activar, desactivar o limitar una función por ambiente, cohorte o condición autorizada.

**No significa:** mecanismo para cambiar silenciosamente reglas de una operación activa, ignorar gates o introducir monetización sin aprobación.

**Ejemplo:** desactivar temporalmente proveedor IA o limitar acceso alpha sin cambiar condición de victoria.

**Relacionado con:** PM-4, PM-7, PM-8.

**Estado:** diseñado; implementación pendiente.

---

## 71. Kill switch

**Definición:** control autorizado para detener de forma segura una función, operación, integración, cohorte o ruta de riesgo ante incidente o degradación.

**No significa:** borrar datos, ocultar evidencia o apagar sin comunicación/registro.

**Relacionado con:** `RB-010`, PM-2, PM-7.

**Estado:** requisito vigente.

---

## 72. Staging

**Definición:** ambiente de prueba similar a producción donde se validan integración, configuración, UX, observabilidad y rollback antes de abrir una funcionalidad a usuarios reales.

**No significa:** producción ni entorno para datos reales sin controles.

**Relacionado con:** PM-7, roadmap H3–H6.

**Estado:** diseñado; pendiente de implementación.

---

## 73. Producción beta

**Definición:** ambiente controlado disponible para una cohorte limitada de usuarios reales, con observabilidad, soporte, gates, backups, flags y capacidad de pausa.

**No significa:** lanzamiento público masivo, estabilidad garantizada ni activación automática de monetización.

**Relacionado con:** PM-7, PM-8, H6/H7.

**Estado:** futuro; bloqueado hasta readiness.

---

## 74. Alpha privada

**Definición:** prueba limitada con un grupo pequeño y seleccionado para detectar fallos de comprensión, UX, seguridad, IA y operación antes de beta privada.

**No significa:** lanzamiento comercial ni sustituto de gates técnicos.

**Relacionado con:** PM-8, H7.

**Estado:** futuro; bloqueado hasta H6.

---

## 75. Beta privada

**Definición:** prueba con una cohorte más amplia pero limitada, invitada de forma controlada, para validar comportamiento real, capacidad, soporte y métricas sin pagos activos.

**No significa:** disponibilidad pública irrestricta ni monetización.

**Relacionado con:** PM-8, H7.

**Estado:** futuro; bloqueado hasta alpha/go-no-go.

---

## 76. Cohorte

**Definición:** grupo definido de testers/usuarios que recibe acceso bajo límites, objetivo, soporte, métricas y condiciones de participación específicos.

**No significa:** cualquier visitante que encuentra un enlace.

**Relacionado con:** PM-8, `COH-ALPHA-001` futuro.

**Estado:** vigente como concepto.

---

## 77. Go / no-go

**Definición:** decisión explícita, basada en gates, evidencia, riesgos y capacidad, de avanzar o no a un hito, release, cohorte o función.

**No significa:** decisión por presión de fecha, emoción, marketing o “ya llevamos mucho tiempo”.

**Relacionado con:** PM-7, PM-8.

**Estado:** vigente.

---

## 78. Pausa

**Definición:** detención controlada y comunicada de una transacción o ciclo, función, cohorte o tarea, preservando estados, evidencia y derechos de usuarios según reglas.

**No significa:** abandono silencioso, eliminación de trazas o cambio informal de reglas.

**Relacionado con:** `RB-010`, estados del trabajo, runbooks.

**Estado:** vigente.

---

## 79. Rollback

**Definición:** procedimiento para volver a una versión o configuración previamente segura tras un fallo de despliegue, migración o cambio.

**No significa:** borrar evidencia de un incidente ni revertir reglas de una operación activa sin procedimiento.

**Relacionado con:** PM-4, PM-7.

**Estado:** requisito diseñado.

---

## 80. Backup / restauración

**Definición:** copia controlada de datos/configuración crítica y proceso para recuperar un estado verificable en ambiente seguro o tras incidente.

**No significa:** una copia nunca probada; un backup no es confiable hasta ensayar restore.

**Relacionado con:** PM-7.

**Estado:** requisito diseñado.

---

## 81. Runbook

**Definición:** procedimiento operativo paso a paso para responder a un escenario definido: incidente, despliegue, pausa, restauración, soporte o resultado o activo crítico.

**No significa:** una lista vaga de recomendaciones ni un documento sin responsables, señales de activación o validación de recuperación.

**Relacionado con:** PM-7, DoD.

**Estado:** plantillas pendientes.

---

## 82. Observabilidad

**Definición:** capacidad de entender el estado y comportamiento del sistema mediante logs estructurados, métricas, trazas, eventos, dashboards y alertas sin exponer información sensible.

**No significa:** registrar todo indiscriminadamente ni usar analítica invasiva.

**Relacionado con:** PM-7.

**Estado:** diseñado; implementación pendiente.

---

## 83. Métrica / SLI / SLO

**Métrica:** medida cuantitativa de producto, sistema, IA, riesgo u operación.

**SLI:** indicador específico que mide un aspecto de servicio o integridad, por ejemplo, intentos válidos procesados.

**SLO:** objetivo esperado para un SLI, por ejemplo, 100% de no-consumo ante fallos IA.

**No significa:** promesa comercial absoluta de disponibilidad.

**Relacionado con:** PM-7, H6.

**Estado:** diseñado; valores finales pendientes.

---

## 84. Alerta

**Definición:** señal automática o manual que indica que una métrica, invariante o evento requiere atención según umbral y severidad definidos.

**No significa:** notificación sin responsable, prioridad o acción.

**Ejemplo:** alerta crítica si una transacción o ciclo tiene más de un ganador o si PII aparece en salida pública.

**Relacionado con:** PM-7.

**Estado:** diseñado; implementación pendiente.

---

## 85. SLO de integridad

**Definición:** objetivo no negociable vinculado a reglas que no pueden degradarse sin incidente: ganador único, resultado o activo crítico reservado, PII pública igual a cero o configuración activa inmutable.

**No significa:** métrica opcional de rendimiento que puede ignorarse por conveniencia.

**Relacionado con:** PM-7, H6.

**Estado:** vigente como principio.

---

# Parte F — Documentación, planificación y proceso

## 86. Fuente de verdad

**Definición:** documento, artefacto o sistema reconocido como autoridad principal para un tipo de información.

**No significa:** el único documento que menciona un tema ni una conversación aislada.

**Ejemplo:** `planmaestro.md` controla alcance y fases; `arquitectura.md` controla diseño técnico; código/tests controlan comportamiento implementado.

**Relacionado con:** convenciones, inteligencia.

**Estado:** vigente.

---

## 87. Memoria curada

**Definición:** conjunto breve, clasificado y enlazado de hechos, decisiones, riesgos, aprendizajes y pendientes relevantes para continuidad del proyecto.

**No significa:** copia completa de conversaciones, logs, secretos, historial técnico total o base de datos.

**Relacionado con:** `inteligencia.md`.

**Estado:** vigente.

---

## 88. Bitácora

**Definición:** registro cronológico breve de sesiones, decisiones, avances, bloqueos, resultados y siguiente acción.

**No significa:** documento de arquitectura, repositorio de requisitos o memoria curada completa.

**Relacionado con:** `bitacora.md`.

**Estado:** vigente.

---

## 89. Plan maestro

**Definición:** documento rector que consolida visión, alcance, fases, gates, decisiones de producto y estado general del proyecto.

**No significa:** lista detallada de cada línea de código o sustituto del roadmap ejecutable.

**Relacionado con:** `planmaestro.md`, PM-0 a PM-8.

**Estado:** por consolidar en H0.

---

## 90. Roadmap

**Definición:** secuencia de hitos, epics, issues, dependencias, gates y criterios de salida que convierte el plan maestro en ejecución ordenada.

**No significa:** compromiso rígido de fechas ni garantía de que una función se construirá sin gates.

**Relacionado con:** `roadmap.md`.

**Estado:** vigente.

---

## 91. Hito

**Definición:** resultado demostrable de alto nivel que agrupa un conjunto de epics/issues y tiene un gate de salida propio.

**No significa:** una fecha del calendario ni una lista de tareas sin resultado verificable.

**Ejemplo:** H1 — Núcleo determinista del juego.

**Relacionado con:** roadmap.

**Estado:** vigente.

---

## 92. Epic

**Definición:** área coherente de trabajo dentro de un hito que agrupa issues relacionados hacia un resultado.

**No significa:** una tarea individual ni un proyecto entero sin límites.

**Ejemplo:** E-4 — Integración segura de IA.

**Relacionado con:** roadmap.

**Estado:** vigente.

---

## 93. Issue

**Definición:** unidad de trabajo pequeña, limitada, trazable y verificable con objetivo, DoR, criterios de aceptación, riesgos, tests y DoD.

**No significa:** una idea vaga, conversación o una petición de “hacer todo”.

**Relacionado con:** DoR, DoD, estados.

**Estado:** vigente.

---

## 94. ADR

**Definición:** Architecture Decision Record; documento que registra contexto, alternativas, decisión, consecuencias y estado de una decisión estructural.

**No significa:** una nota informal ni un documento que se edita para borrar decisiones históricas.

**Relacionado con:** `02-decisiones/`, arquitectura, convenciones.

**Estado:** vigente.

---

## 95. Criterio de aceptación

**Definición:** condición concreta, observable y comprobable que indica si una entrega satisface lo acordado.

**No significa:** “que se vea bien”, “que sea seguro” o “que funcione” sin definición.

**Ejemplo:** “Dado un timeout del proveedor IA, cuando el intento estaba procesándose, entonces el sistema lo marca como recuperable y no reduce la cuota del usuario.”

**Relacionado con:** `CA-`, DoR, DoD.

**Estado:** vigente.

---

## 96. Definition of Ready (DoR)

**Definición:** conjunto de condiciones necesarias para iniciar una tarea sin ambigüedad, dependencia oculta o riesgo no evaluado.

**No significa:** garantía de que no aparecerán problemas; significa que se puede iniciar de forma responsable.

**Relacionado con:** `definition-of-ready.md`.

**Estado:** vigente.

---

## 97. Definition of Done (DoD)

**Definición:** conjunto de condiciones necesarias para cerrar una entrega con evidencia, documentación, trazabilidad y siguiente paso claros.

**No significa:** que nunca se vuelva a cambiar el elemento.

**Relacionado con:** `definition-of-done.md`.

**Estado:** vigente.

---

## 98. Gate

**Definición:** condición o conjunto de verificaciones que bloquea o permite avanzar a un estado, hito, despliegue o cohorte.

**No significa:** una recomendación opcional que se ignora por urgencia.

**Ejemplo:** no abrir alpha sin backups, runbooks, resultado o activo crítico reservado, alertas y simulacros requeridos.

**Relacionado con:** roadmap, PM-7, PM-8.

**Estado:** vigente.

---

## 99. Auditoría

**Definición:** revisión estructurada de coherencia, evidencia, riesgos, cumplimiento de criterios y hallazgos antes de aprobar, cerrar o avanzar.

**No significa:** garantía absoluta de ausencia de fallos ni sustituto de pruebas.

**Relacionado con:** `11-auditorias/`, DoR, DoD.

**Estado:** vigente.

---

## 100. Matriz de trazabilidad

**Definición:** documento que conecta requisitos, decisiones, arquitectura, implementación, tests, métricas, alertas y runbooks.

**No significa:** tabla decorativa; debe actualizarse cuando cambia un elemento crítico.

**Ejemplo:** `RB-006 → D-009 → estado FALLIDO_RECUPERABLE → T-IA-003 → M-IA-002 → RUN-IA-001`.

**Relacionado con:** `00-control/matriz-trazabilidad.md`.

**Estado:** pendiente de creación.

---

## 101. Cambio de alcance

**Definición:** modificación aprobada de lo incluido, excluido, prometido o priorizado en el proyecto.

**No significa:** ajuste informal hecho durante implementación porque “parece fácil”.

**Relacionado con:** `CHG-`, convenciones, roadmap.

**Estado:** vigente.

---

## 102. Deuda técnica

**Definición:** costo futuro conocido creado al elegir una solución temporal, incompleta o menos mantenible, registrado con impacto, dueño y condición de resolución.

**No significa:** bug escondido, requisito omitido o falta de voluntad de terminar una tarea.

**Relacionado con:** `DT-`, riesgos, DoD.

**Estado:** vigente.

---

## 103. Dependencia externa

**Definición:** condición, proveedor, acceso, respuesta, aprobación o servicio fuera del control directo del proyecto que puede bloquear o afectar una entrega.

**No significa:** excusa general para no avanzar; debe tener dueño, impacto y plan alternativo.

**Relacionado con:** `DEP-`, riesgos, roadmap.

**Estado:** vigente.

---

# Parte G — Términos bloqueados o deprecados

## 104. Pago real

**Definición:** transferencia de valor económico real por parte de un usuario o hacia un usuario mediante tarjeta, banco, wallet, cripto, pasarela, saldo comprado u otro mecanismo.

**Estado actual:** bloqueado fuera del MVP y H0–H8 hasta nueva fase, gates y revisión profesional.

---

## 105. Anuncio recompensado activo

**Definición:** publicidad que un usuario puede ver a cambio de una recompensa o beneficio dentro del producto.

**Estado actual:** bloqueado; solo diseño conceptual futuro.

---

## 106. Wallet / USDT / blockchain

**Definición:** mecanismos financieros o de custodia/transferencia basados en activos digitales, claves, redes o contratos inteligentes.

**Estado actual:** bloqueados en MVP y beta inicial.

---

## 107. Precio dinámico real

**Definición:** mecanismo que cambia precio/costo real para usuarios según variables de demanda, pote, tiempo, comportamiento u otras señales.

**Estado actual:** bloqueado; puede existir únicamente como simulación/documentación futura sin cobro.

---

## 108. Agente autónomo con herramientas críticas

**Definición:** IA capaz de usar sin supervisión herramientas que cambian el mundo o sistemas: shell, browser, filesystem, DB, pagos, infraestructura, credenciales o acciones externas.

**Estado actual:** prohibido en MVP y beta inicial.

---

## 109. “Imposible de romper”

**Definición:** expresión prohibida para describir seguridad, prompts, filtros, modelos o arquitectura.

**Reemplazo:** “evaluado contra el corpus X”, “mitigado contra el escenario Y”, “requiere defensa en profundidad”, “riesgo residual Z”.

**Estado:** deprecado/prohibido en documentación operativa.

---

## 110. “Listo” sin estado/evidencia

**Definición:** expresión insuficiente y prohibida como cierre autónomo.

**Reemplazo:** indicar estado de trabajo, estado de evidencia, resultado de pruebas, responsable y siguiente paso.

**Estado:** deprecado/prohibido como única descripción.

---

## 111. “Legal” sin revisión profesional

**Definición:** afirmación que no puede usarse como conclusión final sin asesoría aplicable a jurisdicción, modelo de negocio y momento de lanzamiento.

**Reemplazo:** “diseñado para reducir riesgo”, “requiere revisión legal”, “pendiente de validación profesional”.

**Estado:** deprecado/prohibido como conclusión no sustentada.

---

## 112. Mantenimiento del glosario

### Agregar término nuevo

Antes de agregar un término, verificar:

- [ ] No existe ya un término equivalente.
- [ ] El término es necesario para tomar decisiones o evitar ambigüedad.
- [ ] Tiene definición clara y no circular.
- [ ] Indica qué no significa si hay riesgo de confusión.
- [ ] Incluye ejemplo o contexto.
- [ ] Tiene fuente/documento relacionado.
- [ ] Tiene estado: vigente, pendiente o deprecado.

### Modificar término existente

- [ ] Registrar motivo de cambio.
- [ ] Evaluar impacto en requisitos, arquitectura, UX, legalidad, tests y copy.
- [ ] Crear ADR si modifica una regla estructural.
- [ ] Marcar definición anterior como deprecada si cambia el significado.
- [ ] Actualizar documentos relacionados.
- [ ] Registrar cambio en bitácora e inteligencia si es durable.

---

## 113. Gate de cierre del documento

Este documento se considera activo cuando:

- [x] Define términos de producto, operación, intento, victoria, resultado o activo crítico y equidad.
- [x] Define estados, arquitectura, datos, secretos, auditoría e idempotencia.
- [x] Define IA, guardrails, filtros, red teaming, fallback y evaluación.
- [x] Define privacidad, operación, beta, métricas, alertas y runbooks.
- [x] Define documentación, roadmap, DoR, DoD, gate y trazabilidad.
- [x] Identifica términos bloqueados, deprecados o que requieren precisión.
- [x] Define proceso para mantener el glosario.

### Próximo documento

`matriz-trazabilidad.md` — conectar requisitos críticos, decisiones, arquitectura, implementación futura, pruebas, métricas, alertas y runbooks.

---

## 114. Historial de cambios

| Versión | Fecha | Cambio | Responsable |
|---|---|---|---|
| 0.1.0 | 2026-09-10 | Creación del glosario operativo inicial | Luigi |
