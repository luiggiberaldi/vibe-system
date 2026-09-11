# Definition of Done (DoD) — Vibe System

> **Estado:** ACTIVO  
> **Fuente de verdad para:** aceptar y cerrar tareas, documentos, reglas, módulos, pruebas, decisiones, hitos y entregas  
> **Relacionado con:** `estados-del-trabajo.md`, `definition-of-ready.md`, `convenciones.md`, `inteligencia.md`, `bitacora.md`  
> **Responsable:** Luigi  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-10  
> **Última actualización:** 2026-09-11  
> **Próxima revisión:** al cerrar cada ciclo de desarrollo o cuando una tarea cerrada revele evidencia insuficiente

---

## 0. Propósito

La Definition of Done (DoD) define cuándo un elemento puede pasar de `ACEPTADO` a `CERRADO` sin dejar trabajo oculto, evidencia incompleta, riesgos no registrados o dependencias ambiguas.

La DoD evita estas frases imprecisas:

- “Ya terminé”.
- “La IA ya hizo el código”.
- “Funciona en mi computadora”.
- “Después hacemos las pruebas”.
- “La documentación la actualizamos al final”.
- “No pasa nada si no dejamos registro”.

> **Regla central:** una tarea no está terminada cuando existe código o texto; está terminada cuando entrega el resultado acordado, se verificó la evidencia, se actualizaron las fuentes de verdad y el siguiente paso puede comenzar sin depender de memoria informal.

---

## 1. Relación con Definition of Ready

```text
Definition of Ready
  ↓
¿Está claro y seguro iniciar?
  ↓
LISTO → EJECUTANDO → TESTEANDO → EN STAGING → ACEPTADO
  ↓
Definition of Done
  ↓
¿Está completo, probado, documentado, trazado y aceptado?
  ↓
CERRADO
```

| Documento | Pregunta que responde |
|---|---|
| `definition-of-ready.md` | ¿Podemos empezar esta tarea? |
| `definition-of-done.md` | ¿Podemos cerrar esta tarea sin dejar deuda oculta? |
| `estados-del-trabajo.md` | ¿En qué estado está y qué evidencia existe? |
| `roadmap.md` | ¿Qué hito/desbloqueo corresponde después? |

---

## 2. Principios de cierre

1. **Resultado antes que actividad:** “trabajé muchas horas” no es evidencia de cierre.
2. **Evidencia antes que confianza:** “debería funcionar” no sustituye una prueba.
3. **Documentación como parte de la entrega:** no es una tarea opcional posterior.
4. **Trazabilidad antes que velocidad:** cambios críticos deben poder seguirse desde requisito hasta test y runbook.
5. **Riesgos visibles:** un pendiente se registra; no se esconde dentro de una tarea cerrada.
6. **El cierre deja listo el siguiente paso:** cada entrega debe explicar qué desbloquea y qué sigue.
7. **La IA no autoacepta:** puede proponer cierre, pero Luigi revisa y acepta la evidencia.
8. **No maquillar métricas:** no se borran tests, logs, riesgos o fallos para obtener una apariencia de verde.
9. **La severidad define el rigor:** un cambio de copy no requiere lo mismo que una modificación de resultado terminal, datos, IA o recurso crítico.
10. **Cerrado no significa inmutable:** una evolución requiere nuevo issue, decisión o cambio formal; no reabrir silenciosamente.

---

## 3. Alcance

Esta DoD aplica a:

- Documentos y plantillas.
- Ideas convertidas en decisiones.
- Requisitos y reglas de negocio.
- Issues de código.
- Componentes, APIs, datos y migraciones.
- Flujos UX y accesibilidad.
- Integraciones de IA y guardrails.
- Tests, simulacros y auditorías.
- Riesgos, incidentes y runbooks.
- Hitos y releases.
- Alpha, beta y decisiones go/no-go.

No sustituye procedimientos de emergencia. Un incidente SEV-1 primero se contiene según runbook y después se cierra usando la sección de incidentes de este documento.

---

## 4. Niveles de DoD

El nivel de rigor debe corresponder al riesgo del elemento.

