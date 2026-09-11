# Estados del Trabajo — Vibe System

> **Estado:** ACTIVO  
> **Fuente de verdad para:** estado de ideas, requisitos, decisiones, riesgos, documentos, issues, funcionalidades, pruebas, hitos y releases  
> **Aplica a:** toda la documentación local del proyecto antes y después de crear repositorio Git  
> **Relacionado con:** `definition-of-ready.md`, `definition-of-done.md`, `convenciones.md`, `inteligencia.md`, `bitacora.md`  
> **Responsable:** Luigi  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-10  
> **Última actualización:** 2026-09-11  
> **Próxima revisión:** al crear el primer backlog ejecutable o si un estado resulta ambiguo

---

## 0. Propósito

Este documento define el lenguaje único para indicar en qué punto se encuentra cualquier elemento del proyecto. Su objetivo es evitar frases ambiguas como:

- “Ya está listo”.
- “Eso está hecho”.
- “La IA ya lo resolvió”.
- “Está casi terminado”.
- “Ya fue probado”.

En Vibe System, cada elemento debe indicar:

1. **Estado de trabajo:** en qué parte del flujo se encuentra.
2. **Estado de evidencia:** qué tan comprobado está.
3. **Responsable:** quién debe moverlo o aprobarlo.
4. **Siguiente acción:** qué debe pasar para que avance.
5. **Fuente:** dónde se documenta su definición, decisión o evidencia.

> **Regla central:** un documento diseñado, una función codificada y una función probada en staging son cosas diferentes. Nunca usar una sola palabra como “completado” para representar las tres.

---

## 1. Alcance

Estos estados se aplican a:

- Ideas de producto o mejora.
- Requisitos y reglas de negocio.
- Decisiones y ADRs.
- Riesgos y dependencias.
- Documentos y plantillas.
- Hitos, epics e issues.
- Componentes técnicos y contratos.
- Integraciones externas.
- Prompts, guardrails y evaluaciones de IA.
- Pantallas, flujos UX y criterios de accesibilidad.
- Tests, simulacros, auditorías y runbooks.
- Releases, cohortes alpha/beta e incidentes.

No se aplican a secretos, contraseñas, tokens ni credenciales: esos elementos se gestionan en un sistema seguro externo y nunca deben aparecer en documentación operativa.

---

## 2. Modelo de estado

Cada elemento usa dos dimensiones obligatorias:

```text
A. Estado de trabajo: dónde está en el flujo.
B. Estado de evidencia: qué se ha demostrado.
```

Ejemplo correcto:

```text
RB-006 — Fallo de IA no consume intento
Estado de trabajo: PLANIFICADO
Estado de evidencia: DISEÑADO
Responsable: Luigi
Siguiente acción: definir caso de prueba T-IA-003 en H4
Fuente: inteligencia.md
```

Ejemplo incorrecto:

```text
RB-006 — Listo
```

---

# Parte A — Estados de trabajo

## 3. Flujo principal

```text
IDEA
  ↓
DESCUBRIMIENTO
  ↓
PLANIFICADO
  ↓
AUDITADO
  ↓
LISTO
  ↓
EJECUTANDO
  ↓
TESTEANDO
  ↓
EN STAGING
  ↓
ACEPTADO
  ↓
CERRADO
```

No todos los elementos recorren exactamente todos los estados. Por ejemplo, una idea puede ser `RECHAZADA`; un documento puede pasar de `EJECUTANDO` a `ACEPTADO` sin staging; una funcionalidad crítica no puede saltarse testing o staging.

---

## 4. Estados principales

### 4.1 IDEA

**Definición:** propuesta inicial que todavía no tiene alcance, evidencia, prioridad ni aprobación.

**Se usa para:**

- Nueva función sugerida.
- Mejora de UX.
- Integración posible.
- Cambio de modelo IA.
- Nueva mecánica.
- Idea de monetización futura.
- Hallazgo inicial de riesgo.

**Debe contener como mínimo:**

- Título breve.
- Descripción de una o dos líneas.
- Origen: usuario, conversación, feedback, incidente o investigación.
- Fecha.
- Responsable temporal.

**No significa:**

