# Bitácora del Proyecto — Vibe System (Sistema de Proyectos)

> **Estado:** ACTIVO  
> **Tipo:** historial cronológico breve de sesiones, decisiones, avances, bloqueos e incidentes  
> **Fuente de verdad:** Sí, para el orden temporal de lo ocurrido en Vibe System; no sustituye documentos especializados  
> **Responsable:** Luigi  
> **Clasificación:** INTERNA  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  
> **Próxima revisión:** al finalizar cada sesión de trabajo relevante  

---

## 0. Para qué sirve

Esta bitácora es el diario corto y cronológico de **Vibe System**. No guarda transcripciones completas ni repite la arquitectura: registra únicamente los hechos significativos, decisiones tomadas, bloqueos resueltos y la siguiente acción inmediata.

Sirve para retomar el trabajo sin fricción. Al abrir una nueva sesión, el primer paso obligado para Luigi o la IA es leer la última entrada de esta bitácora y `fuentes-principales/inteligencia.md`.

> **Regla de oro:** si una sesión cambió un documento, un parámetro, un flujo o una decisión, debe quedar una entrada registrada antes de concluir.
> **Anexos históricos:** las entradas antiguas se rotan a `bitacora-anexos/` conforme a ADR-004 (registro append-only, sin techo duro).

---

## 1. Protocolo de registro de sesión

Cada nueva sesión se agrega en la parte superior de la sección de entradas cronológicas (orden inverso), utilizando esta estructura estandarizada:

```md
## YYYY-MM-DD — [Título descriptivo de la sesión]

- Estado de sesión: INICIADA / EN PROGRESO / CERRADA / BLOQUEADA
- Hito/epic: H[n] / E-[n] / Core
- Responsable: Luigi
- Objetivo: [qué se buscaba lograr en la sesión]

### Hecho
- [qué se completó con enlaces a archivos creados o editados]

### Decisiones
- [ID]: [decisión tomada y justificación concisa]

### Riesgos, errores o bloqueos
- [ID]: [riesgo o bloqueo identificado y acción de mitigación]

### Documentos creados o actualizados
- `ruta/archivo.md` — [descripción del cambio]

### Evidencia
- [pruebas ejecutadas, auditorías, commits o verificación de integridad]

### Siguiente paso
- [una acción pequeña, clara y concreta para la próxima sesión]
```

---

## 2. Lectura rápida del estado actual

| Elemento | Estado al 2026-09-11 |
|---|---|
| Sistema | Vibe System — Meta-Framework y Sistema Operativo Documental |
| Fase actual | v1.1.0: remediación de AUD-VS-001 completada; H1 habilitado |
| Repositorio | Git local con remote `origin` (push inicial y tag v1.1.0 pendientes de confirmación de Luigi) |
| Desacoplamiento de proyectos | Completado (un proyecto de aplicación externo extraído y preservado) |
| Fuentes de control | Activas (`convenciones.md`, `DoR`, `DoD`, `estados`, `glosario` modular, `pre-commit`) |
| Fuentes principales | Activas (`agent.md`, `inteligencia.md`, `bitacora.md`) |
| Próxima entrega | Push + tag v1.1.0; inicio de H1 (incluye DT-001: reorganizar normativos sobre el techo) |

---

## 3. Entradas cronológicas

## 2026-09-12 — Corrección de los 4 defectos de cableado detectados por la auditoría

- Estado de sesión: CERRADA
- Hito/epic: Core
- Responsable: Luigi / Buffy (agente IA)
- Objetivo: corregir los hallazgos del informe de cableado inteligente (enlaces, versiones, trazabilidad, cobertura de gates).

### Hecho
- **Enlaces rotos corregidos (2):** `template-auditoria-codigo-heredado.md` → `../01-requisitos/template-plan-adecuacion.md` (×2) y `RELEASE-NOTES-v1.1.0.md` → `../11-auditorias/AUD-VS-002...`.
- **Cabeceras de versión sincronizadas (3):** README, `agent.md` e `inteligencia.md` de 1.1.0 → 1.6.0, alineadas con sus historiales de cambios.
- **Trazabilidad D-002/D-005 restaurada:** entradas añadidas a las sesiones correspondientes de la bitácora (2026-09-10 ideación; sesión de consolidación v1.0.0). La bitácora ahora registra D-001…D-010 completa.
- **G6 ampliado:** ahora vigila el techo ≤600 en TODOS los normativos del core (convenciones, plantillas de control, requisitos, ADRs, tríada, scripts operativos, plantillas de tests/auditorías/runbooks, workflow CI).
- Hallazgo colateral del G6 ampliado: 4 documentos heredados de v1.0.0 están sobre techo (convenciones 821, DoR 706, DoD 674, estados 1.114). Quedaron como **exenciones con [WARN] informativo** (no bloquean el build) y deuda documental pendiente de un ADR de refactor.

