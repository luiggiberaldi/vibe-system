# Plan de Fixeo Documental — Vibe System v1.0.0 → v1.1.0

> **Estado:** COMPLETADO (las 18 tareas ejecutadas; push y tag confirmados por Luigi)  
> **Tipo:** plan de remediación de hallazgos de la auditoría AUD-VS-001  
> **Fuente de verdad:** Sí, para la secuencia de corrección de la documentación  
> **Responsable:** Luigi  
> **Clasificación:** INTERNA  
> **Versión:** 1.1.0  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  
> **Relacionado con:** `11-auditorias/AUD-VS-001-auditoria-de-coherencia-v1.md`, `01-requisitos/parametros-del-sistema.md`, `00-control/convenciones.md`  
> **Repositorio destino:** `https://github.com/luiggiberaldi/vibe-system` (publicado; tag `v1.1.0` activo)

---

## 0. Propósito

Cerrar los hallazgos AUD-001 a AUD-008 de la auditoría AUD-VS-001, publicar la documentación en GitHub y re-certificar el sistema como v1.1.0.

---

## 1. Decisiones adoptadas por Luigi (insumo del plan)

1. **Techo de 600 líneas (AUD-001):** la regla se reinterpreta. Los archivos de registro que crecen indefinidamente (ej. `bitacora.md`) pueden superar las 600 líneas. La regla se formaliza **escalonada** en ADR-004 en lugar de derogarse: sigue aplicando a documentos normativos que la IA lee completos.
2. **Repositorio:** el sistema se publica en `https://github.com/luiggiberaldi/vibe-system`.
3. Idioma del plan y de los documentos: español (regla de `convenciones.md`).

---

## 2. Reglas escalonadas propuestas para PAR-01 (a decidir en ADR-004)

| Clase de documento | Ejemplos | Límite | Mecanismo cuando crece |
|---|---|---|---|
| Normativo (leído completo por la IA) | PAR, DoR, DoD, convenciones, agent.md | ≤600 líneas | Dividir en submódulos con índice |
| Registro anexo (append-only) | `bitacora.md`, changelogs, registro de riesgos | Sin techo duro | Entradas antiguas → anexo por período (`bitacora-anexos/bitacora-2026-H2.md`); el archivo activo conserva ventana reciente + índice de anexos |
| Referencia (consulta por búsqueda) | glosario | Techo flexible | Dividir por dominios con documento índice |

---

## 3. Fases y tareas

### Fase 0 — Base de control (Git) — cierra AUD-004, AUD-007

| ID | Tarea | Detalle | Criterio de aceptación |
|---|---|---|---|
| T-DOC-001 | Inicializar Git local | `git init`, `.gitignore` (`.freebuff/`, `*.tmp`), `.gitattributes` (`* text=auto eol=lf`), commit base | `git log` con commit inicial; `git status` limpio |
| T-DOC-002 | Conectar y publicar en GitHub | `git remote add origin https://github.com/luiggiberaldi/vibe-system.git` + push inicial (**requiere confirmación de Luigi**) | Repo remoto refleja el commit base |

### Fase 1 — Decisiones (ADRs) — habilita Fases 2 y 3

| ID | Tarea | Detalle | Criterio de aceptación |
|---|---|---|---|
| T-DOC-003 | ADR-004: límites escalonados PAR-01 | Aprobar la tabla de la sección 2; actualizar `parametros-del-sistema.md` (PAR-01) y regla #3 del README | ADR-004 en `02-decisiones/` estado ACEPTADA; PAR-01 reescrito |
| T-DOC-004 | ADR-005: topología canónica | Decidir `05-ux/` vs `05-seguridad/`; sincronizar README §3, PAR-02, RELEASE-NOTES y mención en ADR-002; contar carpetas de forma consistente | Un solo nombre vigente en todos los documentos |
| T-DOC-005 | Prefijo de riesgo único | Adoptar `RSK-` en `convenciones.md` (no colisiona con `R-` de la plantilla de auditoría; el registro real ya usa `RSK-`) | `convenciones.md` §IDs con `RSK-` |

### Fase 2 — Correcciones mecánicas — cierra AUD-002, AUD-003, AUD-006, AUD-008

| ID | Tarea | Detalle | Criterio de aceptación |
|---|---|---|---|
| T-DOC-006 | Migrar enlaces a rutas relativas | 40 enlaces `file:///c:/Users/luigg/...` → rutas relativas o referencias entre comillas invertidas. Crítico para GitHub | `grep -r "file:///"` devuelve 0; enlaces funcionan en la vista de GitHub |
| T-DOC-007 | Alinear máquina de estados | PAR-04 (7 estados) vs `estados-del-trabajo.md` (10): PAR-04 queda como resumen y remite al documento de autoridad | Sin contradicción numérica entre ambos |
| T-DOC-008 | Corregir referencias a archivos inexistentes | `agent.md` §8, `definition-of-done.md` y `template-auditoria.md` §9 citan `arquitectura.md`, `planmaestro.md`, `roadmap.md`, `matriz-trazabilidad.md` → reemplazar por rutas reales (`03-arquitectura/...`, `00-control/roadmap-vibe-system.md`) o eliminar la referencia | 0 referencias a archivos que no existen |
| T-DOC-009 | Normalizar auditoría H0 | Añadir ID (`AUD-VS-000`) y cabecera conforme a `template-auditoria.md` | Cabecera completa presente |

### Fase 3 — Estructura y limpieza — cierra el resto de AUD-001