- Que se implementará.
- Que está aprobada.
- Que se puede prometer a usuarios.
- Que se puede agregar a una operación activa.

**Transiciones permitidas:**

```text
IDEA → DESCUBRIMIENTO
IDEA → RECHAZADO
IDEA → DEPRECADO
```

**Ejemplo:**

```text
IDEA: Agregar modo de práctica sin recurso crítico.
Origen: feedback potencial de usuarios.
Siguiente acción: evaluar impacto en reglas, costo IA y UX.
```

---

### 4.2 DESCUBRIMIENTO

**Definición:** se está entendiendo el problema, alternativas, riesgos, restricciones y preguntas antes de decidir.

**Se usa para:**

- Requisitos ambiguos.
- Decisiones de stack/proveedor.
- Diseño de una nueva operación.
- Posible cambio de reglas.
- Evaluación de una integración.
- Investigación legal, técnica o de UX.

**Debe contener como mínimo:**

- Objetivo de descubrimiento.
- Preguntas pendientes.
- Alternativas consideradas.
- Riesgos iniciales.
- Fuente de información.
- Criterio para salir del descubrimiento.

**Salida válida:**

- Requisito claro.
- Decisión documentada.
- Propuesta rechazada.
- Riesgo escalado a especialista.

**Transiciones permitidas:**

```text
DESCUBRIMIENTO → PLANIFICADO
DESCUBRIMIENTO → BLOQUEADO
DESCUBRIMIENTO → RECHAZADO
DESCUBRIMIENTO → PAUSADO
```

**Ejemplo:**

```text
DESCUBRIMIENTO: Elegir mecanismo realtime inicial.
Alternativas: polling, SSE, WebSockets.
Criterio de salida: ADR con costo, complejidad, fallback y compatibilidad beta.
```

---

### 4.3 PLANIFICADO

**Definición:** el objetivo, alcance, dependencias, riesgos y criterios de aceptación están definidos, pero aún no se ha realizado una auditoría de preparación ni se ha autorizado la ejecución.

**Debe contener como mínimo:**

- ID y título.
- Objetivo visible.
- Alcance y exclusiones.
- Criterios de aceptación.
- Dependencias.
- Riesgos aplicables.
- Tests esperados.
- Documentos fuente.
- Siguiente acción para auditoría o preparación.

**No significa:**

- Que se puede empezar de inmediato.
- Que la IA tiene permiso de modificar archivos.
- Que una decisión estructural ya está aprobada.

**Transiciones permitidas:**

```text
PLANIFICADO → AUDITADO
PLANIFICADO → DESCUBRIMIENTO
PLANIFICADO → BLOQUEADO
PLANIFICADO → PAUSADO
PLANIFICADO → RECHAZADO
```

**Ejemplo:**

```text
PLANIFICADO: E1-05 — Implementar intentos, secuencia e idempotencia.
Criterio: un doble envío no crea dos intentos.
Test esperado: T-GAME-005.
```

---

### 4.4 AUDITADO

**Definición:** una revisión de requisitos, coherencia, seguridad, privacidad, arquitectura, UX y riesgos confirmó que el plan es suficientemente claro para prepararse o ejecutarse.

**La auditoría debe responder:**

- ¿El objetivo está claro?
- ¿El alcance evita cambios no deseados?
- ¿Hay contradicción con reglas de negocio, arquitectura o PM anteriores?
- ¿Hay riesgos legales, de privacidad, seguridad, costo o UX?
- ¿Los criterios de aceptación se pueden probar?
- ¿Se requiere ADR, especialista o aprobación adicional?
- ¿La tarea respeta funciones bloqueadas?

**Resultado posible de la auditoría:**

```text
APROBADO PARA PREPARACIÓN
APROBADO CON CONDICIONES
DEVUELTO A DESCUBRIMIENTO
BLOQUEADO POR RIESGO
RECHAZADO
```

**Transiciones permitidas:**

```text
AUDITADO → LISTO
AUDITADO → PLANIFICADO
AUDITADO → DESCUBRIMIENTO
AUDITADO → BLOQUEADO
AUDITADO → RECHAZADO
```

**Regla:** auditado no equivale a implementado; significa que el plan fue revisado.

