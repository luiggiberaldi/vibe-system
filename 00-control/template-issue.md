# [ID] — [Acción concreta]

> **Estado de trabajo:** IDEA  
> **Estado de evidencia:** DISEÑADO / IMPLEMENTADO / TESTEADO / AUDITADO / OPERATIVO  
> **Hito:** H[n]  
> **Epic:** E-[n]  
> **Prioridad:** Must / Should / Could / Won't  
> **Responsable:** Luigi  
> **Creado:** YYYY-MM-DD  
> **Última actualización:** YYYY-MM-DD  
> **Relacionado con:** [requisitos, ADRs, riesgos, tests, runbooks y documentos]  
> **Bloquea:** [IDs o “ninguno”]  
> **Bloqueado por:** [IDs o “ninguno”]

---

## 0. Para qué sirve esta plantilla

Un issue es una tarea pequeña, clara y comprobable. No debe decir “hacer el sistema” o “arreglar cosas”. Debe permitir que Luigi o una IA entiendan qué se busca, qué queda fuera, cómo se prueba y cuándo se puede cerrar.

> **Regla central:** si una tarea no se puede explicar en una frase, dividir en tareas más pequeñas antes de empezar.

---

## 1. Objetivo

### Problema u oportunidad

[Explica en palabras sencillas qué falta, qué duele o qué riesgo se quiere reducir.]

### Resultado esperado

[Describe el resultado visible y comprobable.]

### Por qué importa ahora

[Explica qué hito, regla, riesgo o dependencia desbloquea.]

---

## 2. Alcance

### Incluye

- [Cambio concreto incluido.]
- [Cambio concreto incluido.]

### No incluye

- [Trabajo que parece relacionado, pero queda fuera.]
- [Función futura o decisión pendiente.]

### No hacer durante esta tarea

- [Atajo inseguro, función fuera de alcance o cambio no autorizado.]

---

## 3. Definition of Ready

No mover esta tarea a `LISTO` hasta completar lo necesario.

```text
[ ] Tiene ID, título, hito y epic.
[ ] El objetivo se entiende sin leer código.
[ ] Alcance y exclusiones están claros.
[ ] Los criterios de aceptación son comprobables.
[ ] Dependencias y bloqueadores están identificados.
[ ] Riesgos de seguridad, privacidad, costo, UX y reglas fueron revisados.
[ ] Se identificaron documentos fuente.
[ ] Se definieron pruebas esperadas.
[ ] Se definieron fixtures, mocks o datos sintéticos necesarios.
[ ] Se sabe si requiere ADR.
[ ] Se definió rollback/fallback si toca una ruta crítica.
[ ] Luigi puede explicar qué significa “terminado”.
```

### Documentos que se deben leer

- [ ] el roadmap del proyecto.
- [ ] el plan maestro del proyecto.
- [ ] el plano de arquitectura en `03-arquitectura/`.
- [ ] `inteligencia.md`.
- [ ] `glosario.md`.
- [ ] la matriz de trazabilidad del proyecto (si existe).
- [ ] [Documento adicional].

---

## 4. Criterios de aceptación

Escribir criterios que una persona pueda comprobar. Preferir el formato “Dado / Cuando / Entonces”.

### CA-001 — [Nombre]

- **Dado:** [estado inicial].
- **Cuando:** [acción].
- **Entonces:** [resultado concreto y visible].
- **Evidencia:** [test, demo, log, documento o auditoría].

### CA-002 — [Nombre]

- **Dado:** [estado inicial].
- **Cuando:** [acción].
- **Entonces:** [resultado concreto y visible].
- **Evidencia:** [test, demo, log, documento o auditoría].

### CA-003 — [Nombre]

- **Dado:** [estado inicial].
- **Cuando:** [acción].
- **Entonces:** [resultado concreto y visible].
- **Evidencia:** [test, demo, log, documento o auditoría].

---

## 5. Diseño o plan simple

### Pasos pequeños

1. [Paso pequeño y reversible.]
2. [Paso pequeño y reversible.]
3. [Paso pequeño y reversible.]

### Datos y estados afectados

| Elemento | Cambio esperado | Riesgo | Protección |
|---|---|---|---|
| [operación/intento/usuario/resultado o activo crítico/etc.] | [cambio] | [riesgo] | [validación, permiso, audit log] |

### Permisos afectados

