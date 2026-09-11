# Mecanismo de Actualización — Vibe System

> **Estado:** ACTIVO  
> **Tipo:** especificación normativa de versionado, actualización y gestión de cambios  
> **Fuente de verdad:** Sí, para la evolución y sincronización del framework  
> **Responsable:** Luigi  
> **Clasificación:** INTERNA  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  

---

## 0. Propósito

Este documento describe la mecánica formal mediante la cual **Vibe System evoluciona y se actualiza a lo largo del tiempo**. Establece cómo se versiona el framework, cómo los proyectos derivados adoptan mejoras de plantillas y convenciones sin romper el trabajo existente, y cómo se gestionan los cambios de alcance durante el desarrollo.

---

## 1. Versionado Semántico del Framework

Vibe System sigue estrictamente el estándar de Versionado Semántico (**SemVer 2.0.0**):

```
v[MAJOR].[MINOR].[PATCH]
```

### MAJOR (x.0.0) — Ruptura Arquitectónica
- Se incrementa ante cambios que rompen la compatibilidad con proyectos existentes:
  - Modificación de la topología de carpetas canónicas (ej. cambiar numeración o eliminar carpetas base).
  - Alteración sustancial de la tríada de memoria viva en `fuentes-principales/`.
  - Modificación obligatoria de la sintaxis de identificadores (`ADR-`, `REQ-`, `T-`).
  - Reestructuración de los gates de calidad (DoR / DoD).
- **Acción requerida:** Todo salto de versión `MAJOR` debe ir acompañado de una guía formal de migración en `14-entregas/MIGRACION-vX-a-vY.md`.

### MINOR (1.x.0) — Nuevas Capacidades y Plantillas
- Se incrementa al agregar elementos compatibles hacia atrás:
  - Incorporación de nuevas plantillas de ingeniería en `00-control/`, `02-decisiones/`, `10-tests/` o `12-runbooks/`.
  - Nuevas secciones recomendadas en los documentos maestros sin alterar los campos obligatorios.
  - Nuevos checklists o herramientas de auditoría.
- **Acción requerida:** Los proyectos existentes pueden incorporar las nuevas plantillas de forma modular sin rehacer lo ya construido.

### PATCH (1.0.x) — Correcciones y Clarificaciones
- Se incrementa por mejoras de redacción, corrección de errores tipográficos o refinamiento de explicaciones en el glosario o convenciones.
- No altera ninguna regla operativa.

---

## 2. Protocolo de Sincronización Upstream ➔ Proyectos Derivados

Para mantener la coherencia cuando un proyecto está en marcha y Vibe System publica una actualización, los archivos se clasifican en dos categorías:

### A. Archivos de Sistema (Upstream)
Son las plantillas y reglas universales que provienen directamente de Vibe System:
- `fuentes-principales/agent.md`
- `00-control/definition-of-ready.md`
- `00-control/definition-of-done.md`
- `00-control/estados-del-trabajo.md`
- `00-control/glosario.md`
- `00-control/pre-commit-gate-checklist.md`
- Plantillas de ADR, Tests, Auditorías, Runbooks e Issues.

**Regla de sincronización:** Se pueden actualizar copiando la nueva versión de Vibe System, respetando cualquier personalización aprobada por Luigi en `convenciones.md`.

### B. Archivos de Instancia (Exclusivos del Proyecto)
Son los documentos que contienen la verdad, datos y memoria viva del producto específico:
- `fuentes-principales/inteligencia.md`
- `fuentes-principales/bitacora.md`
- Todo el contenido de `01-requisitos/`, `02-decisiones/`, `03-arquitectura/`, etc.
- Todo el código fuente en `/src` o equivalente.

**Regla de sincronización:** **NUNCA** se sobreescriben desde el repositorio maestro de Vibe System. Son propiedad exclusiva del proyecto.

---

## 3. Protocolo de Gestión de Cambios de Alcance (RFC)

Cuando surge la necesidad de alterar los requisitos, la arquitectura o el alcance de un proyecto activo, se aplica el siguiente proceso formal para evitar el *scope creep* invisible:

```
[ Solicitud de Cambio ] ➔ [ Análisis de Impacto ] ➔ [ Aprobación de Luigi ] ➔ [ Actualización Documental ] ➔ [ Nueva Tarea DoR ]
```

1. **Apertura de Solicitud:** Se instancia el documento `00-control/template-cambio-de-alcance.md` con ID correlativo (`RFC-[nnn]-[slug].md`).
2. **Evaluación de Impacto:** La IA o Luigi detallan:
   - ¿Qué se añade, modifica o descarta?
   - ¿Qué requisitos (`REQ-xxx`) o ADRs se ven afectados?
   - ¿Cuál es el costo estimado en tiempo y complejidad?
   - ¿Introduce nuevos riesgos (`RSK-xxx`)?
3. **Decisión Humana:** Luigi aprueba, rechaza o solicita ajustes. Sin su aprobación expresa, el cambio no se implementa.
4. **Propagación Documental:**
   - Si se aprueba, se actualizan los requisitos en `01-requisitos/`.
   - Se actualiza la arquitectura en `03-arquitectura/` o se redacta un nuevo ADR.
   - Se asienta la decisión en `fuentes-principales/inteligencia.md`.
5. **Generación de Tareas:** Se crean las tareas atómicas asociadas con DoR completo para su construcción.

---

## 4. Política de Deprecación

Ninguna convención, regla o plantilla se elimina abruptamente de Vibe System:

1. El elemento a sustituir se marca con el estado `DEPRECADO`.
2. Se indica en el encabezado del archivo el motivo de la deprecación y el identificador del nuevo estándar que lo reemplaza.
3. Se mantiene el archivo disponible durante al menos un ciclo de versión menor antes de su retiro permanente.