---

### 4.5 LISTO

**Definición:** el elemento cumple Definition of Ready y puede comenzar ejecución sin ambigüedad significativa.

**Condiciones obligatorias:**

- Alcance claro.
- Criterios de aceptación verificables.
- Dependencias resueltas o declaradas.
- Riesgos conocidos y mitigaciones iniciales.
- Tests esperados definidos.
- Documentos fuente identificados.
- Aprobaciones necesarias obtenidas.
- No incluye funciones bloqueadas.

**Transiciones permitidas:**

```text
LISTO → EJECUTANDO
LISTO → BLOQUEADO
LISTO → PAUSADO
LISTO → DESCUBRIMIENTO
```

**Ejemplo:**

```text
LISTO: E0-01 — Crear estructura documental local.
Fuentes: el roadmap del proyecto, inteligencia.md.
Criterio: árbol de carpetas creado y validado.
```

---

### 4.6 EJECUTANDO

**Definición:** se está produciendo el artefacto acordado: documento, diseño, código, script, test, configuración o investigación aprobada.

**Reglas durante ejecución:**

- Trabajar una intención o módulo a la vez.
- No ampliar alcance sin registrar cambio.
- No modificar documentos/fuentes no relacionados sin justificarlo.
- Registrar bloqueos y decisiones al detectarlos.
- Mantener los cambios reversibles cuando sea posible.
- No usar secretos reales en ejemplos, pruebas o prompts.

**Debe registrar:**

- Inicio de trabajo.
- Archivos/artefactos afectados.
- Cambios realizados.
- Riesgos encontrados.
- Tests a ejecutar.
- Próximo paso.

**Transiciones permitidas:**

```text
EJECUTANDO → TESTEANDO
EJECUTANDO → BLOQUEADO
EJECUTANDO → PAUSADO
EJECUTANDO → DESCUBRIMIENTO
EJECUTANDO → PLANIFICADO
```

Se regresa a `PLANIFICADO` o `DESCUBRIMIENTO` si se descubre que el alcance era incorrecto o insuficiente.

---

### 4.7 TESTEANDO

**Definición:** el artefacto fue creado y ahora se está validando contra criterios de aceptación, reglas, casos de error, permisos, regresiones y riesgos aplicables.

**Tipos de validación posibles:**

- Revisión documental.
- Test unitario.
- Test de integración.
- Test de contrato.
- Test E2E.
- Revisión manual UX/accesibilidad.
- Secret scan.
- Prueba de permisos.
- Simulación de incidente.
- Red teaming IA.
- Restore de backup.
- Revisión por usuario/cliente.

**Debe registrar:**

- Tests ejecutados.
- Resultado esperado.
- Resultado observado.
- Evidencia: enlace, salida, captura o registro.
- Bugs/hallazgos y severidad.

**Transiciones permitidas:**

```text
TESTEANDO → EN STAGING
TESTEANDO → ACEPTADO
TESTEANDO → EJECUTANDO
TESTEANDO → BLOQUEADO
TESTEANDO → PAUSADO
```

### Regla de fallo

Si falla un test crítico, el elemento vuelve a `EJECUTANDO`; no se declara “casi listo”.

---

### 4.8 EN STAGING

**Definición:** el cambio está desplegado o simulado en un entorno parecido al real, sin ser producción/beta pública, para validar integración, configuración, UX, observabilidad y rollback.

**Se exige para:**

- Cambios de API, DB, autenticación, permisos o migraciones.
- Integración de IA real/sandbox.
- Realtime.
- Flujos E2E críticos.
- Datos/privacidad.
- Feature flags.
- Backups/restore/rollback.
- Preparación de alpha/beta.

**No se exige para:**

- Correcciones documentales simples.
- Tests unitarios puros sin integración.
- Cambios internos sin efecto de runtime, salvo que el riesgo lo requiera.

**Debe validar:**

- Smoke tests.
- Métricas/logs/trazas si aplica.
- Estados de error y fallback.
- Compatibilidad de configuración.
- Rollback disponible.
- Ausencia de secretos/PII expuestos.

**Transiciones permitidas:**