### Decisiones
- D-011: los 4 documentos heredados sobre techo quedan como deuda documental EXCEPTUADA del gate G6 (WARN visible, no bloqueante); su refactor requiere ADR propio por el riesgo de romper referencias consolidadas.

### Evidencia
- Gates 12/12 PASS + 1 WARN informativo, EXIT=0; tests de vías 20/20, EXIT=0; 0 enlaces rotos en todo el core; bitácora con D-001…D-010 (2026-09-12).

### Siguiente acción
- ADR de refactor de los 4 documentos heredados sobre techo (opcional, prioridad baja).

---

## 2026-09-12 — Tests deterministas de las dos vías de incorporación (20/20)

- Estado de sesión: CERRADA
- Hito/epic: Core
- Responsable: Luigi / Buffy (agente IA)
- Objetivo: verificar de forma determinista y repetible que las dos vías de incorporación funcionan de punta a punta.

### Hecho
- Creada `10-tests/test-vias-incorporacion.sh`: 20 tests E2E en sandbox temporal (autolimpiable) con códigos de salida.
- **Vía A (TVA-001..010):** sintaxis del init, presencia de las 5 plantillas, init con prefijo explícito y automático, estructura 16 carpetas + tríada + CI + `.env` bloqueado + commit fundacional, propagación de parámetros, gates del derivado en verde, guarda de destino no vacío, negativa (violación plantada → EXIT=1) y restauración.
- **Vía B (TVB-001..010):** estructura completa de la plantilla de auditoría (inventario, capas, hallazgos, flujos, regla cero-modificaciones), plan de adecuación con fases 0–4 + exclusiones + RSK-A01, §0-bis y Etapa 0-B en el ciclo de vida, techo ≤600 de las 3 piezas, orden audit→plan codificado por referencias cruzadas, descubribilidad en README, detección de secreto heredado en código, migración real de código legado al árbol Vibe con gates en verde, negativa (secreto en .md → EXIT=1) y restauración.
- 1ª corrida: 19/20 — el fallo fue del test (cadena "no creados" vs "no creado"); corregido el test, no el documento.
- Integrado al workflow de CI (`.github/workflows/verify-gates.yml`) como paso adicional tras los gates.
- Registrado en el plan de pruebas core (secciones 3 y 7).

### Decisiones
- Ninguna nueva (operacionaliza el §0-bis del ciclo de vida y D-010).

### Evidencia
- 2 corridas consecutivas 20/20 PASA, EXIT=0, idempotente; árbol del core limpio tras los tests (2026-09-12).

### Siguiente acción
- Confirmar el run de CI en verde con el paso nuevo incluido.

---

## 2026-09-12 — Protocolos de incorporación: Vía A (desde cero) y Vía B (proyectos heredados)

- Estado de sesión: CERRADA
- Hito/epic: Core
- Responsable: Luigi / Buffy (agente IA)
- Objetivo: definir protocolos explícitos para dos tipos de proyecto: los que nacen en el sistema y los que ya existen y se adoptan.

### Hecho
- Ciclo de vida v2.0.0: nueva sección §0-bis con las dos vías y nueva **Etapa 0-B** (Incorporación de Proyecto Heredado) con gate de salida propio.
- Vía B obliga al orden: **auditoría E2E del código** (inventario, capas, flujos críticos, hallazgos; cero modificaciones durante la auditoría) → **plan de adecuación** (fases incrementales 0–4: contención, gobierno mínimo, red de seguridad, higiene, operación plena) → Etapa 0-B con gate.
- Creada `11-auditorias/template-auditoria-codigo-heredado.md` (paso 1 de la Vía B).
- Creada `01-requisitos/template-plan-adecuacion.md` (paso 2): fases, exclusiones temporales de gates con plan de salida, riesgos de la propia adecuación.
- Starter-kit y guía de arranque marcados explícitamente como Vía A, con punteros a la Vía B.

