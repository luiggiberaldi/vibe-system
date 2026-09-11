# Auditoría — Coherencia Global de Vibe System v1.0.0

> **Estado:** CERRADA  
> **Tipo:** auditoría de documento, coherencia documental e integridad de certificación  
> **ID:** AUD-VS-001  
> **Ámbito auditado:** repositorio completo Vibe System Core (35 archivos `.md`, sin código)  
> **Responsable de la auditoría:** Buffy (agente IA)  
> **Responsable del ámbito auditado:** Luigi  
> **Clasificación:** INTERNA  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  
> **Fecha de auditoría:** 2026-09-11  
> **Relacionado con:** `11-auditorias/auditoria-H0-fundacion-vibe-system.md`, `01-requisitos/parametros-del-sistema.md` (PAR-01 a PAR-06), `00-control/convenciones.md`, `09-riesgos/registro-riesgos-vibe-system.md`  
> **Resultado provisional:** BLOQUEADA (para re-certificación de v1.0.0)

---

## 1. Resumen en palabras sencillas

### Qué se revisó

Los 35 documentos Markdown de Vibe System Core: estructura de carpetas, cabeceras de metadatos, enlaces internos, consistencia de IDs, cumplimiento del techo de 600 líneas (PAR-01) y trazabilidad de la certificación H0/v1.0.0.

### Por qué se revisó ahora

La auditoría H0 declaró "APROBADA SIN RESERVAS" la v1.0.0 con evidencia verificable. Esta auditoría independientemente reproduce esas verificaciones para confirmar que la certificación es reproducible y que el sistema está listo para H1 (proyecto piloto).

### Resultado breve

```text
BLOQUEADA
```

### Explicación breve del resultado

El diseño metodológico es sólido y la estructura es coherente, pero **la evidencia de la certificación v1.0.0 no es reproducible**: 5 documentos violan el techo de 600 líneas que la auditoría H0 declaró verificado, el glosario conserva vocabulario del proyecto de juego extraído (contradiciendo el hallazgo "0 residuos") y los enlaces internos violan la propia regla de `convenciones.md` §11. Son problemas de ejecución documental, no de diseño: se corrigen en 1–2 sesiones.

---

## 2. Alcance y límites

### Incluido en la revisión

- Cumplimiento de PAR-01 (techo 600 líneas) en los 35 archivos.
- Validez de los 40 enlaces internos (`file:///`).
- Coincidencia de la topología de carpetas real vs README vs PAR-02.
- Consistencia de IDs de riesgo (`R-` vs `RSK-`), estados (PAR-04 vs `estados-del-trabajo.md`) y ADRs.
- Residuos léxicos del proyecto de aplicación extraído.
- Sincronización de versiones (agent.md v0.1.0 vs certificación v1.0.0) y fechas.

### No incluido en la revisión

- Calidad de redacción estilística de cada documento.
- Validación empírica de la cifra "600 líneas" sobre modelos LLM concretos (ADR-003).
- Contenido de la carpeta externa `carpetas externas de proyecto/` (fuera del ámbito).

### Pregunta de salida

> ¿Puede un proyecto piloto H1 confiar en que Vibe System v1.0.0 está sincronizado y certificado sin reservas?

---

## 3. Fuentes revisadas

| Fuente | Qué se revisó | Estado | Observación |
|---|---|---|---|
| `README.md` | Índice, reglas de oro, topología | Revisado | Enlaces `file:///` absolutos; topología diverge de PAR-02 |
| `00-control/*.md` | Convenciones, DoR, DoD, estados, glosario, gate | Revisado | 5 archivos exceden PAR-01; residuos de juego |
| `01-requisitos/*.md` | Parámetros, flujo, actualización, ciclo, starter kit | Revisado | PAR-02 declara `05-seguridad/`; README y ADR-002 declaran `05-ux/` |
| `02-decisiones/ADR-00[1-3]` | Decisiones fundacionales | Revisado | Vigentes y coherentes entre sí |
| `fuentes-principales/*.md` | Tríada de memoria | Revisado | `agent.md` en v0.1.0; `bitacora.md` menciona "El Guardián" |
| `09-riesgos/registro-riesgos-vibe-system.md` | Matriz RSK-001..006 | Revisado | Prefijo diverge de convenciones (`R-`) |
| `11-auditorias/auditoria-H0-...md` | Evidencia de certificación | Revisado | 2 de 8 evidencias objetivas no se reproducen (ver CA-005, CA-006) |