```text
EN STAGING → ACEPTADO
EN STAGING → EJECUTANDO
EN STAGING → BLOQUEADO
EN STAGING → PAUSADO
```

---

### 4.9 ACEPTADO

**Definición:** el responsable aprobó la entrega porque los criterios de aceptación se cumplieron y la evidencia fue revisada.

**Diferencia importante:**

- `TESTEANDO` significa “se está comprobando”.
- `ACEPTADO` significa “una persona responsable confirma que cumple”.
- `CERRADO` significa “además de aceptado, quedó documentado, trazado y listo para no bloquear el siguiente paso”.

**Debe contener:**

- Fecha de aceptación.
- Responsable que acepta.
- Evidencia revisada.
- Pendientes no bloqueantes, si existen.
- Condición de garantía/seguimiento si aplica.

**Transiciones permitidas:**

```text
ACEPTADO → CERRADO
ACEPTADO → EJECUTANDO
ACEPTADO → PAUSADO
```

Un elemento aceptado puede volver a ejecución si aparece una regresión o una evidencia nueva importante.

---

### 4.10 CERRADO

**Definición:** el elemento cumplió Definition of Done. La entrega fue aceptada, documentada, trazada y no deja acciones bloqueantes ocultas.

**Condiciones mínimas:**

- Criterios de aceptación cumplidos.
- Tests/gates correspondientes verdes.
- Documentos actualizados.
- Evidencia guardada.
- Riesgos/pendientes actualizados.
- Siguiente paso identificado o dependencia desbloqueada.
- Cambio registrado en `bitacora.md`.

**Regla:** cerrar no significa que nunca se tocará de nuevo. Si una nueva necesidad aparece, se crea una nueva idea/issue o un cambio; no se reabre silenciosamente sin trazabilidad.

**Transiciones permitidas:**

```text
CERRADO → DEPRECADO
CERRADO → DESCUBRIMIENTO
```

Solo se reabre formalmente cuando cambia una decisión, aparece regresión o se crea una evolución legítima.

---

# Parte B — Estados alternativos

## 5. BLOQUEADO

**Definición:** el elemento no puede avanzar por una dependencia externa, decisión pendiente, riesgo no resuelto, falta de acceso, falta de evidencia o limitación técnica/legal.

**No usar BLOQUEADO para:**

- Falta de ganas.
- Falta de tiempo sin análisis.
- “No sé por dónde empezar”; eso es `DESCUBRIMIENTO`.
- Un bug que debe corregirse; eso es `EJECUTANDO` o `TESTEANDO`.

**Toda entrada bloqueada debe tener:**

| Campo | Obligatorio |
|---|---|
| ID del elemento bloqueado | Sí |
| Bloqueador exacto | Sí |
| Impacto | Sí |
| Responsable de desbloquear | Sí |
| Alternativa temporal | Si existe |
| Fecha/condición de revisión | Sí |
| Riesgo de esperar | Sí |

**Ejemplo:**

```text
E4-03 — Selección de proveedor IA
Estado: BLOQUEADO
Bloqueador: falta ADR de costo, privacidad, cuota y fallback.
Impacto: no se integra IA real.
Responsable: Luigi.
Revisión: antes de iniciar H4.
```

**Transiciones permitidas:**

```text
BLOQUEADO → DESCUBRIMIENTO
BLOQUEADO → PLANIFICADO
BLOQUEADO → LISTO
BLOQUEADO → PAUSADO
BLOQUEADO → RECHAZADO
```

---

## 6. PAUSADO

**Definición:** el elemento está detenido por una decisión consciente, aunque podría continuar. No necesariamente tiene un bloqueo externo.

**Ejemplos correctos:**

- Se detiene una función para terminar una invariante crítica.
- Se pausa una cohorte beta por revisión de incidentes.
- Se pospone una idea hasta que haya evidencia de demanda.
- Se detiene un cambio de UX mientras se revisa arquitectura.

**Debe registrar:**

- Motivo de pausa.
- Fecha.
- Responsable que pausó.
- Condición para reanudar.
- Impacto sobre otras tareas.

**Transiciones permitidas:**