### Decisiones
- D-010: en proyectos heredados, **no se modifica código** hasta cerrar la auditoría E2E y aprobar el plan de adecuación; las pruebas de regresión de flujos críticos preceden a cualquier refactor.

### Evidencia
- Ciclo de vida v2.0.0 con §0-bis y Etapa 0-B; 2 plantillas nuevas indexadas en README; gates del core en verde tras los cambios.

### Siguiente acción
- Aplicar la Vía B al primer proyecto heredado real (auditoría E2E como punto de partida).

---

## 2026-09-12 — Automatización del arranque: init-vibe-project.sh + CI para derivados

- Estado de sesión: CERRADA
- Hito/epic: Core
- Responsable: Luigi / Buffy (agente IA)
- Objetivo: que iniciar un proyecto real tome un solo comando, heredando gates, CI y memoria desde el minuto cero.

### Hecho
- Creado `07-operacion/init-vibe-project.sh`: `<nombre> [prefijo] [destino]` → árbol de 16 carpetas con **anclas en las vacías** (lección F-011), siembra compacta de tríada + convenciones + DoR/DoD + estados + glosario + riesgos (todas ≤600 líneas, parametrizadas con `@PROYECTO@ @PREFIJO@ @FECHA@`), instala `verify-gates.sh` parametrizada + workflow de CI, `.gitignore` con secretos bloqueados, commit fundacional y validación final con la suite.
- Decisión de diseño: los documentos de control del derivado se **siembran nuevos y compactos** (no se copian los del core), porque el DoR del core (706 líneas) y el DoD (674) violan el techo de 600 y arrastrarían contenido del core al derivado.
- Creada `07-operacion/template-ci-verify-gates.yml`: workflow de CI listo para derivados.
- Validación end-to-end en sandbox: `demo-tienda` (prefijo TIED) y `control-ventas` (prefijo automático CONT) → INIT EXIT=0, gates 10/10; negativa (enlace `file:///` plantado) → EXIT=1; restauración → EXIT=0.
- La validación detectó y corrigió 3 bugs del script antes de publicarlo: llamada a `seed` antes de su definición, tokens `@PROYECTO`/`@FECHA` sin cerrar (17) y commit con literal `@PROYECTO@`.
- Guías actualizadas: `paquete-inicial` (Paso 0 vía rápida) y `guia-de-arranque` (Vía Rápida recomendada, manual como alternativa).

### Decisiones
- D-009: los proyectos derivados usan documentos de control sembrados compactos, no copias de los del core; el core es fuente de plantillas y gates, no de contenido.

### Evidencia
- 2 sandboxes con INIT EXIT=0 y gates 10/10; negativa EXIT=1 (2026-09-12).

### Siguiente acción
- Arrancar el primer proyecto real con el script (piloto).

---

## 2026-09-11 — Integración de la suite de gates en GitHub Actions

- Estado de sesión: CERRADA
- Hito/epic: Core
- Responsable: Luigi / Buffy (agente IA)
- Objetivo: ejecutar el gate determinista automáticamente en cada push a `main` y en PRs, cerrando la acción pendiente de la capa de verificación.

### Hecho
- Creado `.github/workflows/verify-gates.yml`: checkout + `bash 07-operacion/verify-gates.sh` en `ubuntu-latest`, disparado por push a `main`, PRs a `main` y ejecución manual (`workflow_dispatch`); permisos mínimos de solo lectura.
- Resumen del resultado en `$GITHUB_STEP_SUMMARY` (verde 12/12 o rojo con puntero a los FAIL).
- Índice del README actualizado con el workflow.

### Decisiones
- Ninguna nueva (operacionaliza D-007: el gate pasa de ser "pre-push manual" a "obligatorio en CI").

### Evidencia
- Validación YAML local no disponible (sin parser en el equipo); la validación definitiva ocurrirá al primer push (GitHub parsea el workflow). El script ejecutado es el mismo validado en local (12/12, EXIT=0).

### Siguiente acción
- Primer push que active el workflow y confirmar el run verde en la pestaña Actions.

---

