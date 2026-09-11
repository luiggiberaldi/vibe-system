# Auditoría — [Ámbito o Hito]

> **Estado:** BORRADOR  
> **Tipo:** auditoría de documento, hito, release, seguridad, privacidad, IA, operación o producto  
> **ID:** AUD-[ÁMBITO]-[NNN]  
> **Ámbito auditado:** [H0 / H1 / PM-4 / feature / release / incidente]  
> **Responsable de la auditoría:** [Luigi / rol]  
> **Responsable del ámbito auditado:** [persona o rol]  
> **Clasificación:** INTERNA  
> **Creado:** YYYY-MM-DD  
> **Última actualización:** YYYY-MM-DD  
> **Fecha de auditoría:** YYYY-MM-DD  
> **Relacionado con:** [roadmap, issue, ADR, requisito, riesgo, test, runbook]  
> **Resultado provisional:** PENDIENTE

---

## 0. Para qué sirve esta plantilla

Una auditoría es una revisión ordenada antes de decir “esto está listo” o permitir que el proyecto avance. No busca culpar a alguien: busca encontrar huecos antes de que se conviertan en problemas para usuarios, resultado o activo crítico, datos, costos o confianza.

> **Regla central:** una auditoría no inventa evidencia. Si no hay prueba, documento, resultado o responsable, el punto queda abierto.

---

## 1. Resumen en palabras sencillas

### Qué se revisó

[Explica qué parte del proyecto se está revisando. Ejemplo: “La base documental de H0 antes de empezar código”.]

### Por qué se revisó ahora

[Explica qué gate, hito, release o decisión depende de esta auditoría.]

### Resultado breve

Seleccionar uno:

```text
APROBADA
APROBADA CON ACCIONES MENORES
BLOQUEADA
RECHAZADA
```

### Explicación breve del resultado

[Dos a cinco líneas. Decir qué está bien, qué falta y si se puede avanzar.]

---

## 2. Alcance y límites

### Incluido en la revisión

- [Documento, módulo, flujo o control revisado.]
- [Documento, módulo, flujo o control revisado.]

### No incluido en la revisión

- [Elemento que no se evaluó.]
- [Motivo por el que queda fuera.]

### Pregunta de salida

> ¿Qué afirmación concreta debería poder hacerse si esta auditoría pasa?

[Ejemplo: “H0 tiene los documentos mínimos, no contiene secretos, tiene rutas claras y puede iniciar H1 sin improvisación”.]

---

## 3. Fuentes revisadas

| Fuente | Qué se revisó | Estado | Observación |
|---|---|---|---|
| `ruta/archivo.md` | [sección o criterio] | Revisado / Pendiente | [nota] |
| `ruta/archivo.md` | [sección o criterio] | Revisado / Pendiente | [nota] |
| Test / evidencia | [qué demuestra] | Pasa / Falla / No existe | [nota] |
| ADR / decisión | [qué decisión cubre] | Vigente / Pendiente | [nota] |

### Evidencia disponible

- [ ] Documento actualizado.
- [ ] Prueba ejecutada y resultado guardado.
- [ ] Revisión de seguridad/privacidad si aplica.
- [ ] Evidencia de staging si aplica.
- [ ] Responsable identificado.
- [ ] Riesgo y rollback revisados si aplica.

---

## 4. Criterios de auditoría

Marcar cada criterio con uno de estos resultados:

```text
PASA       = hay evidencia suficiente y no hay hallazgo crítico.
PARCIAL    = existe avance, pero falta evidencia o ajuste.
FALLA      = el criterio no se cumple.
NO APLICA  = no corresponde al ámbito; explicar por qué.
```

| ID | Criterio | Resultado | Evidencia | Hallazgo o nota |
|---|---|---|---|---|
| CA-001 | [criterio comprobable] | PASA / PARCIAL / FALLA / NO APLICA | [archivo, test, demo] | [nota] |
| CA-002 | [criterio comprobable] | PASA / PARCIAL / FALLA / NO APLICA | [archivo, test, demo] | [nota] |
| CA-003 | [criterio comprobable] | PASA / PARCIAL / FALLA / NO APLICA | [archivo, test, demo] | [nota] |

---

## 5. Checklist por área

### Producto y alcance

- [ ] El objetivo de la entrega se entiende sin tecnicismos.
- [ ] El alcance incluido y excluido está claro.
- [ ] No se agregaron funciones fuera del MVP sin cambio de alcance.
- [ ] Las reglas visibles al usuario no contradicen el plan maestro.
- [ ] Se distingue lo diseñado de lo implementado.

### Reglas del juego e integridad

- [ ] La condición de victoria es verificable por reglas del sistema.
- [ ] Existe protección determinista contra condiciones de carrera e inconsistencias.
- [ ] La configuración crítica activa no puede cambiar silenciosamente.
- [ ] Todas las precondiciones de negocio están reservadas y verificadas antes de activar.
- [ ] Los empates siguen una regla determinista publicada.
- [ ] Las acciones críticas dejan audit log, si aplica.

### IA y seguridad

- [ ] La IA no tiene autoridad autónoma sobre lógica de negocio crítica, dinero, precios, permisos ni estados.
- [ ] No hay secretos en documentos, código, prompts, logs o fixtures.
- [ ] La entrada y salida de IA se filtran o el alcance explica por qué no aplica.
- [ ] Un fallo de IA no consume injustamente un intento, si aplica.
- [ ] No se expone razonamiento interno, prompt sensible ni defensas explotables.
- [ ] No se usan agentes autónomos con herramientas críticas.