| Nivel | Tipo de elemento | Ejemplos | DoD requerida |
|---|---|---|---|
| DoD-L1 | Bajo riesgo | Documento no rector, copy aislado, ajuste visual simple | Básica |
| DoD-L2 | Riesgo medio | Pantalla, endpoint no crítico, flujo UX, integración interna | Estándar |
| DoD-L3 | Alto riesgo | Reglas, IA, auth, permisos, datos, ranking, recurso crítico, migraciones, flags | Reforzada |
| DoD-L4 | Crítico | Pagos, dinero, transacción monetaria, PII altamente sensible, producción/beta pública, incidente SEV-1 | Crítica + aprobación especializada |

### Regla de precaución

Si hay duda entre dos niveles, aplicar el nivel más alto. Una tarea pequeña puede tener impacto grande si afecta estados, permisos, privacidad, recurso crítico o dinero.

---

## 5. DoD básica — L1

Una tarea de bajo riesgo puede cerrarse si:

- [ ] Entrega el objetivo definido.
- [ ] Cumple el criterio de aceptación.
- [ ] Fue revisada manualmente por Luigi.
- [ ] No introduce contradicción con fuentes de verdad.
- [ ] Se actualizó `bitacora.md` con el resultado.
- [ ] Se actualizó el documento afectado con versión/fecha si aplica.
- [ ] Se registró siguiente paso, dependencia desbloqueada o motivo de cierre.
- [ ] No toca secretos, PII, reglas, permisos, IA, recurso crítico, dinero o arquitectura.

### Ejemplo L1

```text
DOC-UX-001 — Corregir lenguaje de “apuesta” por “reto”.

Cierre válido:
- Se actualizaron los términos de copy identificados.
- Se confirmó que no quedan palabras prohibidas en el documento afectado.
- Bitácora registra el cambio.
- No cambió la política legal ni una interfaz en producción.
```

---

## 6. DoD estándar — L2

Una tarea de riesgo medio puede cerrarse si cumple DoD-L1 y además:

- [ ] Los criterios de aceptación están marcados uno por uno con evidencia.
- [ ] Se ejecutó la prueba manual/automática definida en la DoR.
- [ ] Casos de error básicos fueron revisados.
- [ ] Se revisó impacto en UX y accesibilidad si aplica.
- [ ] Se revisó impacto en datos/permisos si aplica.
- [ ] Se documentó comportamiento de error y rollback si aplica.
- [ ] Se actualizaron documentos relacionados: `inteligencia.md`, arquitectura, requisitos o matriz de trazabilidad cuando corresponde.
- [ ] No hay hallazgos altos abiertos sin registrar como nuevo issue/riesgo.

### Ejemplo L2

```text
E3-06 — Landing y modo lectura.

Cierre válido:
- E2E confirma que un visitante puede leer el objetivo y reglas resumidas.
- Se verificó que la ruta pública usa DTO sanitizado.
- Se probó estado de carga y error básico.
- Se revisó móvil/teclado según alcance.
- Se actualizó arquitectura/UX si la ruta cambió contratos.
- Se creó issue separado para mejoras no bloqueantes.
```

---

## 7. DoD reforzada — L3

Una tarea de alto riesgo puede cerrarse si cumple DoD-L2 y además:

### Resultado y reglas

- [ ] Se cumplieron todos los criterios de aceptación críticos.
- [ ] Las reglas de negocio relacionadas tienen IDs y trazabilidad actualizada.
- [ ] La implementación no contradice decisiones/ADRs vigentes.
- [ ] Casos de concurrencia, duplicado, retry, borde y error relevantes fueron probados.

### Calidad y pruebas

- [ ] Tests unitarios requeridos pasan.
- [ ] Tests de integración requeridos pasan.
- [ ] Tests E2E requeridos pasan.
- [ ] Tests de regresión requeridos pasan.
- [ ] Secret scan, lint, formato y tipos pasan cuando exista código.
- [ ] Las pruebas fallidas previas tienen issue, corrección o decisión explícita.

### Seguridad, datos e IA