## 2026-09-11 — Starter-kit heredable: suite de gates y plan de pruebas para proyectos derivados

- Estado de sesión: CERRADA
- Hito/epic: Core
- Responsable: Luigi / Buffy (agente IA)
- Objetivo: que todo proyecto derivado herede la verificación determinista (suite de gates + plan de pruebas) con sus propios parámetros e IDs.

### Hecho
- Creada `07-operacion/template-verify-gates.sh`: suite parametrizable de 10 gates (G1–G10) con 2 parámetros de arranque (`PROYECTO`, `PREFIJO`) y gate G7 propio de árbol Git limpio.
- Validación end-to-end en sandbox de proyecto derivado: base 10/10 EXIT=0; enlace `file:///` plantado → EXIT=1 (G1+G7); residuo `T-GAME-999` en glosario → EXIT=1 (G2); restauración → EXIT=0.
- La validación detectó 2 bugs de la plantilla antes de publicarla: falso positivo de G2 con un solo archivo de glosario (`grep -c` imprime `0` sin prefijo de archivo) y regex de secretos de G6 mal entrecomillado. Corregidos.
- Creada `10-tests/template-plan-pruebas.md`: plan heredable (12 casos: 10 gates + 2 negativos) alineado 1:1 con la plantilla de suite.
- Starter-kit actualizado: `paquete-inicial-de-proyecto.md` (árbol con suite, Paso 6) y `guia-de-arranque-de-nuevo-proyecto.md` (copiado de la suite, configuración, validación; "15 carpetas" corregido a 16).
- Memoria sincronizada: README (2 plantillas nuevas), inteligencia v1.3.0, bitácora.

### Decisiones
- D-008: los proyectos derivados heredan la suite como `07-operacion/verify-gates.sh` (ya renombrada) y la configuran con 2 parámetros; el gate es obligatorio pre-push también en derivados.

### Evidencia
- Sandbox: EXIT=0 base, EXIT=1 en ambas pruebas negativas, EXIT=0 tras restaurar (2026-09-11).

### Siguiente acción
- Integrar `verify-gates.sh` del core en GitHub Actions (pendiente del paso equivalente en derivados).

---

## 2026-09-11 — Capa de verificación determinista: suite de gates y plan de pruebas core

- Estado de sesión: CERRADA
- Hito/epic: Core
- Responsable: Luigi / Buffy (agente IA)
- Objetivo: convertir la evidencia de AUD-VS-002 en una suite reproducible (EXIT=0/1) que permita saber en cualquier momento si el sistema tiene fallas, si el flujo es correcto y si deja todo documentado para mejorar.

### Hecho
- Creada la suite de verificación determinista `07-operacion/verify-gates.sh` con 12 gates (G1–G12): enlaces absolutos, residuo de juego, topología 16 carpetas, referencias colgantes, techos por archivo (ADR-004), ADRs aceptadas, secretos, coherencia de memoria.
- Primera ejecución: 10/12 PASS → detectó 2 defectos reales. Corregidos: ejemplo `T-GAME-003` residual en `convenciones.md` (→ `T-001`) y lógica del propio gate G6 (verificación por archivo, no suma total).
- Pruebas negativas T-VS-013/014: violaciones plantadas (`file:///`, `T-GAME-999`) producen FAIL + EXIT=1; repositorio restaurado a verde.
- La suite descubrió en su 2ª corrida un defecto real de la entrega publicada: `05-ux/`, `06-calidad/` y `08-legal-y-confianza/` no estaban en Git/GitHub (carpetas vacías no trackeadas) → G8 fallaba con 13/16. Añadidos READMEs ancla y commit.
- Creado el plan de pruebas formal `10-tests/plan-pruebas-vibe-system-core.md` (14/14 PASA) con fallos, regresiones y bucle de mejora documentados.
- Memoria sincronizada: README (suite + plan de pruebas), `inteligencia.md` (F-010, F-011, v1.2.0), `registro-riesgos` (RSK-007 con mitigación con evidencia).

### Decisiones
- D-007: la suite `verify-gates.sh` es el gate obligatorio pre-push del core; reemplaza la verificación declarativa de auditorías (mitiga RSK-007 con evidencia ejecutable).

### Evidencia
- `bash 07-operacion/verify-gates.sh` → 12/12 PASS, EXIT=0 (2026-09-11).
- Detalle completo en `10-tests/plan-pruebas-vibe-system-core.md` §7.