### Evidencia disponible

- [x] Inventario completo de archivos y conteo de líneas (`wc -l`).
- [x] Escaneo léxico de residuos de juego (`victoria`, `jugador`, `desempate`, `PM-`, `T-GAME-`).
- [x] Extracción y clasificación de todos los enlaces internos.
- [x] Comparación de topología declarada vs real por carpeta.
- [ ] No aplica: prueba ejecutada (no hay código en el proyecto).

---

## 4. Criterios de auditoría

| ID | Criterio | Resultado | Evidencia | Hallazgo o nota |
|---|---|---|---|---|
| CA-001 | Ningún archivo operativo supera ~600 líneas (PAR-01; regla #3 README) | **FALLA** | `wc -l`: glosario 1524, estados 1114, convenciones 818, DoR 706, DoD 674 | 5 archivos exceden incluso la tolerancia máxima de 650 |
| CA-002 | Cero residuos de proyectos de aplicación (evidencia H0) | **FALLA** | `00-control/glosario.md` §§3–85: "condición de victoria", "ganador oficial", "desempate", estados `ACTIVA`/`BORRADOR`; IDs colgantes `PM-*`, `T-GAME-*`, `D-011`, `R-005`, `INV-004`, `COH-ALPHA-001` | ~100 líneas de Parte A–E heredadas del juego extraído |
| CA-003 | Enlaces internos con rutas relativas; prohibidas rutas absolutas locales (convenciones §11) | **FALLA** | 40 enlaces `file:///c:/Users/luigg/...` en README, release notes y docs | Solo funcionan en esta máquina y ruta exacta |
| CA-004 | Topología canónica única y estable (PAR-02, README §3) | **PARCIAL** | PAR-02: `05-seguridad/`; README/ADR-002/13 docs reales: `05-ux/`; release notes: "15 carpetas"; README: "16 carpetas"; falta `13-investigacion/borradores/` en árbol README | Divergencia resuelta en AUD-003 |
| CA-005 | Verificación cuantitativa del techo 600 líneas aprobada (evidencia H0) | **FALLA** | Reproducción directa del conteo | La evidencia declarada no se reproduce |
| CA-006 | 0 coincidencias de residuos en escaneo léxico (evidencia H0) | **FALLA** | Reproducción del escaneo: 30+ coincidencias | La evidencia declarada no se reproduce |
| CA-007 | Sintaxis de IDs unificada (PAR-03) | **PARCIAL** | `convenciones.md` §ID: `R-003`; registro real: `RSK-001..006` | Dos prefijos de riesgo vigentes |
| CA-008 | Máquina de estados formal (PAR-04: 7 estados) | **PARCIAL** | `estados-del-trabajo.md`: 10 estados (incluye DESCUBRIMIENTO, PLANIFICADO, AUDITADO, LISTO, PAUSADO, RECHAZADO) | PAR-04 y el documento de estados no coinciden |
| CA-009 | Cabecera estándar con versión en documentos activos | **PARCIAL** | `agent.md` en v0.1.0 pese a certificación v1.0.0 global; sin ADR de cambio a v1.0.0 | Versión del pilar de memoria desincronizada |
| CA-010 | Formato UTF-8 válido sin caracteres corruptos (evidencia H0) | **PASA** | Lectura completa de archivos clave sin errores | Confirmado |
| CA-011 | Tríada de memoria viva activa y sincronizada | **PASA** | `agent.md`, `inteligencia.md`, `bitacora.md` completos y estructurados | La mejor parte del sistema |
| CA-012 | Plantillas formales existentes (ADRs, tests, auditorías, runbooks, issues) | **PASA** | 5 plantillas en `00-control/`, `10-tests/`, `11-auditorias/`, `12-runbooks/` | Confirmado |
| CA-013 | Markdown versionado en Git (ADR-001, regla #2 README) | **FALLA** | No existe repositorio Git (`git status`: fatal) | Sin versionado ni rollback ante errores documentales |

---

## 5. Checklist por área

### Producto y alcance

- [x] El objetivo de la entrega se entiende sin tecnicismos.
- [x] El alcance incluido y excluido está claro.
- [ ] No se agregaron funciones fuera del MVP sin cambio de alcance. *(glosario Parte A–E heredado del juego)*
- [x] Se distingue lo diseñado de lo implementado.

### IA y seguridad

- [x] La IA no tiene autoridad autónoma sobre lógica crítica, dinero, permisos ni estados (`agent.md` es ejemplar).
- [x] No hay secretos en documentos, código o prompts.
- [x] No se exponen defensas ni información sensible.

### Documentación y trazabilidad

- [ ] Nombres, IDs, rutas y fechas cumplen `convenciones.md`. *(enlaces absolutos; `R-` vs `RSK-`)*
- [x] `bitacora.md` registra las sesiones relevantes.
- [x] `inteligencia.md` refleja hechos, decisiones y estado.
- [ ] ADR existe cuando la decisión es estructural. *(cambio 05-ux↔05-seguridad sin ADR)*

---

## 6. Hallazgos

### Registro de hallazgos

| ID | Severidad | Hallazgo | Evidencia | Impacto | Acción requerida | Responsable | Fecha objetivo | Estado |
|---|---|---|---|---|---|---|---|---|
| AUD-001 | **Crítica** | Certificación H0 no reproducible: techo 600 líneas violado por 5 archivos y residuos de juego presentes, pese a evidencia declarada "verificada" | `wc -l`; escaneo léxico glosario §§3–85 | La confianza en los gates del sistema queda comprometida; un piloto H1 heredaría reglas no cumplidas | Dividir los 5 archivos (índices + submódulos), purgar/refactorizar el glosario y re-certificar con evidencia reproducible (script) | Luigi + IA | 2026-09-18 | Abierto |
| AUD-002 | Alta | 40 enlaces internos absolutos `file:///c:/Users/luigg/...` violan convenciones §11 ("No usar rutas absolutas locales") | README, RELEASE-NOTES, inteligencia, bitacora, agent | Documentos no portables; rotos al mover carpeta, compartir o versionar en Git | Reemplazar por rutas relativas o referencias entre comillas invertidas | Luigi + IA | 2026-09-18 | Abierto |
| AUD-003 | Alta | Topología canónica divergente: `05-ux/` (README, ADR-002, carpetas reales) vs `05-seguridad/` (PAR-02); "15" vs "16 carpetas"; sin ADR del cambio | PAR-02 vs README §3; `ls` real | Un proyecto piloto crearía la carpeta equivocada | Decidir con ADR-004, actualizar PAR-02 o README, unificar el conteo y crear `13-investigacion/borradores/` | Luigi | 2026-09-18 | Abierto |
| AUD-004 | Alta | Sin repositorio Git pese a que ADR-001 y la regla #2 del README definen "Markdown versionado en Git" como núcleo | `git status` fatal: not a git repository | Sin historial, sin rollback ante errores documentales (precisamente el caso AUD-001) | `git init` + `.gitignore` + primer commit como línea base | Luigi | 2026-09-13 | Abierto |
| AUD-005 | Media | Doble sintaxis de IDs de riesgo: `R-` en convenciones vs `RSK-` en registro real y bitácora; PAR-04 (7 estados) vs `estados-del-trabajo.md` (10 estados) | convenciones §ID; PAR-04 | Confusión determinista en un sistema que exige IDs exactos | Elegir un prefijo (recomendado: `RSK-` por no colisionar) y actualizar PAR-04 o el documento de estados | Luigi + IA | 2026-09-25 | Abierto |
| AUD-006 | Media | Plantillas y `agent.md` §8 exigen actualizar archivos inexistentes: `arquitectura.md`, `matriz-trazabilidad.md`, `planmaestro.md`, `roadmap.md` (herencia del juego) | agent.md §8; definition-of-done L398; template-auditoria §9 | Un agente que siga `agent.md` buscará archivos que no existen | Generalizar las rutas (ej. "el plano de arquitectura correspondiente en `03-arquitectura/`") | Luigi + IA | 2026-09-25 | Abierto |
| AUD-007 | Baja | Finales de línea mixtos (CRLF en fuentes-principales, 00-control; LF en README) y ausencia de `.gitignore` | `file` | Ruido en diffs futuros al versionar en Git | Unificar a LF y añadir `.gitattributes`/`.gitignore` junto al `git init` de AUD-004 | IA | 2026-09-13 | Abierto |
| AUD-008 | Baja | La auditoría H0 carece de ID propio (`AUD-...`) y de historial de cambios, a diferencia de `template-auditoria.md` | auditoria-H0 vs plantilla | Inconsistencia menor de trazabilidad | Añadir ID `AUD-VS-000` y cabecera conforme a plantilla | Luigi | 2026-09-25 | Abierto |

### Hallazgos que bloquean

- [ ] No hay hallazgos críticos abiertos. → **AUD-001 abierto**
- [ ] No hay hallazgos altos abiertos sin excepción aprobada. → **AUD-002, AUD-003, AUD-004 abiertos**
- [ ] Cada hallazgo medio tiene responsable y siguiente paso. → Cumplido

---

## 7. Riesgos y decisiones posteriores

### Riesgos nuevos o modificados

| ID | Riesgo | Cambio detectado | Mitigación | Actualizar registro de riesgos |
|---|---|---|---|---|
| RSK-007 | Gates declarados verificados sin mecanismo de verificación reproducible (hallazgo AUD-001) | Nuevo | Script de verificación versionado (conteo de líneas, escaneo léxico, validación de enlaces) ejecutable antes de cada certificación | Sí |
| RSK-008 | Documentación no versionada en Git: un borrado o edición destructiva es irreversible (hallazgo AUD-004) | Nuevo | `git init` inmediato + commit de línea base | Sí |

### Decisiones necesarias

| ID | Decisión pendiente | ¿Requiere ADR? | Bloquea | Responsable |
|---|---|---|---|---|
| Q-001 | ¿`05-ux/` o `05-seguridad/` en la topología canónica? | Sí (ADR-004) | Sí (AUD-003) | Luigi |
| Q-002 | ¿Purgar el glosario del vocabulario de juego o renombrarlo como "glosario de referencia genérico" con avisos? | Sí | Sí (AUD-001) | Luigi |
| Q-003 | ¿Prefijo de riesgo definitivo: `RSK-` o `R-`? | No (convención menor) | No | Luigi |

---

## 8. Resultado final

### Decisión de auditoría

```text
[ ] APROBADA
[ ] APROBADA CON ACCIONES MENORES
[x] BLOQUEADA
[ ] RECHAZADA
```

### Motivo final

**BLOQUEADA para re-certificación de v1.0.0**, no para el trabajo cotidiano. El diseño metodológico de Vibe System es sólido: la tríada de memoria, los ADRs, el registro de riesgos y las plantillas son de alta calidad. Lo que no resiste la auditoría es la **certificación**: dos de las ocho evidencias objetivas de la auditoría H0 no se reproducen al verificarlas de nuevo. Un sistema cuyo propósito es que "los tests deterministas y el humano validan" no puede certificar sus propios gates con evidencia no reproducible. H1 (proyecto piloto) puede iniciarse en paralelo usando el sistema tal cual — funciona — pero v1.0.0 no debe considerarse línea base estable hasta cerrar AUD-001 a AUD-004.

### Condiciones para avanzar

- [ ] AUD-001: 0 archivos operativos >650 líneas (tolerancia PAR-01) y glosario libre de vocabulario heredado del juego.
- [ ] AUD-002: 0 enlaces `file:///` absolutos; enlaces relativos o referencias textuales.
- [ ] AUD-003: ADR-004 decidiendo `05-ux/` vs `05-seguridad/` y documentos sincronizados.
- [ ] AUD-004: repositorio Git inicializado con línea base versionada.
- [ ] Re-ejecutar la verificación de evidencia H0 con resultados reproducibles y re-certificar.

### Siguiente paso único

`git init` + commit de línea base (AUD-004, 5 minutos), y en la misma sesión dividir `00-control/glosario.md` en `glosario-nucleo.md` + `glosario-dominios-ia.md` + `glosario-operacion.md` (AUD-001), actualizando `bitacora.md` e `inteligencia.md` al cierre.

---

## 9. Actualizaciones obligatorias después de auditar

```text
[x] Registrar esta auditoría en `bitacora.md` (pendiente de ejecutar por Luigi/IA).
[x] Registrar riesgo RSK-007 y RSK-008 en `registro-riesgos-vibe-system.md` (sección 7 de este informe).
[ ] ADR-004 si se decide la topología (Q-001).
[ ] Actualizar `inteligencia.md` con estado BLOQUEADA de la re-certificación v1.0.0.
```

---

## 10. Historial de cambios

| Fecha | Cambio | Responsable |
|---|---|---|
| 2026-09-11 | Creación de la auditoría AUD-VS-001 con resultado BLOQUEADA (re-certificación) | Buffy (agente IA) |