| Rol | Puede hacer | No puede hacer |
|---|---|---|
| [rol] | [acción permitida] | [acción prohibida] |

### Integraciones afectadas

| Integración | Uso | Riesgo | Mock/fallback | Estado |
|---|---|---|---|---|
| [IA/email/hosting/etc.] | [uso] | [riesgo] | [plan] | No aplica / Pendiente |

---

## 6. Riesgos y controles

| ID | Riesgo | Nivel | Control requerido | Acción si falla |
|---|---|---|---|---|
| R-XXX | [riesgo] | Bajo / Medio / Alto / Crítico | [test, permiso, filtro, alerta] | [pausa, rollback, runbook] |

### Reglas críticas que no se pueden romper

- [ ] La IA no decide ganador, resultado o activo crítico, dinero, precio, permisos ni estados críticos.
- [ ] Una operación activa no cambia reglas relevantes en silencio.
- [ ] No se crean dos ganadores.
- [ ] No se pierde un intento injustamente por un fallo externo.
- [ ] No se expone PII, secreto o evidencia privada.
- [ ] Toda mutación crítica deja audit log.
- [ ] [Otra regla aplicable].

---

## 7. Pruebas esperadas

| ID | Prueba | Tipo | Qué comprueba | Estado |
|---|---|---|---|---|
| T-XXX-001 | [nombre] | Unitaria / Integración / E2E / Seguridad | [regla] | Pendiente |
| T-XXX-002 | [nombre] | Unitaria / Integración / E2E / Seguridad | [error/borde] | Pendiente |

### Datos de prueba

- [ ] Se usan fixtures sintéticos.
- [ ] No se usan secretos ni datos personales reales.
- [ ] Existe mock/fake si la tarea toca IA o proveedor externo.
- [ ] Se puede repetir el resultado localmente o en CI.

---

## 8. Rollback o fallback

### Si el cambio falla

[Explica cómo volver a estado seguro.]

### Señal para detener o pausar

[Ejemplo: “Si aparece más de un ganador, pausar la operación y ejecutar RUN-001”.]

### Runbook relacionado

`[ruta/runbook.md]` o “pendiente de crear”.

---

## 9. Definition of Done

No cerrar esta tarea hasta que se cumpla todo lo aplicable:

```text
[ ] Cumple todos los criterios de aceptación.
[ ] El cambio respeta `agent.md` y los límites del proyecto.
[ ] Las pruebas requeridas existen y pasan.
[ ] Se probaron casos de error, borde y permisos relevantes.
[ ] No hay secretos, PII innecesaria ni datos reales en código/documentos/tests.
[ ] Lint, tipos, secret scan y checks aplicables pasan.
[ ] Existe evidencia de staging si cambia integración, UX, datos, IA o despliegue.
[ ] Se documentó rollback/fallback si toca una ruta sensible.
[ ] `bitacora.md` fue actualizada.
[ ] `inteligencia.md` fue actualizada si hubo hecho, decisión, aprendizaje, riesgo o bloqueo durable.
[ ] el plano de arquitectura en `03-arquitectura/` fue actualizada si cambió componente, dato, estado, contrato o integración.
[ ] la matriz de trazabilidad del proyecto (si existe) fue actualizada si cambió regla, test, alerta o runbook crítico.
[ ] `registro-riesgos.md` fue actualizado si cambió un riesgo.
[ ] ADR existe si se tomó una decisión estructural.
[ ] Revisión/auditoría aprobada según riesgo.
```

---

## 10. Evidencia de cierre

| Evidencia | Enlace o ubicación | Resultado |
|---|---|---|
| Pruebas | [ruta/comando] | Pasa / Pendiente |
| Revisión | [auditoría/PR] | Aprobada / Pendiente |
| Documentación | [archivos] | Actualizada / Pendiente |
| Staging/demo | [descripción] | Verificado / No aplica |
| Rollback/fallback | [evidencia] | Verificado / Pendiente |

### Resultado final

```text
[ ] CERRADO
[ ] BLOQUEADO
[ ] PAUSADO
[ ] REQUIERE ADR
[ ] REQUIERE AUDITORÍA
```

### Siguiente paso único

[Escribir el siguiente paso concreto o “ninguno; entrega cerrada”.]

---

## 11. Historial de cambios

| Fecha | Cambio | Responsable |
|---|---|---|
| YYYY-MM-DD | Creación del issue | [rol] |