```text
PAUSADO → DESCUBRIMIENTO
PAUSADO → PLANIFICADO
PAUSADO → LISTO
PAUSADO → RECHAZADO
PAUSADO → DEPRECADO
```

---

## 7. RECHAZADO

**Definición:** se decidió conscientemente no ejecutar una propuesta, requisito, cambio o alternativa.

**Reglas:**

- No borrar ideas rechazadas si pueden volver a aparecer.
- Registrar motivo de rechazo.
- Indicar si puede revisarse bajo una condición futura.
- Enlazar a decisión o bitácora.

**Ejemplos prácticos:**

- Pagos activos en un MVP de validación.
- Anuncios invasivos activos en una beta inicial.
- Dependencias no auditadas en producción.
- Agentes de IA con shell/browser/DB/autonomía crítica sin supervisión.

**Transiciones permitidas:**

```text
RECHAZADO → DESCUBRIMIENTO
RECHAZADO → DEPRECADO
```

La reapertura requiere nueva evidencia, un nuevo issue y análisis de impacto. No se revive una idea rechazada con un simple “ahora sí”.

---

## 8. DEPRECADO

**Definición:** un elemento existió, fue válido o útil, pero fue reemplazado y no debe usarse como guía vigente.

**Se usa para:**

- Decisión reemplazada.
- Prompt/modelo antiguo.
- Contrato API anterior.
- Regla de negocio sustituida.
- Documento que fue dividido o migrado.
- Feature flag eliminada.

**Debe registrar:**

- Qué fue deprecado.
- Fecha.
- Razón.
- Reemplazo vigente.
- Riesgo de usar la versión anterior.

**Ejemplo:**

```text
D-014 — Usar WebSockets como única estrategia realtime
Estado: DEPRECADO
Reemplazo: D-021 — SSE con polling fallback.
Motivo: reducir complejidad inicial y mantener degradación segura.
```

**Transiciones permitidas:**

```text
DEPRECADO → DESCUBRIMIENTO
```

Solo si existe una razón nueva, documentada y aprobada para revaluar la decisión.

---

# Parte C — Estados de evidencia

## 9. DISEÑADO

**Definición:** existe una especificación, requisito, mockup, ADR, flujo o plan aprobado, pero no existe implementación funcional comprobada.

**Ejemplos:**

- Máquina de estados de operación definida en documento.
- Política de privacidad preliminar redactada.
- Guardrail de IA especificado.
- Roadmap H0–H8 creado.

**No afirmar:** “funciona”, “está protegido”, “está listo para beta”.

---

## 10. IMPLEMENTADO

**Definición:** existe el artefacto concreto: código, script, configuración, documento operativo o interfaz creada.

**No significa:** que pase tests, que sea seguro, que esté desplegado o que funcione en staging.

**Ejemplo:**

```text
Estado de trabajo: TESTEANDO
Estado de evidencia: IMPLEMENTADO
```

---

## 11. TESTEADO

**Definición:** una prueba definida fue ejecutada y su resultado fue registrado. Puede haber pasado o fallado; por eso debe acompañarse de resultado.

### Resultado obligatorio

```text
PASS
FAIL
PARTIAL
NO APLICA
BLOQUEADO
```

**Ejemplo correcto:**

```text
T-IA-003 — Timeout no consume intento
Evidencia: TESTEADO
Resultado: PASS
Ambiente: staging
Fecha: YYYY-MM-DD
```

---

## 12. AUDITADO

**Definición:** una revisión formal verificó coherencia entre alcance, riesgos, reglas, arquitectura, evidencia y operación.

**No significa:** que sea legalmente aprobado, seguro contra todo ataque o libre de bugs. Significa que el alcance de auditoría se completó y los hallazgos fueron registrados.

**Debe registrar:**

- Alcance de auditoría.
- Revisor.
- Hallazgos críticos, altos, medios y bajos.
- Decisión: aprobar, aprobar con condiciones, devolver o bloquear.
- Acciones pendientes.

---

## 13. OPERATIVO

**Definición:** el elemento funcionó en el ambiente objetivo bajo condiciones controladas y con observabilidad suficiente.

**Ejemplos:**

- Backup restaurado exitosamente en staging.
- Kill switch probado durante simulacro.
- Operación alpha operada sin incidente crítico.
- Alertas recibidas y atendidas según runbook.

