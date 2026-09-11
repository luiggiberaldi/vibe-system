# Runbook — [Escenario]

> **Estado:** BORRADOR  
> **Tipo:** procedimiento operativo, de incidente, recuperación, despliegue, soporte o verificación  
> **ID:** RUN-[NNN]  
> **Severidad posible:** Baja / Media / Alta / Crítica  
> **Responsable operativo:** [Luigi / rol]  
> **Clasificación:** INTERNA / CONFIDENCIAL  
> **Creado:** YYYY-MM-DD  
> **Última actualización:** YYYY-MM-DD  
> **Próxima revisión:** [fecha, hito o después de usarlo]  
> **Relacionado con:** [riesgo, requisito, alerta, test, ADR, arquitectura, auditoría]  
> **Tiempo objetivo de respuesta:** [valor o “pendiente”]

---

## 0. Para qué sirve esta plantilla

Un runbook es una receta para actuar cuando algo importante ocurre. Sirve para que Luigi no tenga que improvisar bajo presión ni depender de recordar pasos técnicos.

Debe responder, en lenguaje sencillo:

- ¿Cuándo uso este documento?
- ¿Cómo reconozco el problema?
- ¿Qué hago primero para evitar más daño?
- ¿Qué no debo hacer?
- ¿Cómo recupero el sistema de forma segura?
- ¿Cómo compruebo que realmente volvió a funcionar?
- ¿Qué documentos debo actualizar después?

> **Regla central:** primero proteger personas, datos, resultado o activo crítico y justicia de la operación; después investigar la causa.

---

## 1. Resumen del escenario

### Nombre del escenario

[Ejemplo: “Inconsistencia de estados o condición de carrera detectada en operaciones activas”.]

### Cuándo activar este runbook

[Señal, alerta, reporte o condición concreta. Ejemplo: “Cuando una transacción o ciclo muestra más de un ganador oficial o una alerta `AL-GAME-001` se activa”.]

### Qué puede estar en riesgo

- [ ] Integridad de operaciones activas.
- [ ] Consistencia de transacciones críticas.
- [ ] Datos personales.
- [ ] Secretos/credenciales.
- [ ] Disponibilidad del sistema.
- [ ] Costo de proveedor.
- [ ] Confianza de usuarios.
- [ ] Otro: [detalle].

### Severidad inicial sugerida

```text
BAJA      = molestia menor sin pérdida de datos ni injusticia.
MEDIA     = afecta una función o pocos usuarios, con recuperación simple.
ALTA      = puede afectar la confianza del sistema, múltiples usuarios o datos sensibles.
CRÍTICA   = posible fuga, doble ganador, secreto expuesto, daño serio o pérdida de control.
```

Seleccionar: **[BAJA / MEDIA / ALTA / CRÍTICA]**.

---

## 2. Antes de hacer nada

### Regla de seguridad

No pegar secretos, API keys, passwords, tokens, PII completa ni transcripciones privadas en chats, tickets, documentos o capturas.

### Preguntas rápidas

- ¿El problema sigue ocurriendo ahora?
- ¿Hay operaciones críticas activas o transacciones en riesgo?
- ¿Hay datos privados o secretos posiblemente expuestos?
- ¿Hay usuarios afectados en este momento?
- ¿Qué cambió justo antes del problema?
- ¿Existe una alerta, log, ID de intento o audit event que permita investigar?

### Registro inicial

Anotar en `bitacora.md` o documento de incidente:

```text
- Hora y zona horaria.
- Quién detectó el problema.
- Qué se observó realmente.
- Entidad/módulo/versión afectada, si existe.
- Daño conocido y daño todavía desconocido.
- Primera acción tomada.
```

---

## 3. Contención inmediata

> La contención sirve para que el problema no empeore mientras se investiga.

### Acciones posibles

Marcar solo las que apliquen:

```text
[ ] Pausar el módulo u operación afectada.
[ ] Desactivar temporalmente la IA mediante feature flag.
[ ] Poner el sistema en modo lectura.
[ ] Bloquear temporalmente nuevos intentos.
[ ] Detener un despliegue o hacer rollback.
[ ] Revocar/rotar una credencial expuesta.
[ ] Desactivar una integración externa.
[ ] Limitar cohorte, tráfico o cuota.
[ ] Preservar logs/audit events antes de cambiar nada.
[ ] Informar a responsable/usuario afectado según política.
[ ] Otra: [acción].
```

### Orden recomendado

1. **Pausar o limitar** si existe riesgo de injusticia, fuga, resultado o activo crítico incorrecto o daño activo.
2. **Guardar evidencia mínima**: IDs, timestamps, versión, alertas y estado de los servicios.
3. **Evitar cambios destructivos**: no borrar logs, usuarios, intentos ni datos para “arreglar rápido”.
4. **Aplicar el control específico**: flag, rollback, rotación, fallback o bloqueo temporal.
5. **Registrar** quién hizo qué y cuándo.

### No hacer

- No ocultar el problema cambiando una pantalla sin registrar el incidente.
- No declarar un ganador manualmente sin aplicar la regla/documentar la decisión.
- No enviar capturas con secretos o PII a chats abiertos.
- No borrar audit logs ni transcripciones necesarias para investigar.
- No reanudar operaciones críticas hasta comprobar la recuperación completa.
- No prometer a usuarios soluciones sin verificación técnica confirmada.

---

## 4. Diagnóstico guiado

### Información mínima a reunir

| Dato | Valor | Fuente | ¿Contiene datos sensibles? |
|---|---|---|---|
| Fecha/hora y zona | [valor] | [alerta/log] | No |
| Ambiente | Local / CI / Staging / Alpha / Beta | [fuente] | No |
| Operación afectada | [ID] | [fuente] | No |
| Intento/evento afectado | [ID] | [fuente] | No |
| Versión de aplicación/configuración | [valor] | [fuente] | No |
| Correlation ID | [valor] | [fuente] | No |
| Último cambio conocido | [commit/flag/deploy] | [fuente] | No |
| Alcance de usuarios | [número o estimación] | [fuente] | No |

### Hipótesis de causa

| Hipótesis | Cómo comprobarla | Resultado | Acción si se confirma |
|---|---|---|---|
| [causa posible] | [test, log, comparación] | Pendiente / Confirmada / Descartada | [acción] |
| [causa posible] | [test, log, comparación] | Pendiente / Confirmada / Descartada | [acción] |

> No presentar una hipótesis como causa real hasta tener evidencia.

### Checks comunes

- ¿La entidad u operación estaba en el estado esperado?
- ¿La configuración/hash cambió?
- ¿El actor tenía permiso?
- ¿La operación fue repetida?
- ¿Hubo timeout, retry o proveedor caído?
- ¿Un feature flag cambió el comportamiento?
- ¿La base de datos o audit log muestra resultados distintos a la pantalla?
- ¿El problema existe en staging con datos sintéticos?

---

## 5. Recuperación

### Criterio de recuperación

[Define qué significa estar recuperado. Ejemplo: “Existe un solo ganador oficial, el resultado o activo crítico queda pausado hasta revisión, no se aceptan nuevos intentos y el audit log está completo”.]

### Pasos de recuperación

1. [Paso seguro y verificable.]
2. [Paso seguro y verificable.]
3. [Paso seguro y verificable.]
4. [Paso seguro y verificable.]

### Plan alternativo si no se puede recuperar rápido

- [Mantener la pausa / activar modo seguro / usar proveedor alternativo / limitar accesos].
- [Cómo proteger a los usuarios y la integridad de los datos mientras tanto].
- [Quién debe aprobar una decisión excepcional].

### Rollback