### Siguiente acción
- Integrar la suite en GitHub Actions (gate automático en cada push a `main`).

---

## 2026-09-11 — Fixeo documental completo: AUD-VS-001 → v1.1.0 (Fases 0–4)

- Estado de sesión: CERRADA (pendiente confirmación humana de push y tag)
- Hito/epic: Core — Plan de fixeo documental (T-DOC-001 a T-DOC-018)
- Responsable: Luigi
- Objetivo: Cerrar los 8 hallazgos de AUD-VS-001 y preparar la publicación en GitHub.

### Hecho
- Fase 0: repositorio Git inicializado (`.gitignore`, `.gitattributes` LF), commit base `a443929`, remote `origin` configurado.
- Fase 1: ADR-004 (límites escalonados) y ADR-005 (`05-ux/`, 16 carpetas) aceptadas; PAR-01, PAR-02 y PAR-04 sincronizados; prefijo `RSK-` unificado.
- Fase 2: 40 enlaces `file:///` → rutas relativas; referencias colgantes generalizadas en 12 archivos; auditoría H0 normalizada como AUD-VS-000.
- Fase 3: glosario purgado de vocabulario de juego y dividido en índice + 3 módulos; `agent.md` v1.1.0; `bitacora-anexos/` con regla de rotación.
- Fase 4: `inteligencia.md` sincronizada; RSK-007 y RSK-008 registradas; RELEASE-NOTES v1.1.0; AUD-VS-002 dictamen APROBADA con evidencia reproducible.

### Decisiones
- ADR-004: regla de 600 líneas reescrita escalonada por clase de documento (decisión de Luigi, Q-002).
- ADR-005: `05-ux/` canónica y topología de 16 carpetas.

### Riesgos, errores o bloqueos
- DT-001 aceptada: normativos sobre el techo (`convenciones.md`, `estados-del-trabajo.md`, DoR, DoD) se reorganizarán en H1.
- Push y tag requieren confirmación explícita de Luigi (agent.md).

### Documentos creados o actualizados
- `02-decisiones/ADR-004-limites-escalonados-de-archivo.md` y `ADR-005-topologia-carpeta-05-ux.md` — nuevos.
- `00-control/glosario.md` (índice) + `glosario-metodologia.md`, `glosario-ia-seguridad.md`, `glosario-operacion.md` — partición y purga.
- `01-requisitos/parametros-del-sistema.md`, `README.md`, `00-control/convenciones.md`, plantillas, DoR/DoD — sincronización y enlaces.
- `09-riesgos/registro-riesgos-vibe-system.md`, `fuentes-principales/inteligencia.md`, `fuentes-principales/agent.md` — memoria y riesgos.
- `14-entregas/RELEASE-NOTES-v1.1.0.md`, `11-auditorias/AUD-VS-002-recertificacion-v1-1-0.md` — release y re-certificación.

### Evidencia
- Evidencia reproducible (E1–E10) en `11-auditorias/AUD-VS-002-recertificacion-v1-1-0.md` §3; commits `a443929`, `cea8fcf`, `ac5d964`.

### Siguiente paso
- Confirmar con Luigi el push inicial y el tag `v1.1.0`; luego iniciar H1 con la reorganización de DT-001.

## 2026-09-11 — Consolidación y Certificación de Vibe System v1.0.0 (Cierre de H0)

- Estado de sesión: CERRADA
- Hito/epic: H0 — Fundación y Cimentación Maestra
- Responsable: Luigi
- Objetivo: Completar el 100% de la documentación normativa, decisiones arquitectónicas, gestión de riesgos, guías operativas y auditoría de cierre de Vibe System v1.0.0.