**No usar OPERATIVO** para código que solo funciona localmente.

---

## 14. Matriz de combinación válida

| Estado de trabajo | Evidencia típica permitida |
|---|---|
| IDEA | No evaluado / Supuesto |
| DESCUBRIMIENTO | Parcial / Investigación en curso |
| PLANIFICADO | Diseñado |
| AUDITADO | Diseñado + Auditado |
| LISTO | Diseñado + Auditado, DoR cumplido |
| EJECUTANDO | Diseñado / Implementación parcial |
| TESTEANDO | Implementado + Testeado (PASS/FAIL) |
| EN STAGING | Implementado + Testeado + staging en curso |
| ACEPTADO | Implementado + Testeado + revisión aprobada |
| CERRADO | Testeado + documentado + evidencia completa |
| BLOQUEADO | Cualquier evidencia, con bloqueo explícito |
| PAUSADO | Cualquier evidencia, con razón de pausa |
| RECHAZADO | Diseñado/analizado, decisión de no ejecutar |
| DEPRECADO | Evidencia histórica + reemplazo vigente |

---

# Parte D — Reglas por tipo de elemento

## 15. Requisitos y reglas de negocio

Un requisito o regla de negocio debe pasar por:

```text
IDEA/DESCUBRIMIENTO
→ PLANIFICADO
→ AUDITADO
→ LISTO
→ IMPLEMENTADO
→ TESTEADO
→ ACEPTADO
→ CERRADO
```

### Regla crítica

Una regla solo es `OPERATIVA` cuando existe en código, tiene test y está observada/validada en el ambiente correspondiente.

---

## 16. Decisiones y ADRs

Una decisión usa estos estados preferentes:

```text
PROPUESTA (equivale a DESCUBRIMIENTO)
→ ACEPTADA
→ IMPLEMENTADA
→ DEPRECADA
```

En este sistema se registrará además el estado de trabajo general:

| Situación | Estado de trabajo | Evidencia |
|---|---|---|
| Alternativas investigadas | DESCUBRIMIENTO | Parcial |
| Decisión lista para aprobar | AUDITADO | Diseñado |
| ADR aprobado | ACEPTADO | Auditado |
| Decisión aplicada en código/config | CERRADO | Implementado/Testeado |
| Decisión reemplazada | DEPRECADO | Histórica |

---

## 17. Riesgos

Un riesgo no se “cierra” porque dejó de preocupar. Debe clasificarse:

```text
IDENTIFICADO
→ ANALIZADO
→ MITIGADO
→ ACEPTADO
→ CERRADO
```

Para mantener el lenguaje común, usar:

| Riesgo | Estado de trabajo | Significado |
|---|---|---|
| Detectado sin análisis | IDEA / DESCUBRIMIENTO | Riesgo inicial |
| Evaluado | PLANIFICADO / AUDITADO | Probabilidad, impacto y dueño definidos |
| Con controles aplicados | EJECUTANDO / TESTEANDO | Mitigación se implementa/prueba |
| Riesgo residual aceptado | ACEPTADO | Responsable acepta residual |
| Ya no aplica | CERRADO / DEPRECADO | Motivo y evidencia registrados |

### Riesgo crítico

Un riesgo crítico abierto bloquea el hito asociado. No se puede esconder como “pendiente menor”.

---

## 18. Tests

Un test usa estos estados:

```text
NO DEFINIDO
→ DISEÑADO
→ IMPLEMENTADO
→ EJECUTADO PASS/FAIL
→ REGRESIÓN ACTIVA
→ DEPRECADO
```

Regla:

- Un test que falla no se cierra; genera o actualiza un issue.
- Un test de seguridad, privacidad, resultado terminal, recurso crítico o no-consumo no se elimina para “poner verde” el pipeline.
- Un test obsoleto se depreca y se indica su reemplazo.

---

## 19. Documentos

Un documento puede estar:

```text
BORRADOR
→ EN REVISIÓN
→ ACTIVO
→ ARCHIVADO / DEPRECADO
```

Mapeo al sistema general:

| Estado documental | Estado de trabajo |
|---|---|
| BORRADOR | EJECUTANDO |
| EN REVISIÓN | TESTEANDO / AUDITADO |
| ACTIVO | ACEPTADO / CERRADO |
| ARCHIVADO | DEPRECADO |

Todos los documentos activos deben incluir cabecera con:

```md
> Estado: ACTIVO
> Fuente de verdad: Sí / No
> Responsable: [nombre o rol]
> Última actualización: YYYY-MM-DD
> Próxima revisión: [fecha o condición]
```

---

## 20. Incidentes

Un incidente no debe usar el flujo de una tarea común. Usa:

```text
DETECTADO
→ EN TRIAGE
→ CONTENIDO
→ MITIGANDO
→ RESUELTO
→ POST-MORTEM
→ CERRADO
```

Correspondencia general:

| Estado incidente | Estado general |
|---|---|
| DETECTADO / EN TRIAGE | DESCUBRIMIENTO |
| CONTENIDO / MITIGANDO | EJECUTANDO |
| RESUELTO | TESTEANDO |
| POST-MORTEM | AUDITADO |
| CERRADO | CERRADO |

Los incidentes SEV-1 pueden pausar operaciones, cohortes o despliegues. La prioridad es contener el daño, preservar la evidencia y proteger a los usuarios; no terminar una tarea planeada.

---

# Parte E — Transiciones y autoridad

## 21. Quién puede mover un estado

Mientras Luigi sea el único responsable operativo:

| Cambio | Autoridad mínima |
|---|---|
| IDEA → DESCUBRIMIENTO | Luigi |
| DESCUBRIMIENTO → PLANIFICADO | Luigi, con evidencia registrada |
| PLANIFICADO → AUDITADO | Luigi/IA prepara auditoría |
| AUDITADO → LISTO | Luigi aprueba condiciones |
| LISTO → EJECUTANDO | Luigi |
| EJECUTANDO → TESTEANDO | Luigi, tras entrega de artefacto |
| TESTEANDO → ACEPTADO | Luigi, tras revisar evidencia |
| ACEPTADO → CERRADO | Luigi, tras DoD |
| Cualquier estado → BLOQUEADO | Luigi o alerta/gate verificable |
| Cualquier estado → PAUSADO | Luigi; obligatorio registrar motivo |
| Función financiera/alto riesgo → LISTO o superior | Luigi + revisión externa requerida según riesgo |

### Rol de la IA

La IA puede:

- Proponer cambios de estado.
- Detectar falta de evidencia.
- Preparar planes, auditorías, tests y documentos.
- Señalar contradicciones.

La IA no puede:

- Declarar unilateralmente una tarea aceptada/cerrada.
- Aprobar pagos, recurso críticos, cambios legales o acceso a datos sensibles.
- Cambiar reglas activas o borrar evidencia.

---

## 22. Transiciones prohibidas

Las siguientes transiciones están prohibidas salvo procedimiento de excepción documentado:

```text
IDEA → EJECUTANDO
IDEA → CERRADO
DESCUBRIMIENTO → CERRADO
PLANIFICADO → CERRADO
AUDITADO → CERRADO
EJECUTANDO → ACEPTADO sin pruebas
EJECUTANDO → CERRADO
TESTEANDO → CERRADO con test crítico fallido
BLOQUEADO → CERRADO sin resolver o aceptar formalmente el bloqueo
RECHAZADO → EJECUTANDO sin nuevo descubrimiento
DEPRECADO → EJECUTANDO sin nueva decisión/ADR
```

---

## 23. Excepción de proceso

Una excepción solo se permite si:

- Existe motivo urgente y documentado.
- No involucra secretos, PII, dinero, recurso crítico, resultado terminal, permisos críticos ni seguridad.
- Tiene responsable.
- Tiene duración limitada.
- Tiene plan para normalizar documentación/tests después.
- Queda registrada en `bitacora.md` y, si es relevante, en un ADR.

No se permiten excepciones para saltar gates de privacidad, autoridad de IA, resultado consistente único, recurso reservado y validado o secretos.

---

# Parte F — Uso práctico

## 24. Plantilla de estado para cualquier elemento