| ID | Tarea | Detalle | Criterio de aceptación |
|---|---|---|---|
| T-DOC-010 | Purgar vocabulario de juego del glosario | Eliminar o reescribir secciones heredadas del proyecto extraído ("condición de victoria", "ganador oficial", "desempate", estados `ACTIVA`/`BORRADOR`); resolver IDs colgantes (`PM-*`, `T-GAME-*`, `D-011`, `INV-004`, `COH-ALPHA-001`); renumerar | `grep -riE "victoria\|jugador\|desempate\|T-GAME\|PM-[0-9]" 00-control/glosario.md` devuelve 0 |
| T-DOC-011 | Dividir el glosario por dominios | `glosario.md` (índice) + `glosario-metodologia.md`, `glosario-ia-seguridad.md`, `glosario-operacion.md`. Con la regla escalonada es organizativa, no obligatoria por techo | Índice enlaza a las 3 partes; ninguna referencia rota |
| T-DOC-012 | Sincronizar versión de `agent.md` | Subir de 0.1.0 a 1.1.0 con entrada en su historial de cambios | Cabecera y historial actualizados |
| T-DOC-013 | Anexos de bitácora | Crear `fuentes-principales/bitacora-anexos/`; regla de rotación documentada en ADR-004; mover entradas antiguas si se supera el umbral de ventana activa | Estructura creada y referenciada |

### Fase 4 — Memoria, release y re-certificación

| ID | Tarea | Detalle | Criterio de aceptación |
|---|---|---|---|
| T-DOC-014 | Actualizar tríada de memoria | `bitacora.md` (entrada por cada sesión de fixeo), `inteligencia.md` (decisiones nuevas, estado del plan) | Ambas actualizadas al cierre |
| T-DOC-015 | Actualizar registro de riesgos | Añadir RSK-007 (gates no reproducibles) y RSK-008 (sin control de versiones); ajustar RSK-003 a la regla escalonada | Registro sincronizado con AUD-VS-001 §7 |
| T-DOC-016 | RELEASE-NOTES v1.1.0 | Cambios: ADR-004/005, topología, enlaces relativos, glosario, publicación en GitHub | Archivo en `14-entregas/` |
| T-DOC-017 | Auditoría de re-certificación | Nueva `AUD-VS-002` con verificación reproducible (conteos, escaneos, enlaces) y dictamen sobre v1.1.0; marcar AUD-VS-001 hallazgos como cerrados | Dictamen APROBADA o APROBADA CON ACCIONES MENORES |
| T-DOC-018 | Push final y tag | Push + `git tag v1.1.0` (**requiere confirmación de Luigi**) | Tag visible en GitHub |

---

## 4. Criterios de aceptación globales

```text
[ ] 0 enlaces file:/// absolutos en todo el repositorio.
[ ] Repo público https://github.com/luiggiberaldi/vibe-system con línea base y tag v1.1.0.
[ ] ADR-004 y ADR-005 aceptadas; PAR-01 y PAR-02 sincronizadas.
[ ] Glosario sin vocabulario heredado del proyecto de juego.
[ ] 0 referencias a archivos inexistentes en plantillas y agent.md.
[ ] Finales de línea LF uniformes vía .gitattributes.
[ ] bitacora.md e inteligencia.md reflejan el cierre del plan.
[ ] AUD-VS-002 re-certifica con evidencia reproducible.
```

---

## 5. Orden de ejecución sugerido

Sesión 1: T-DOC-001 → T-DOC-006 (Git + enlaces: lo que GitHub rompe hoy).  
Sesión 2: T-DOC-003 → T-DOC-005 (ADRs, requieren decisión de Luigi).  
Sesión 3: T-DOC-007 → T-DOC-011 (limpieza y estructura).  
Sesión 4: T-DOC-012 → T-DOC-018 (cierre, release y re-certificación).

Pueden ejecutarse en una sola sesión larga si Luigi aprueba las decisiones de Fase 1 al inicio.

---

## 6. Historial de cambios

| Fecha | Cambio | Responsable |
|---|---|---|
| 2026-09-11 | Creación del plan a partir de AUD-VS-001 y decisiones de Luigi (regla escalonada, repositorio GitHub) | Buffy (agente IA) |
| 2026-09-11 | Fase 0 ejecutada: T-DOC-001 completo (git init, .gitignore, .gitattributes LF, commit base `a443929`, remote `origin` configurado); T-DOC-002 pendiente de push con confirmación de Luigi | Buffy (agente IA) |
| 2026-09-11 | Fase 1 ejecutada: T-DOC-003 (ADR-004 ACEPTADA + PAR-01 escalonado + regla #3 del README), T-DOC-004 (ADR-005 ACEPTADA + PAR-02 con `05-ux/`), T-DOC-005 (`RSK-` en convenciones) | Buffy (agente IA) |
| 2026-09-11 | Fase 2 ejecutada: T-DOC-006 (40 enlaces absolutos → relativos; 0 `file:///` restantes), T-DOC-008 (referencias colgantes generalizadas en 11 plantillas + agent.md + convenciones), T-DOC-009 (H0 normalizada como AUD-VS-000) | Buffy (agente IA) |
| 2026-09-11 | Fase 3 ejecutada: T-DOC-010/011 (glosario → índice + 3 módulos, sin vocabulario de juego), T-DOC-012 (agent.md v1.1.0), T-DOC-013 (`bitacora-anexos/` con regla de rotación) | Buffy (agente IA) |
| 2026-09-11 | Fase 4 ejecutada: T-DOC-014 a T-DOC-017 (tríada sincronizada, RSK-007/008, RELEASE-NOTES v1.1.0, AUD-VS-002 APROBADA con evidencia E1–E10). T-DOC-002/018 (push + tag) pendientes de confirmación humana | Buffy (agente IA) |
| 2026-09-11 | Confirmación de Luigi: push inicial a `origin/main` ejecutado (T-DOC-002) y tag `v1.1.0` publicado (T-DOC-018). Plan COMPLETADO | Buffy (agente IA) |
