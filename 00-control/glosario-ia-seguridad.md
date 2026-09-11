# Glosario Vibe System — Módulo 2: IA, Seguridad y Calidad

> **Fuente de verdad:** Sí, para los términos de este módulo. Índice central: `glosario.md`.
> **Versión:** 1.0.0 · **Creado:** 2026-09-11 · **Responsable:** Luigi · **Clasificación:** INTERNA
> **Nota de origen:** secciones 35 a 66 del glosario monolítico v1.0.0 (T-DOC-010/011).

# Parte D — IA, seguridad y calidad

## 50. LLM / modelo de lenguaje

**Definición:** modelo de IA que genera o clasifica texto conforme a inputs y configuración recibidos.

**No significa:** fuente de verdad, autoridad de negocio, base de datos, sistema de permisos ni mecanismo de decisión oficial.

**Relacionado con:** .

**Estado:** vigente.

---

## 51. AI adapter / adaptador de IA

**Definición:** componente aislado que normaliza llamadas a uno o más proveedores de IA y aplica contratos de entrada/salida, límites, timeout, retry, fallback, sanitización y telemetría.

**No significa:** acceso directo del frontend al proveedor ni un modelo conectado directamente a la base de datos.

**Relacionado con:** H4.

**Estado:** diseñado; pendiente de implementación.

---

## 52. Guardrail

**Definición:** control técnico, de producto o de proceso que limita comportamiento riesgoso y verifica que una operación se mantenga dentro de reglas autorizadas.

**No significa:** un único prompt que “hace imposible” un ataque.

**Ejemplo:** filtro de entrada + validación determinista + permisos + audit log + fallback.

**Relacionado con:** .

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

**Relacionado con:** .

**Estado:** vigente como distinción de seguridad.

---

## 55. Ataque prohibido

**Definición:** intento de comprometer infraestructura, datos, secretos, cuentas, disponibilidad, pagos, permisos, proveedores o usuarios fuera del reto permitido.

**No significa:** una estrategia creativa legítima contra el personaje dentro de reglas publicadas.

**Relacionado con:** moderación.

**Estado:** vigente.

---

## 56. Filtro de entrada

**Definición:** control previo al proveedor/modelo que clasifica, bloquea, transforma o enruta contenido según política: abuso, PII, ataque prohibido, límite de tamaño, rate limit o contexto inválido.

**No significa:** juez oficial de resultados ni sustituto de la validación de backend.

**Relacionado con:** .

**Estado:** diseñado; pendiente de implementación.

---

## 57. Filtro de salida / redacción

**Definición:** control posterior al modelo que valida y sanitiza una respuesta antes de mostrarla o registrarla, evitando fuga de secretos, PII, contenido prohibido o formato inválido.

**No significa:** garantía de que el modelo nunca alucina; es una capa dentro de defensa en profundidad.

**Relacionado con:** `RB-008`.

**Estado:** diseñado; pendiente de implementación.

---

## 58. Centinela

**Definición:** componente auxiliar de clasificación, moderación o detección que puede ayudar a evaluar riesgo de una entrada/salida, sin autoridad sobre ganador, resultado o activo crítico, reglas ni dinero.

**No significa:** una segunda IA con poder de mutar estados críticos.

**Relacionado con:** .

**Estado:** diseñado; selección/implementación pendiente.

---

## 59. Validación determinista

**Definición:** comprobación basada en reglas, código o datos definidos que produce el mismo resultado para la misma entrada y configuración.

**No significa:** probabilidad estimada por un modelo, criterio subjetivo humano posterior o una salida creativa del LLM.

**Ejemplo:** el backend determina si se cumplió la condición de resultado definida y valida su unicidad.

**Relacionado con:** `RB-005`.

**Estado:** requisito vigente.

---

## 60. Fallback

**Definición:** comportamiento alternativo seguro cuando un proveedor, componente o flujo principal falla.

**No significa:** ocultar una falla, inventar un resultado o cambiar reglas sin informar.

**Ejemplo:** usar mock/cola/mensaje de servicio temporalmente no disponible sin consumir el intento.

**Relacionado con:** .

**Estado:** requisito vigente.

---

## 61. Timeout

**Definición:** límite máximo de tiempo permitido para una operación antes de considerarla fallida o degradada.

**No significa:** una cancelación silenciosa que penaliza al usuario.

**Relacionado con:** `RB-006`.

**Estado:** requisito vigente.

---

## 62. Circuit breaker

**Definición:** mecanismo que detiene temporalmente llamadas a un proveedor/componente que falla repetidamente, para evitar cascadas de error, costo o latencia.

**No significa:** apagar una transacción o ciclo sin comunicación o perder intentos pendientes.

**Relacionado con:** .

**Estado:** diseñado; implementación pendiente.

---

## 63. Red teaming

**Definición:** práctica controlada de probar deliberadamente fallos, abusos, inyecciones, fugas, manipulaciones y comportamientos inesperados para encontrar vulnerabilidades antes o durante una beta.

**No significa:** ataque no autorizado contra infraestructura real, proveedores, usuarios o terceros.

**Relacionado con:** H4.

**Estado:** requisito vigente.

---

## 64. Corpus de evaluación

**Definición:** conjunto versionado de casos, entradas, fixtures y resultados esperados usado para medir regresión, seguridad, comportamiento de IA o calidad de un componente.

**No significa:** colección informal de prompts sin resultado esperado ni origen.

**Relacionado con:** .

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

**Relacionado con:** .

**Estado:** vigente.

---