### Hecho
- Desacoplamiento total y extracción de "El Guardián" a carpeta externa independiente (11 archivos resguardados al 100%).
- Normalización y actualización de la tríada de memoria viva: `agent.md`, `inteligencia.md` y `bitacora.md`.
- Redacción de las especificaciones maestras en `01-requisitos/` (Visión, Flujo de Ejecución, Parámetros PAR-01 a PAR-06, Mecanismo de Actualización, Ciclo de Vida y Starter Kit).
- Formalización de los 3 ADRs fundacionales en `02-decisiones/` (ADR-001 Docs en Markdown, ADR-002 Tríada de Memoria y Autoridad Humana, ADR-003 Techo de ~600 Líneas).
- Creación del módulo de IA en `04-ia/`: `system-prompt-vibe-coder.md` y `protocolo-anti-alucinaciones.md`.
- Creación del registro formal de riesgos en `09-riesgos/registro-riesgos-vibe-system.md` (RSK-001 a RSK-006).
- Creación del runbook de arranque en `07-operacion/guia-de-arranque-de-nuevo-proyecto.md`.
- Ejecución y aprobación de la auditoría formal de cierre en `11-auditorias/auditoria-H0-fundacion-vibe-system.md`.
- Creación del atlas visual en `03-arquitectura/diagramas-de-flujo.md` e integración de diagramas interactivos Mermaid en `flujo-de-ejecucion.md` y `arquitectura-documental-vibe-system.md`.
- Publicación de las notas de lanzamiento oficial en `14-entregas/RELEASE-NOTES-v1.0.0.md`.

### Decisiones
- D-001 a D-010 y ADR-001 a ADR-003: Ratificadas como arquitectura inmutable del framework.
- Certificación formal de H0 como APROBADO sin reservas.

### Evidencia
- Verificación automática de cero residuos de proyectos de aplicación.
- Auditoría formal `auditoria-H0-fundacion-vibe-system.md` en estado APROBADA.
- 34 documentos Markdown estructurados y sincronizados en el workspace.

### Siguiente paso
- Iniciar Hito H1: Instanciación del Starter Kit en un proyecto piloto real aplicando el ciclo de 5 fases.

---

## 2026-09-11 — Desacoplamiento total de proyectos de aplicación externos a su propio repositorio

- Estado de sesión: CERRADA
- Hito/epic: H0 — Limpieza y Desacoplamiento
- Responsable: Luigi
- Objetivo: Extraer cualquier contenido, regla o archivo perteneciente al juego proyectos de aplicación externos de `sistema de proyectos` y transferirlo a su carpeta independiente sin pérdida de datos.

### Hecho
- Creación del directorio de destino `c:\Users\luigg\Desktop\documentos de facil creacion\carpeta externa de proyecto\`.
- Migración de archivos de producto: `planmaestro.md`, `arquitectura.md`, `roadmap.md`, `matriz-trazabilidad.md`, `registro-riesgos.md`, `auditoria-H0.md` y `auditoria-conversacion.md`.
- Respaldo de seguridad de la tríada original del juego (`agent.md`, `inteligencia.md`, `bitacora.md`) y de la conversación fundacional completa (`conversacion.md`).
- Eliminación en `sistema de proyectos` del borrador histórico con menciones del juego y creación de `13-investigacion/borradores/origen-del-sistema.md`.
- Verificación de limpieza léxica en documentos de control (`00-control/`).

### Decisiones
- D-005: DoD obligatorio antes de dar por cerrada cualquier tarea (calidad verificada con pruebas y documentación actualizada).
- D-006: `sistema de proyectos` se reserva exclusivamente como el estándar maestro y documentación de Vibe System.
- Preservación 100% íntegra de la propiedad intelectual y diseño de un proyecto de aplicación externo en su carpeta dedicada.

### Evidencia
- Verificación por script de migración y auditoría de archivos en ambos directorios.

---

## 2026-09-10 — Ideación inicial de Vibe System y control de proyectos

- Estado de sesión: CERRADA
- Hito/epic: H0 — Génesis
- Responsable: Luigi
- Objetivo: Diseñar una metodología documental para estructurar el desarrollo asistido por IA evitando la degradación de contexto.

### Hecho
- Definición de la estructura de carpetas estandarizada `00-control/` a `14-entregas/`.
- Creación de plantillas iniciales: DoR, DoD, estados de trabajo, convenciones y glosario.
- Concepción de la tríada de memoria viva (`agent.md`, `inteligencia.md`, `bitacora.md`).

### Decisiones
- D-001: Formato Markdown versionado como estándar universal.
- D-002: Tríada obligatoria de memoria en `fuentes-principales/` (contexto claro, reglas firmes e historial sin desbordamiento).
- D-003: Techo orientativo de ~600 líneas por documento operativo.
- D-004: DoR obligatorio antes de escribir código.
