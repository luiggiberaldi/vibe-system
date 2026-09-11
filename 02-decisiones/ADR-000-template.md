# ADR-000 — [Título breve de la decisión]

> **Estado:** BORRADOR  
> **Tipo:** Architecture Decision Record / registro de decisión estructural  
> **ID:** ADR-000  
> **Responsable:** [Luigi / rol responsable]  
> **Clasificación:** INTERNA  
> **Creado:** YYYY-MM-DD  
> **Última actualización:** YYYY-MM-DD  
> **Decisión efectiva desde:** [fecha o condición]  
> **Relacionado con:** [hito, epic, requisitos, riesgos, documentos y ADRs relacionados]  
> **Reemplaza:** [ADR anterior o “ninguno”]  
> **Reemplazado por:** [ADR futuro o “ninguno”]

---

## 0. Para qué sirve esta plantilla

Un ADR registra una decisión importante que cambiaría el proyecto si se tomara de otra forma. Sirve para que, semanas después, Luigi pueda responder:

- ¿Qué decidimos?
- ¿Por qué lo decidimos?
- ¿Qué opciones miramos?
- ¿Qué ganamos y qué aceptamos como costo/riesgo?
- ¿Qué debe cambiar en documentos, código, pruebas u operación?

> **Regla central:** un ADR no es una conversación ni una lista de ideas. Es la decisión final, con su razón y sus consecuencias.

---

## 1. Cuándo crear un ADR

Crear un ADR cuando la decisión afecte de forma importante:

- Arquitectura, stack, hosting o estructura de repositorio.
- Datos, privacidad, retención, secretos o permisos.
- Reglas de operación, victoria, empate, resultado o activo crítico o configuración congelada.
- Autoridad de IA, modelo, proveedor, prompt, filtro o fallback.
- Identidad, autenticación, elegibilidad o moderación.
- Integraciones externas, costos recurrentes o dependencia difícil de cambiar.
- Estrategia de pruebas, backup, recuperación, despliegue o seguridad.
- Alcance del MVP, función bloqueada o cambio que no se pueda revertir fácilmente.

No hace falta ADR para:

- Corregir una falta ortográfica.
- Renombrar una variable sin cambiar comportamiento.
- Agregar un test que no cambia reglas.
- Actualizar una fecha de revisión.
- Hacer una tarea ya aprobada sin tomar una nueva decisión estructural.

---

## 2. Contexto

### Problema que debemos resolver

[Explica con palabras sencillas qué decisión falta y qué daño causa dejarla abierta.]

### Por qué importa ahora

[Indica qué hito, tarea, riesgo o bloqueo depende de esta decisión.]

### Lo que ya sabemos

- [Hecho verificado con fuente.]
- [Regla de producto o arquitectura que no se puede romper.]
- [Límite de costo, tiempo, privacidad o mantenimiento.]

### Lo que todavía no sabemos

- [Supuesto o pregunta pendiente.]
- [Dato que se debe validar después.]

---

## 3. Decisión

> **Decisión:** [Escribir una frase directa. Ejemplo: “Usaremos un monorepo con web, API y reglas compartidas para la beta inicial.”]

### Alcance de la decisión

Incluye:

- [Qué sí cambia o define.]
- [Qué equipos/componentes/documentos afecta.]

No incluye:

- [Qué queda fuera para evitar confusión.]
- [Qué sigue pendiente de un ADR posterior.]

### Regla operativa resultante

[Escribe una regla que alguien pueda seguir. Ejemplo: “Las reglas de ganador solo pueden vivir en el paquete de dominio y nunca en la pantalla web.”]

---

## 4. Alternativas evaluadas

| Opción | Ventajas | Riesgos o costos | Facilidad para Luigi | ¿Se puede cambiar después? | Motivo de descarte o selección |
|---|---|---|---|---|---|
| Opción A | [beneficios] | [riesgos] | Alta / Media / Baja | Alta / Media / Baja | [razón] |
| Opción B | [beneficios] | [riesgos] | Alta / Media / Baja | Alta / Media / Baja | [razón] |
| Opción C | [beneficios] | [riesgos] | Alta / Media / Baja | Alta / Media / Baja | [razón] |