Copiar este bloque en issues, documentos o bitácora cuando aplique:

```md
### Estado

- ID: [ID]
- Tipo: [idea / requisito / decisión / riesgo / issue / test / documento / incidente]
- Estado de trabajo: [ESTADO]
- Estado de evidencia: [DISEÑADO / IMPLEMENTADO / TESTEADO / AUDITADO / OPERATIVO]
- Resultado de prueba: [PASS / FAIL / PARTIAL / NO APLICA / BLOQUEADO]
- Responsable: [nombre o rol]
- Dependencias: [IDs o ninguna]
- Riesgos: [IDs o ninguno]
- Fuente: [archivos/documentos]
- Última actualización: [YYYY-MM-DD]
- Siguiente acción: [acción concreta]
```

---

## 25. Ejemplos prácticos de aplicación

### Ejemplo A — Documento roadmap

```text
ID: DOC-ROADMAP-001
Tipo: documento
Estado de trabajo: ACEPTADO
Estado de evidencia: DISEÑADO
Resultado de prueba: NO APLICA
Responsable: Luigi
Dependencias: hitos H0 a H8 del roadmap
Fuente: el roadmap del proyecto
Siguiente acción: crear estados-del-trabajo.md
```

### Ejemplo B — Regla de resultado consistente único

```text
ID: RB-004
Tipo: regla de negocio
Estado de trabajo: PLANIFICADO
Estado de evidencia: DISEÑADO
Resultado de prueba: NO APLICA
Responsable: Luigi
Dependencias: H1 / E1-07
Riesgos: R-005
Fuente: inteligencia.md, el roadmap del proyecto
Siguiente acción: definir máquina de estados y test concurrente.
```

### Ejemplo C — Pago real

```text
ID: IDEA-MON-001
Tipo: idea de monetización
Estado de trabajo: RECHAZADO
Estado de evidencia: DISEÑADO
Resultado de prueba: NO APLICA
Responsable: Luigi
Fuente: fase H1 del roadmap (documentada en inteligencia.md)
Siguiente acción: no reabrir hasta H8, consulta legal y gates aprobados.
```

### Ejemplo D — Falla de IA

```text
ID: T-IA-003
Tipo: test crítico
Estado de trabajo: PLANIFICADO
Estado de evidencia: DISEÑADO
Resultado de prueba: NO APLICA
Responsable: Luigi
Dependencias: H4 / E4-09
Riesgos: R-007
Fuente: el roadmap del proyecto
Siguiente acción: crear fixture de timeout y verificar no-consumo.
```

---

## 26. Checklist de aplicación

Antes de mover un elemento de estado, verificar:

```text
[ ] ¿El estado de trabajo describe realmente el punto actual?
[ ] ¿El estado de evidencia no exagera lo que se ha demostrado?
[ ] ¿Existe fuente o evidencia para la afirmación?
[ ] ¿Hay responsable y siguiente acción?
[ ] ¿Las dependencias/bloqueos están visibles?
[ ] ¿El movimiento respeta las transiciones permitidas?
[ ] ¿Se actualizó bitácora/inteligencia/arquitectura si corresponde?
[ ] ¿El cambio modifica una regla, arquitectura o riesgo que necesita ADR?
[ ] ¿El elemento activa una función bloqueada? De ser así, detener y escalar.
```

---

## 27. Gate de cierre del documento

Este documento se considera activo cuando:

- [x] Define estados principales y alternativos.
- [x] Distingue trabajo de evidencia.
- [x] Define transiciones permitidas y prohibidas.
- [x] Define autoridad humana e IA.
- [x] Incluye uso para requisitos, decisiones, riesgos, tests, documentos e incidentes.
- [x] Incluye plantilla práctica y ejemplos de aplicación.
- [x] Identifica que la IA propone estados, pero Luigi aprueba cierres.

### Próximo documento

`definition-of-ready.md` — condiciones obligatorias para que un issue pueda pasar a `LISTO` e iniciar ejecución.

---

## 28. Historial de cambios

| Versión | Fecha | Cambio | Responsable |
|---|---|---|---|
| 0.1.0 | 2026-09-10 | Creación del sistema de estados de trabajo y evidencia | Luigi |