### Privacidad y confianza

- [ ] No se expone PII en vistas públicas, ejemplos o logs.
- [ ] Se usan alias/datos sintéticos en pruebas y documentación.
- [ ] Los datos sensibles tienen finalidad, acceso y retención definidos si aplica.
- [ ] Consentimiento, elegibilidad y moderación se consideran si el ámbito toca usuarios reales.
- [ ] La comunicación al usuario es clara cuando hay error, pausa o cambio relevante.

### Calidad y pruebas

- [ ] Los criterios de aceptación tienen evidencia.
- [ ] Las pruebas necesarias existen y pasan.
- [ ] Se probaron casos de error, límite y permisos relevantes.
- [ ] No se ocultaron fallos con excepciones silenciosas.
- [ ] Los datos de prueba no contienen datos reales sensibles.
- [ ] El resultado es reproducible por otra persona.

### Documentación y trazabilidad

- [ ] Nombres, IDs, rutas y fechas cumplen `convenciones.md`.
- [ ] `bitacora.md` registra la sesión/cambio relevante.
- [ ] `inteligencia.md` refleja hechos, decisiones, riesgos o pendientes durables.
- [ ] `arquitectura.md` se actualizó si cambió diseño, datos, permisos o integración.
- [ ] `matriz-trazabilidad.md` se actualizó si cambió una regla crítica.
- [ ] ADR existe cuando la decisión es estructural.
- [ ] Registro de riesgos se actualizó si hay riesgo nuevo o cambiado.

### Operación y recuperación

- [ ] Existe fallback o comportamiento seguro ante fallo, cuando aplica.
- [ ] Existe rollback o forma de revertir el cambio, cuando aplica.
- [ ] Existen métricas o alertas necesarias, cuando aplica.
- [ ] Existe runbook para escenarios de alto impacto, cuando aplica.
- [ ] El cambio se probó en staging antes de usuarios externos, cuando aplica.
- [ ] Backups/restauración se consideran si se cambian datos persistentes.

---

## 6. Hallazgos

### Severidad

| Severidad | Significado | Efecto sobre el avance |
|---|---|---|
| Crítica | Puede causar injusticia, fuga, pérdida, incumplimiento o daño serio | Bloquea el gate |
| Alta | Riesgo importante sin control suficiente | Bloquea salvo excepción aprobada y documentada |
| Media | Debe corregirse pronto, pero puede no bloquear si existe mitigación | Requiere plan y fecha |
| Baja | Mejora de claridad, mantenimiento o detalle | Se registra para seguimiento |

### Registro de hallazgos

| ID | Severidad | Hallazgo | Evidencia | Impacto | Acción requerida | Responsable | Fecha objetivo | Estado |
|---|---|---|---|---|---|---|---|---|
| AUD-001 | Crítica / Alta / Media / Baja | [qué falta o falló] | [fuente] | [qué puede pasar] | [acción concreta] | [rol] | YYYY-MM-DD | Abierto / En progreso / Cerrado |

### Hallazgos que bloquean

- [ ] No hay hallazgos críticos abiertos.
- [ ] No hay hallazgos altos abiertos sin excepción aprobada.
- [ ] Cada hallazgo medio tiene responsable y siguiente paso.

---

## 7. Riesgos y decisiones posteriores

### Riesgos nuevos o modificados

| ID | Riesgo | Cambio detectado | Mitigación | Actualizar registro de riesgos |
|---|---|---|---|---|
| R-XXX | [riesgo] | [nuevo/cambió] | [acción] | Sí / No |

### Decisiones necesarias

| ID | Decisión pendiente | ¿Requiere ADR? | Bloquea | Responsable |
|---|---|---|---|---|
| Q-XXX | [decisión] | Sí / No | Sí / No | [rol] |

---

## 8. Resultado final

### Decisión de auditoría

Seleccionar una:

```text
[ ] APROBADA
[ ] APROBADA CON ACCIONES MENORES
[ ] BLOQUEADA
[ ] RECHAZADA
```

### Motivo final

[Explica de forma directa qué permite o impide este resultado.]

### Condiciones para avanzar

- [ ] [Condición obligatoria.]
- [ ] [Condición obligatoria.]
- [ ] [Condición obligatoria.]

### Siguiente paso único

[Escribir una acción pequeña y concreta. Ejemplo: “Corregir el hallazgo AUD-003 y ejecutar de nuevo T-GAME-003”.]

---

## 9. Actualizaciones obligatorias después de auditar

```text
[ ] Actualicé `bitacora.md` con resultado y siguiente paso.
[ ] Actualicé `inteligencia.md` si surgió decisión, aprendizaje, riesgo o bloqueo durable.
[ ] Actualicé `roadmap.md` si cambia el estado de hito/issue/gate.
[ ] Actualicé `arquitectura.md` si la auditoría cambió diseño o límites.
[ ] Actualicé `matriz-trazabilidad.md` si cambió regla, test, alerta o runbook crítico.
[ ] Actualicé `registro-riesgos.md` si existe riesgo nuevo/modificado.
[ ] Creé ADR si la auditoría obliga una decisión estructural.
[ ] Creé/actualicé runbook si apareció un escenario operativo repetible.
```

---

## 10. Historial de cambios

| Fecha | Cambio | Responsable |
|---|---|---|
| YYYY-MM-DD | Creación de auditoría | [rol] |