### Cómo se eligió

[Explica los criterios usados: simplicidad, costo, seguridad, privacidad, mantenimiento, pruebas, posibilidad de revertir, experiencia de usuario o tiempo.]

---

## 5. Consecuencias

### Consecuencias positivas

- [Beneficio concreto.]
- [Qué riesgo se reduce.]
- [Qué trabajo se simplifica.]

### Consecuencias negativas o compromisos

- [Costo aceptado.]
- [Limitación temporal.]
- [Deuda técnica o dependencia creada.]

### Riesgo residual

| ID | Riesgo que queda | Nivel | Mitigación | Responsable |
|---|---|---|---|---|
| R-XXX | [riesgo] | Bajo / Medio / Alto / Crítico | [acción] | [rol] |

---

## 6. Impacto en el proyecto

| Área | Qué debe cambiar | Documento o trabajo relacionado | Estado |
|---|---|---|---|
| Roadmap | [hito/issue nuevo o modificado] | el roadmap del proyecto | Pendiente / Actualizado |
| Arquitectura | [componente, flujo, contrato o dato] | el plano de arquitectura en `03-arquitectura/` | Pendiente / Actualizado |
| Trazabilidad | [regla, test, métrica, alerta o runbook] | la matriz de trazabilidad del proyecto (si existe) | Pendiente / Actualizado |
| Riesgos | [riesgo nuevo/cambiado] | `registro-riesgos.md` | Pendiente / Actualizado |
| Pruebas | [tests requeridos] | `10-tests/` | Pendiente / Actualizado |
| Operación | [alerta, backup, rollback o runbook] | `12-runbooks/` | Pendiente / Actualizado |
| IA | [prompt, adapter, filtro o proveedor] | `04-ia/` | No aplica / Pendiente / Actualizado |
| UX | [pantalla, copy o explicación] | `05-ux/` | No aplica / Pendiente / Actualizado |
| Legal/confianza | [consentimiento, resultado o activo crítico, elegibilidad o base] | `08-legal-y-confianza/` | No aplica / Pendiente / Actualizado |
| Bitácora | [entrada de sesión] | `bitacora.md` | Pendiente / Actualizado |
| Inteligencia | [decisión durable] | `inteligencia.md` | Pendiente / Actualizado |

---

## 7. Plan de implementación

### Pasos pequeños

1. [Paso pequeño y verificable.]
2. [Paso pequeño y verificable.]
3. [Paso pequeño y verificable.]

### Pruebas o evidencia necesarias

- [ ] [Prueba o revisión concreta.]
- [ ] [Caso de error o borde.]
- [ ] [Evidencia de seguridad/privacidad si aplica.]
- [ ] [Rollback o fallback si aplica.]

### Condición para que sea efectiva

[Indica qué debe ocurrir antes de considerar la decisión aplicada. Ejemplo: “Solo será efectiva cuando los tests T-GAME-001 a T-GAME-005 estén verdes y la configuración se use en staging.”]

---

## 8. Plan de reversión

### Cuándo revertir

[Señales que muestran que la decisión debe revisarse: costo, errores, incidente, imposibilidad de mantenimiento, pérdida de confianza, fallo de seguridad.]

### Cómo revertir sin daño

1. [Pausar o desactivar una función si aplica.]
2. [Volver a configuración/versión anterior.]
3. [Verificar integridad de datos y usuarios afectados.]
4. [Registrar incidente y comunicar lo necesario.]
5. [Actualizar este ADR a DEPRECADO si se reemplaza.]

---

## 9. Aprobación y seguimiento

| Campo | Valor |
|---|---|
| Propuesto por | [persona/rol] |
| Revisado por | [persona/rol] |
| Aprobado por | [Luigi / rol] |
| Fecha de aprobación | [YYYY-MM-DD] |
| Próxima revisión | [fecha o condición] |
| Estado de implementación | No iniciada / En progreso / Implementada / Probada / Operativa |

---

## 10. Historial de cambios

| Fecha | Cambio | Responsable |
|---|---|---|
| YYYY-MM-DD | Creación del ADR | [rol] |