- [ ] Se verificaron permisos/roles en servidor si aplica.
- [ ] Se verificó que PII, secretos y datos prohibidos no aparecen en logs, prompts, fixtures o vistas públicas.
- [ ] Se revisó clasificación y retención de datos si aplica.
- [ ] Si hay IA: inputs, outputs, filtros y fallback se validaron.
- [ ] Si hay IA: el modelo no recibió autoridad de negocio, permisos de DB ni acceso a secretos.

### Observabilidad y operación

- [ ] Logs, métricas, traces o audit events requeridos existen y no exponen información sensible.
- [ ] Existe alerta o control para falla crítica aplicable.
- [ ] Fallback, rollback o degradación segura fueron probados o simulados.
- [ ] Se actualizó runbook si la tarea cambia operación o respuesta a incidentes.

### Documentación y trazabilidad

- [ ] `bitacora.md` describe cambio, evidencia, riesgos y siguiente paso.
- [ ] `inteligencia.md` recoge hechos, decisiones, aprendizajes o riesgos nuevos.
- [ ] `arquitectura.md` refleja cambios estructurales, contratos o datos.
- [ ] ADR creado/actualizado si hubo decisión estructural.
- [ ] Matriz de trazabilidad relaciona requisito → decisión → código → test → métrica → runbook.
- [ ] Riesgos/deuda técnica fueron actualizados.

### Revisión y aceptación

- [ ] Segunda pasada de revisión realizada: IA prepara auditoría y Luigi valida evidencia.
- [ ] No hay hallazgos críticos abiertos.
- [ ] Hallazgos medios/bajos no bloqueantes tienen propietario, estado y fecha/condición de revisión.
- [ ] Luigi acepta la entrega explícitamente.

---

## 8. DoD crítica — L4

Una tarea crítica puede cerrarse solo si cumple DoD-L3 y además:

- [ ] Existe responsable humano de la operación posterior.
- [ ] Existe aprobación especializada cuando corresponde: legal, seguridad, privacidad, finanzas o infraestructura.
- [ ] Se probó en ambiente seguro; nunca exclusivamente en producción.
- [ ] Se ejecutó o simuló rollback/contención/kill switch.
- [ ] Existe plan de comunicación a usuarios y soporte si hay impacto visible.
- [ ] Existe preservación de evidencia/audit trail.
- [ ] Se verificó backup/restore si afecta datos críticos.
- [ ] Se revisó fraude, abuso, menores, elegibilidad y disputas cuando aplica.
- [ ] Se confirmó que términos, política, bases y consentimiento aplicables están actualizados.
- [ ] Se realizó gate go/no-go explícito.
- [ ] Luigi aprobó por escrito la decisión final.
- [ ] Si hay beta/producción, la ventana de monitoreo post-release se completó sin señales críticas.

### Cambios L4 actualmente bloqueados

Los siguientes no pueden cerrarse como implementados en el MVP sin una fase futura formal:

- Pagos reales.
- Créditos pagos.
- Anuncios recompensados activos.
- Wallets, USDT, blockchain o tokens.
- Precio dinámico real.
- Recurso crítico monetario.
- Expansión internacional no evaluada.
- Agentes con herramientas autónomas críticas.

---

## 9. Checklist universal de cierre

Este checklist se aplica a cualquier tipo de elemento. Si algo no aplica, debe indicarse la razón.

### Resultado

- [ ] El resultado entregado coincide con el objetivo del issue/documento.
- [ ] Se cumplieron criterios de aceptación.
- [ ] No se agregó alcance oculto o no aprobado.
- [ ] Funciones excluidas permanecen excluidas.
- [ ] El resultado es entendible para Luigi sin leer la conversación completa.

### Evidencia

- [ ] Existe evidencia verificable: test, simulación, revisión, demo, documento o registro.
- [ ] Resultado de cada prueba está registrado: PASS, FAIL, PARTIAL, NO APLICA o BLOQUEADO.
- [ ] Los fallos fueron corregidos o trasladados a issue/riesgo explícito.
- [ ] No se borró evidencia negativa para aparentar éxito.

### Calidad

- [ ] Se ejecutaron los checks requeridos para el nivel de riesgo.
- [ ] Casos de error/borde aplicables fueron revisados.
- [ ] Se revisaron regresiones en flujos afectados.
- [ ] El cambio es mantenible y está dividido razonablemente.
- [ ] No se agregaron dependencias sin justificación/documentación.