| Pregunta | Respuesta |
|---|---|
| ¿Hay versión/configuración anterior segura? | [Sí / No / Pendiente] |
| ¿Qué se revierte? | [deploy, flag, migración, configuración] |
| ¿Qué datos no se deben perder? | [lista] |
| ¿Cómo se comprueba después? | [test, dashboard, consulta segura] |
| ¿Quién aprueba? | [rol] |

---

## 6. Verificación después de recuperar

No reabrir la funcionalidad solo porque “parece estar bien”. Comprobar:

```text
[ ] La causa se confirmó o quedó claramente documentada como pendiente.
[ ] El problema ya no se reproduce con el caso conocido.
[ ] Las reglas críticas siguen cumpliéndose.
[ ] No se perdieron ni duplicaron datos importantes.
[ ] No se expone PII, secreto ni información sensible.
[ ] Las alertas volvieron a estado normal o se entiende por qué no.
[ ] Los usuarios afectados tienen un resultado/tratamiento documentado.
[ ] La funcionalidad se probó en ambiente seguro antes de reabrirla.
[ ] Luigi aprobó la reapertura si el incidente era alto o crítico.
```

---

## 7. Comunicación

### Mensaje interno mínimo

```text
Incidente: [nombre]
Severidad: [nivel]
Estado: investigando / contenido / recuperado
Impacto conocido: [qué se sabe]
Acción actual: [qué se hizo]
Siguiente actualización: [cuándo o condición]
```

### Mensaje para usuarios, si aplica

Debe ser corto, honesto y no revelar información explotable:

```text
Estamos revisando una incidencia que afecta temporalmente el módulo [nombre-modulo].
La función fue pausada para proteger la experiencia y los resultados.
[Explicar si los datos y operaciones se conservan íntegros, solo si está confirmado].
Actualizaremos cuando tengamos una solución verificada.
```

### Nunca comunicar

- Secretos, API keys, tokens, configuración privada o detalles de defensa.
- PII de otros usuarios.
- Hipótesis como si fueran hechos.
- Promesas de compensación o soluciones no aprobadas formalmente.
- Culpa personal o acusaciones sin evidencia.

---

## 8. Seguimiento posterior

### Documentos a actualizar

```text
[ ] `bitacora.md` con secuencia, resultado y siguiente paso.
[ ] `inteligencia.md` con aprendizaje, error conocido, riesgo o decisión durable.
[ ] `registro-riesgos.md` con riesgo nuevo o cambio de nivel.
[ ] `matriz-trazabilidad.md` con test, alerta o runbook asociado.
[ ] `arquitectura.md` si cambió un límite, componente, contrato o fallback.
[ ] ADR si se tomó una decisión estructural.
[ ] Documento de pruebas con regresión creada.
[ ] Documento de auditoría/post-mortem para incidentes altos o críticos.
```

### Prevención de repetición

| Acción | Responsable | Fecha objetivo | Evidencia de cierre | Estado |
|---|---|---|---|---|
| [Agregar prueba de regresión] | [rol] | YYYY-MM-DD | [test verde] | Pendiente |
| [Agregar alerta o métrica] | [rol] | YYYY-MM-DD | [alerta probada] | Pendiente |
| [Actualizar control/documentación] | [rol] | YYYY-MM-DD | [documento] | Pendiente |

---

## 9. Cierre del runbook usado

| Campo | Valor |
|---|---|
| Fecha/hora de cierre | [YYYY-MM-DD HH:MM TZ] |
| Estado final | Recuperado / Pausado / Cancelado / Escalado |
| Impacto final conocido | [resumen] |
| Causa confirmada | [causa o “pendiente”] |
| Cambios realizados | [lista] |
| Riesgo residual | [detalle] |
| Aprobó cierre | [Luigi / rol] |
| Próximo seguimiento | [fecha o acción] |

---

## 10. Historial de cambios

| Fecha | Cambio | Responsable |
|---|---|---|
| YYYY-MM-DD | Creación del runbook | [rol] |