### Seguridad y privacidad

- [ ] No hay secretos en documentos, código, logs, fixtures o prompts.
- [ ] No hay PII innecesaria o expuesta.
- [ ] Se respetan permisos y mínimo privilegio.
- [ ] Se respetan consentimientos, retención y sanitización si aplica.
- [ ] Se revisaron riesgos de abuso/inyección/duplicado si aplica.

### Documentación

- [ ] `bitacora.md` actualizado.
- [ ] `inteligencia.md` actualizado si existe contexto durable.
- [ ] `planmaestro.md` actualizado si cambió alcance/fase/gate.
- [ ] `arquitectura.md` actualizado si cambió diseño, datos, contratos o integración.
- [ ] ADR actualizado si hubo decisión estructural.
- [ ] Riesgos/deuda actualizados.
- [ ] Matriz de trazabilidad actualizada cuando el elemento es crítico.
- [ ] Runbook actualizado si cambia operación/soporte/incidente.

### Cierre

- [ ] Luigi revisó y aceptó evidencia.
- [ ] Estado de trabajo actualizado a `CERRADO`.
- [ ] Estado de evidencia correcto: DISEÑADO, IMPLEMENTADO, TESTEADO, AUDITADO u OPERATIVO.
- [ ] Dependencias desbloqueadas identificadas.
- [ ] Siguiente paso escrito.

---

## 10. Evidencia válida por tipo

| Tipo de entrega | Evidencia mínima de cierre |
|---|---|
| Documento rector | Revisión de coherencia, cabecera, enlaces, versión, responsable y siguiente documento |
| Documento especializado | Criterios cubiertos, fuentes enlazadas, revisión de contradicciones |
| ADR | Contexto, alternativas, decisión, consecuencias, aprobación y actualización de fuentes afectadas |
| Regla de negocio | Requisito claro, test previsto/ejecutado, trazabilidad y riesgo asociado |
| Código puro | Lint/tipos/tests/diff revisado; documentación si cambia comportamiento |
| API | Contrato, validación, permisos, integración, error handling y tests |
| Datos/migración | Migración reproducible, backup, restore/rollback según riesgo y test de integridad |
| UI/UX | Criterios E2E/manual, estados de carga/error/vacío, accesibilidad aplicable |
| IA | Adapter, input/output validado, guardrails, red teaming, no autoridad, fallback y observabilidad |
| Riesgo | Dueño, mitigación, evidencia de control y aceptación residual o cierre |
| Test | Caso, fixture, resultado, mantenimiento/regresión y vínculo a requisito |
| Runbook | Escenario, pasos, responsables, simulacro/tabletop y evidencia de recuperación |
| Hito | Todas las issues críticas cerradas, auditoría, gate y DoR del siguiente hito |

---

## 11. Cierre de documentos

Un documento puede pasar a `CERRADO` si:

- [ ] Tiene cabecera de estado, responsable, versión y fechas.
- [ ] Explica propósito, alcance y exclusiones.
- [ ] Sus términos son consistentes con el glosario y fuentes de verdad.
- [ ] Enlaza o identifica documentos relacionados.
- [ ] Declara decisiones, preguntas, riesgos o supuestos pendientes cuando existan.
- [ ] No contiene secretos, PII innecesaria ni afirmaciones externas presentadas como hechos sin fuente.
- [ ] Tiene historial de cambios.
- [ ] Tiene gate propio o criterio de activación.
- [ ] Indica el siguiente documento o paso que habilita.

### Documento activo vs cerrado

Un documento rector puede quedar `ACTIVO` y seguir actualizándose. “Cerrado” significa que la versión/hito actual fue aceptada, no que el documento no pueda evolucionar.

---

## 12. Cierre de una regla de negocio

Una regla como “fallo IA no consume intento” solo puede cerrarse como `OPERATIVA` si:

- [ ] Está definida en lenguaje claro y público/interno según corresponda.
- [ ] Tiene ID y fuente.
- [ ] Está implementada en backend/dominio; no solo en UI.
- [ ] Tiene test unitario e integración.
- [ ] Tiene caso E2E o simulacro si afecta usuario.
- [ ] Tiene audit event/métrica aplicable.
- [ ] Tiene fallback ante proveedor externo.
- [ ] No permite al LLM decidir el resultado oficial.
- [ ] Tiene runbook aplicable si falla.
- [ ] La matriz de trazabilidad está completa.

---

## 13. Cierre de trabajo con IA

Una tarea de IA puede cerrarse si, además de su nivel DoD:

- [ ] La función del modelo está limitada y documentada.
- [ ] El `ai-adapter` valida entrada y salida.
- [ ] Inputs prohibidos no llegan al modelo: secretos, PII innecesaria, evidencia privada de recurso crítico, credenciales o chain-of-thought.
- [ ] El modelo no tiene herramientas autónomas, DB, shell, filesystem, browser, pagos ni autoridad de negocio.
- [ ] Prompts/configuración están versionados y asociados a nivel/operación.
- [ ] Output del modelo se sanitiza/valida.
- [ ] Existe timeout, retry limitado, fallback y circuit breaker según riesgo.
- [ ] Fallos no consumen intentos ni alteran recurso crítico/reglas/puntos.
- [ ] Corpus de red teaming/regresión ejecutado y resultados registrados.
- [ ] Métricas de error, timeout, output inválido, latencia y costo están definidas/visibles.
- [ ] Existe mecanismo para desactivar/degradar IA sin romper la operación.

---

## 14. Cierre de privacidad y datos

Una tarea que toca datos puede cerrarse si:

- [ ] El dato tiene finalidad documentada.
- [ ] Está clasificado: público, interno, sensible o secreto.
- [ ] PII está separada de datos públicos si aplica.
- [ ] Se validaron permisos del servidor.
- [ ] Consentimiento, revocación y retención están cubiertos si aplica.
- [ ] Logs, prompts, DTOs, errores y analítica no exponen información prohibida.
- [ ] Hay tests de no exposición/sanitización.
- [ ] Hay proceso de eliminación/anonymización/exportación si aplica.
- [ ] Riesgo y runbook de PII se actualizan si cambia la superficie de datos.

---

## 15. Cierre de transacciones críticas y operaciones activas

Una tarea que afecta operación, puntos, resultado terminal, ranking, desempate o recurso crítico puede cerrarse si:

- [ ] La regla es determinista, explicable y trazable.
- [ ] Se probaron estados, transiciones, concurrencia, retry y duplicados.
- [ ] Configuración de operación tiene versión/hash/snapshot y se congela en `ACTIVA`.
- [ ] Solo puede haber un resultado terminal oficial.
- [ ] Empates se resuelven por criterio prepublicado.
- [ ] Recurso crítico debe estar reservado antes de apertura de operación.
- [ ] Recurso crítico sustituto y estados excepcionales existen.
- [ ] Acciones sensibles generan audit events.
- [ ] La IA no decide la victoria/recurso crítico.
- [ ] Existen alertas para conflicto de concurrencia o doble asignación, activo o recurso no reservado y cambio de configuración activa.
- [ ] Runbooks de conflicto de concurrencia o doble asignación, recurso crítico y operación pausada están actualizados.

---

## 16. Cierre de tests y simulacros

### Test

Un test se cierra si:

- [ ] Tiene ID, propósito, requisito asociado y nivel de riesgo.
- [ ] Tiene fixture/datos de entrada seguros.
- [ ] Declara resultado esperado.
- [ ] Fue ejecutado con resultado registrado.
- [ ] Si falló, existe issue/riesgo/corrección asociado.
- [ ] Si pasó, se integra en suite de regresión si corresponde.
- [ ] No contiene secretos, PII o dependencia externa no controlada sin justificar.

### Simulacro

Un simulacro se cierra si:

- [ ] Define escenario, activación, responsables y severidad.
- [ ] Se ejecutó en ambiente seguro o tabletop según el caso.
- [ ] Se registró tiempo, acciones, evidencia y resultado.
- [ ] Se verificaron invariantes después de recuperación.
- [ ] Se actualizaron runbooks, riesgos y acciones preventivas.
- [ ] Hallazgos críticos bloquean el gate correspondiente hasta corregirse.

---

## 17. Cierre de riesgos

Un riesgo puede cambiar de estado según la evidencia:

| Estado de riesgo | Condición de cierre |
|---|---|
| Identificado | Riesgo descrito, impacto y dueño asignado |
| Analizado | Probabilidad, impacto, señales y mitigación definidos |
| Mitigado | Control implementado y probado |
| Aceptado | Riesgo residual aprobado por Luigi/rol autorizado |
| Cerrado | Ya no aplica, fue eliminado o sustituido; evidencia registrada |
| Deprecado | Riesgo sustituido por nuevo registro o modelo de riesgo |

### Regla

Un riesgo crítico no puede marcarse como `CERRADO` solo porque no ha ocurrido. Debe existir evidencia de eliminación, mitigación o decisión de aceptación residual.

---

## 18. Cierre de hitos

Un hito pasa a `CERRADO` solo si:

- [ ] Todas las issues Must críticas del hito están cerradas o explícitamente replanificadas con aprobación.
- [ ] Gate de salida del hito completo pasa.
- [ ] Auditoría del hito está realizada.
- [ ] No hay hallazgos críticos abiertos.
- [ ] Hallazgos medios/bajos tienen dueño y fecha/condición.
- [ ] Riesgos y deuda técnica están actualizados.
- [ ] Documentación rectora está sincronizada.
- [ ] Matriz de trazabilidad cubre reglas críticas del hito.
- [ ] Existe evidencia de tests, staging/simulacros cuando aplica.
- [ ] Existe DoR para la primera issue del siguiente hito.
- [ ] Luigi registra decisión de cierre en `bitacora.md`.

### Ejemplo H0

H0 no se cierra solo porque existen archivos Markdown. Se cierra cuando fuentes de verdad, estructuras, plantillas, estados, DoR, DoD, riesgos, trazabilidad y backlog inicial fueron revisados, auditados y conectados.

---

## 19. Cierre de alpha y beta

### Alpha

Una alpha se cierra si:

- [ ] Cohorte, consentimiento, reglas y soporte fueron definidos.
- [ ] Métricas, feedback, bugs e incidentes fueron recopilados.
- [ ] No hay incidentes críticos abiertos.
- [ ] Los hallazgos tienen prioridad, dueño y próxima acción.
- [ ] Se ejecutó retrospectiva.
- [ ] Hay decisión go/no-go/iterate/pause documentada.

### Beta privada

Una beta privada se cierra o amplía si:

- [ ] Integridad de resultado terminal, recurso crítico, configuración y privacidad se mantuvo.
- [ ] SLOs/SLIs se evaluaron.
- [ ] Costos, cuotas, abuso y soporte permanecieron dentro de capacidad.
- [ ] Backups, rollback y runbooks fueron operativos si se necesitaron.
- [ ] Usuarios recibieron comunicación honesta de cualquier pausa/incidente.
- [ ] Se documentó decisión de ampliar, iterar, pausar o cerrar.

---

## 20. Cierre de incidentes

Un incidente solo puede pasar a `CERRADO` después de:

```text
DETECTADO
→ TRIAGE
→ CONTENIDO
→ MITIGADO
→ VERIFICADO
→ POST-MORTEM
→ CERRADO
```

Checklist:

- [ ] Daño contenido.
- [ ] Evidencia preservada.
- [ ] Usuarios afectados informados cuando corresponda.
- [ ] Servicio/regla/integridad recuperados y verificados.
- [ ] Causa raíz o hipótesis principal documentada.
- [ ] Se identificaron acciones preventivas.
- [ ] Runbook actualizado.
- [ ] Tests/regresiones añadidos si aplica.
- [ ] Riesgo actualizado.
- [ ] Responsable acepta riesgo residual.
- [ ] Post-mortem sin culpa registrado.

Un incidente no se cierra solo porque “ya no se ve el error”.

---

## 21. Plantilla de cierre para cualquier elemento

```md
## Cierre

- ID: [ID]
- Tipo: [issue / documento / regla / decisión / riesgo / test / incidente / hito]
- Nivel DoD: [L1 / L2 / L3 / L4]
- Estado de trabajo final: [CERRADO]
- Estado de evidencia: [DISEÑADO / IMPLEMENTADO / TESTEADO / AUDITADO / OPERATIVO]
- Responsable de aceptación: Luigi
- Fecha de aceptación: [YYYY-MM-DD]

### Resultado entregado

[Descripción concreta del resultado.]

### Criterios de aceptación

- [x] [Criterio y evidencia]
- [x] [Criterio y evidencia]

### Evidencia

- Tests: [IDs/rutas/resultados]
- Auditoría/revisión: [ruta/resultado]
- Staging/simulacro: [resultado o “no aplica”]
- Logs/métricas/audit event: [referencia o “no aplica”]

### Riesgos y pendientes

- Riesgos actualizados: [IDs]
- Pendientes no bloqueantes: [IDs o “ninguno”]
- Deuda técnica: [IDs o “ninguna”]

### Documentos actualizados

- [ ] bitacora.md
- [ ] inteligencia.md
- [ ] planmaestro.md
- [ ] arquitectura.md
- [ ] ADR
- [ ] matriz de trazabilidad
- [ ] runbook

### Siguiente paso

[Issue/hito/desbloqueo concreto.]
```

---

## 22. Antipatrones de cierre

### “El código compila”

Compilar no demuestra que reglas, permisos, errores, privacidad ni UX funcionen.

### “La IA dijo que está terminado”

La IA puede revisar y proponer; no sustituye pruebas ni aceptación humana.

### “Funciona en local”

No demuestra integración, configuración, secrets, permisos, staging, fallback ni operación.

### “No hubo errores en mis pruebas rápidas”

No demuestra cobertura de casos borde, concurrencia, permisos o regresiones.

### “No documentamos porque es obvio”

Lo obvio hoy es contexto perdido mañana. Documentar decisiones y evidencia es parte de la entrega.

### “Hay un pendiente pequeño, pero cerremos igual”

Si no bloquea, crear issue/riesgo con dueño. Si bloquea integridad, privacidad, recurso crítico, resultado terminal, permisos o seguridad, no cerrar.

### “Quitamos el test para que pase el pipeline”

Prohibido. Un test crítico que falla indica un problema; se corrige implementación, fixture o requisito con trazabilidad.

---

## 23. Auditoría rápida antes de cerrar

### L1/L2

```text
[ ] Cumple objetivo y criterios.
[ ] Evidencia mínima guardada.
[ ] Bitácora y documento afectados actualizados.
[ ] No hay pendiente bloqueante oculto.
[ ] Luigi acepta.
```

### L3/L4

```text
[ ] Todos los criterios críticos pasan.
[ ] Tests, seguridad, permisos, privacidad y regresión revisados.
[ ] Observabilidad/audit events/fallback aplicables verificados.
[ ] Documentos y trazabilidad sincronizados.
[ ] Riesgos/deuda/runbooks actualizados.
[ ] Auditoría/segunda pasada completada.
[ ] No hay hallazgos críticos abiertos.
[ ] Luigi acepta explícitamente.
```

---

## 24. Gate de cierre del documento

Este documento se considera activo cuando:

- [x] Distingue DoR de DoD.
- [x] Define cuatro niveles de rigor.
- [x] Incluye resultado, evidencia, calidad, seguridad, documentación y cierre.
- [x] Define requisitos especiales para IA, datos, resultado terminal, recurso crítico y operación.
- [x] Define cierre de tests, riesgos, hitos, alpha/beta e incidentes.
- [x] Incluye plantilla reusable de cierre.
- [x] Establece que Luigi, no la IA, acepta el cierre.
- [x] Indica el siguiente documento de la secuencia.

### Próximo documento

`convenciones.md` — nombres, IDs, rutas, versiones, ramas futuras, commits futuros, lenguaje, formato de documentos y reglas de actualización.

---

## 25. Historial de cambios

| Versión | Fecha | Cambio | Responsable |
|---|---|---|---|
| 0.1.0 | 2026-09-10 | Creación de la Definition of Done por niveles de riesgo | Luigi |
