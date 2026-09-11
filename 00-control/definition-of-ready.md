# Definition of Ready (DoR) — Vibe System

> **Estado:** ACTIVO  
> **Fuente de verdad para:** determinar si una idea, issue, documento, cambio, experimento, integración o módulo está preparado para iniciar ejecución  
> **Relacionado con:** `estados-del-trabajo.md`, `definition-of-done.md`, `convenciones.md`, `inteligencia.md`, `bitacora.md`  
> **Responsable:** Luigi  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-10  
> **Última actualización:** 2026-09-11  
> **Próxima revisión:** al cerrar cada ciclo de desarrollo o si una tarea inicia con ambigüedad que esta DoR no detectó

---

## 0. Propósito

La Definition of Ready (DoR) define cuándo un elemento está suficientemente claro, seguro y preparado para pasar a estado `LISTO` e iniciar `EJECUTANDO`.

Su función es impedir que Luigi o una IA comiencen a trabajar sobre instrucciones como:

- “Haz la app”.
- “Implementa el backend”.
- “Mejora el chat”.
- “Hazlo más seguro”.
- “Agrega pagos”.
- “Arregla todo”.

Esas frases son ideas o solicitudes, no tareas listas para ejecutar.

> **Regla central:** si no se puede explicar qué se construirá, qué no se construirá, cómo se comprobará y qué riesgo puede introducir, el elemento no está listo para empezar.

---

## 1. Principio de preparación

Un elemento listo no tiene que tener todas las respuestas del universo. Debe tener suficiente claridad para que el trabajo sea:

- Limitado.
- Verificable.
- Reversible cuando sea posible.
- Compatible con decisiones ya aprobadas.
- Seguro para el nivel de riesgo.
- Entendible para Luigi sin depender de memoria de una conversación.

La DoR protege contra dos problemas:

```text
Ambigüedad → la IA inventa requisitos.
Alcance excesivo → la IA cambia muchas partes y crea regresiones.
```

---

## 2. Alcance

La DoR aplica a:

- Issues de implementación.
- Cambios de arquitectura.
- Nuevas reglas de negocio.
- Integraciones externas.
- Prompts, filtros y cambios de IA.
- Pantallas y flujos UX.
- Cambios de datos, permisos o privacidad.
- Tests y simulacros.
- Cambios de documentación que afecten decisiones.
- Experimentos alpha/beta.
- Incidentes que requieran corrección.

No sustituye los procesos especiales para:

- Pagos, transacciones financieras, wallets, USDT o blockchain.
- Datos altamente sensibles.
- Decisiones legales.
- Cambios de una operación activa.
- Incidentes SEV-1.

Estos elementos usan DoR reforzada y, cuando aplica, revisión externa o un runbook de incidente.

---

## 3. Relación con estados de trabajo

```text
IDEA
  ↓
DESCUBRIMIENTO
  ↓
PLANIFICADO
  ↓
AUDITADO
  ↓
LISTO  ← DoR completa
  ↓
EJECUTANDO
```

Un elemento puede estar `PLANIFICADO` sin estar listo. Pasa a `LISTO` solamente después de cumplir los criterios de esta DoR y de que Luigi confirme que puede iniciar.

---

## 4. Niveles de DoR

No todos los cambios requieren el mismo rigor. El nivel depende del riesgo y no de qué tan fácil parezca hacerlo.

| Nivel | Tipo de trabajo | Ejemplos | DoR requerida |
|---|---|---|---|
| DoR-L1 | Bajo riesgo | Copy, documento no rector, ajuste visual aislado | DoR básica |
| DoR-L2 | Riesgo medio | Pantalla, endpoint no crítico, reporte, integración interna | DoR estándar |
| DoR-L3 | Alto riesgo | Auth, permisos, datos, IA, reglas, recurso crítico, ranking, migración, feature flag | DoR reforzada |
| DoR-L4 | Crítico | Pagos, dinero, transacción monetaria, datos altamente sensibles, legalidad, producción/beta pública, incidente SEV-1 | DoR crítica + aprobación especializada |

### Regla de clasificación

Si existe duda entre dos niveles, usar el nivel superior hasta demostrar que el riesgo es menor.

---

## 5. DoR básica — L1

Una tarea de bajo riesgo pasa a `LISTO` si cumple:

- [ ] Tiene ID y título claros.
- [ ] Tiene objetivo de una frase.
- [ ] Indica alcance y exclusión mínimos.
- [ ] Indica archivo/documento/módulo afectado.
- [ ] Tiene criterio simple de aceptación.
- [ ] Tiene responsable.
- [ ] Tiene siguiente acción.
- [ ] No toca secreto, PII, reglas, permisos, IA, pagos, recurso crítico o arquitectura.

### Ejemplo L1

```text
ID: DOC-UX-001
Título: Corregir terminología de “apuesta” por “reto” en documento de copy.
Objetivo: mantener lenguaje consistente con sistema en producción.
Incluye: actualizar documento de copy.
Excluye: no cambia reglas legales ni UX implementada.
Criterio: no aparecen términos prohibidos en el documento.
Riesgo: bajo.
```

---

## 6. DoR estándar — L2

Una tarea de riesgo medio pasa a `LISTO` si cumple DoR-L1 y además:

- [ ] Describe el problema que resuelve.
- [ ] Define usuario, actor o componente afectado.
- [ ] Identifica documentos fuente.
- [ ] Define criterios de aceptación verificables.
- [ ] Identifica dependencia técnica/funcional.
- [ ] Identifica riesgo y mitigación inicial.
- [ ] Define prueba manual o automatizada esperada.
- [ ] Indica comportamiento esperado ante error básico.
- [ ] Confirma que no contradice el plan maestro del proyecto, el plano de arquitectura en `03-arquitectura/` o decisiones activas.
- [ ] Define cómo revertir el cambio si algo sale mal, si aplica.

### Ejemplo L2

```text
ID: E3-06
Título: Crear landing y modo lectura.
Problema: un visitante debe entender el reto antes de registrarse.
Actor: visitante.
Incluye: estado de operación, objetivo, reglas resumidas y CTA.
Excluye: no crea chat real ni pagos.
Criterios:
- visitante entiende que es un reto de habilidad;
- puede observar el estado público de la operación;
- no ve PII, secretos ni transcripciones privadas.
Tests: E2E visitante; revisión de DTO público.
Riesgo: publicar información no sanitizada.
Mitigación: usar DTO público definido en H2.
Rollback: ocultar ruta mediante flag si expone información incorrecta.
```

---

## 7. DoR reforzada — L3

Una tarea de alto riesgo pasa a `LISTO` si cumple DoR-L2 y además:

- [ ] Tiene análisis de impacto en producto, arquitectura, datos, seguridad, privacidad, UX, costo y operación.
- [ ] Identifica reglas de negocio, criterios de aceptación y riesgos relacionados mediante IDs.
- [ ] Tiene pruebas unitarias, de integración y/o E2E requeridas explícitamente.
- [ ] Define casos de error, casos límite, permisos y reintentos.
- [ ] Identifica información permitida, sensible, prohibida y secreta.
- [ ] Define logs, métricas o audit events necesarios.
- [ ] Define fallback, rollback o degradación segura.
- [ ] Confirma compatibilidad con feature flags y operaciones activas.
- [ ] Tiene ADR si cambia decisión estructural.
- [ ] Tiene revisión de segunda pasada: IA + Luigi, o especialista si aplica.
- [ ] Actualiza la matriz de trazabilidad prevista.

### Ejemplo L3 — Falla de IA no consume intento

```text
ID: E4-09
Título: Implementar timeout, retry limitado, no-consumo y circuit breaker.

Objetivo:
Cuando el proveedor IA no responde, devuelve error o entrega salida inválida,
el intento debe terminar en FALLIDO_RECUPERABLE y el jugador no debe perder
su intento ni alterar el recurso crítico, puntos o estados de operación.

Reglas relacionadas:
- RB-005: IA sin autoridad de negocio.
- RB-006: fallo de IA no consume intento.
- RB-009: acciones sensibles auditables.

Incluye:
- timeout;
- retry limitado;
- estado FALLIDO_RECUPERABLE;
- restauración/no consumo;
- circuit breaker;
- evento de auditoría;
- métrica de error/timeout.

Excluye:
- cambiar reglas de victoria;
- cambiar proveedor final sin ADR;
- implementar pagos o créditos.

Casos límite:
- timeout antes de enviar request;
- timeout después de request antes de respuesta;
- respuesta inválida;
- doble clic/retry del usuario;
- circuit breaker abierto;
- proveedor fallback también falla.

Tests:
- T-IA-003 timeout no consume intento;
- test de idempotencia;
- test de audit event;
- E2E de UX de error y reintento;
- simulación de caída de proveedor.

Observabilidad:
- correlation_id;
- conteo timeout/error;
- ratio no-consumo;
- estado de circuit breaker.

Rollback/degradación:
- desactivar proveedor IA por flag;
- mostrar estado de servicio temporalmente no disponible;
- mantener operación sin alterar resultado.
```

---

## 8. DoR crítica — L4

Una tarea crítica solo pasa a `LISTO` si cumple DoR-L3 y además:

- [ ] Tiene dueño humano explícito y responsable de aprobación.
- [ ] Tiene aprobación externa o especializada cuando el riesgo lo exige.
- [ ] Tiene bases/políticas/contratos revisados si aplica.
- [ ] Tiene plan de comunicación a usuarios si hay impacto visible.
- [ ] Tiene runbook de incidente o rollback probado.
- [ ] Tiene entorno seguro de prueba; no se prueba directamente en producción.
- [ ] Tiene plan de soporte, auditoría y preservación de evidencia.
- [ ] Tiene criterios go/no-go explícitos.
- [ ] Tiene kill switch o mecanismo de contención probado.
- [ ] Tiene confirmación de que no existen secretos/PII en logs, fixtures, prompts o documentos.
- [ ] Tiene trazabilidad completa: requisito → decisión → arquitectura → test → métrica → runbook.

### Cambios L4 que permanecen bloqueados en H0–H8

- Activación de pagos reales.
- Créditos pagos.
- Wallets, USDT, blockchain o token propio.
- Precio dinámico real.
- Recurso crítico monetario.
- Anuncios recompensados activos.
- Expansión internacional no evaluada.
- Agentes con herramientas autónomas críticas.

> Una DoR-L4 completa no activa automáticamente una función bloqueada. También requiere el gate de fase, ADR, revisión legal/técnica y decisión explícita de Luigi.

---

## 9. Información mínima obligatoria de un issue

Todo issue debe contener esta estructura antes de solicitar ejecución:

```md
# [ID] — [Título]

> Estado de trabajo: [PLANIFICADO / AUDITADO / LISTO]
> Nivel DoR: [L1 / L2 / L3 / L4]
> Responsable: [nombre o rol]
> Hito / Epic: [H# / E-#]
> Prioridad: [Must / Should / Could / Won't ahora]
> Última actualización: [YYYY-MM-DD]

## Objetivo

[Qué resultado debe existir al cerrar el issue.]

## Problema que resuelve

[Por qué importa y quién se beneficia/protege.]

## Alcance incluido

- [Elemento incluido]
- [Elemento incluido]

## Fuera de alcance

- [Elemento excluido]
- [Elemento excluido]

## Fuentes que se deben leer

- [Documento/ruta/ID]
- [Documento/ruta/ID]

## Reglas, criterios y riesgos relacionados

- Reglas: [RB-###]
- Criterios: [CA-###]
- Riesgos: [R-###]
- Decisiones/ADR: [D-### / ADR-###]

## Dependencias

- [ID o “ninguna”]

## Criterios de aceptación

- [ ] Dado [contexto], cuando [acción], entonces [resultado verificable].
- [ ] [Otro criterio verificable].

## Casos de error y borde

- [Caso]
- [Comportamiento esperado]

## Datos y seguridad

- Datos permitidos: [lista]
- Datos sensibles: [lista o “ninguno”]
- Datos prohibidos/secretos: [lista]
- Permisos requeridos: [roles]

## Plan de implementación

1. [Paso pequeño]
2. [Paso pequeño]
3. [Paso pequeño]

## Tests y evidencia esperada

- [Test/manual/integración/E2E]
- [Resultado esperado]

## Observabilidad y auditoría

- [Evento/log/métrica/audit event o “no aplica”]

## Rollback o degradación segura

- [Cómo volver atrás o qué hacer si falla]

## Definition of Ready

- [ ] DoR aplicable completada.
- [ ] Auditoría/segunda pasada realizada.
- [ ] Luigi aprobó iniciar ejecución.

## Siguiente acción

[Acción concreta para mover a EJECUTANDO.]
```

---

## 10. Checklist universal de DoR

Esta lista se aplica a cualquier nivel; algunos campos pueden indicar “no aplica” con justificación.

### Identidad y objetivo

- [ ] Tiene ID único.
- [ ] Tiene título entendible.
- [ ] Tiene tipo: documento, regla, issue, test, decisión, riesgo, incidente o experimento.
- [ ] Tiene responsable humano.
- [ ] Tiene hito/epic o contexto asociado.
- [ ] Tiene objetivo visible y medible.
- [ ] Tiene problema o razón de negocio/técnica.

### Alcance y claridad

- [ ] Describe qué incluye.
- [ ] Describe qué excluye.
- [ ] No mezcla varios módulos independientes.
- [ ] No depende de una conversación no documentada.
- [ ] Los términos ambiguos están definidos o son preguntas pendientes.
- [ ] La tarea cabe en una sesión o pocos días; si no, está dividida.

### Fuentes y coherencia

- [ ] Identifica fuentes de verdad relevantes.
- [ ] Se revisó `agent.md`.
- [ ] Se revisó `inteligencia.md`.
- [ ] Se revisó `bitacora.md` reciente si aplica.
- [ ] Se revisó el plan maestro del proyecto/el plano de arquitectura en `03-arquitectura/` si aplica.
- [ ] Se revisaron ADRs, riesgos y tests relacionados.
- [ ] No contradice una decisión activa.
- [ ] Si existe conflicto, está registrado y resuelto o bloquea el issue.

### Dependencias y riesgos

- [ ] Dependencias técnicas/operativas identificadas.
- [ ] Bloqueadores identificados.
- [ ] Riesgos de seguridad, privacidad, costo, legalidad y UX evaluados.
- [ ] Tiene mitigación inicial para riesgos relevantes.
- [ ] Define si requiere especialista o aprobación externa.
- [ ] No intenta activar función bloqueada.

### Aceptación y pruebas

- [ ] Criterios de aceptación son comprobables.
- [ ] Se definieron tests requeridos.
- [ ] Se definieron casos de error y borde relevantes.
- [ ] Se definieron permisos/roles si aplica.
- [ ] Se definieron fixture/mock/datos de prueba si aplica.
- [ ] Se sabe qué evidencia demostrará el cierre.

### Datos, IA y operación

- [ ] Datos permitidos, sensibles, prohibidos y secretos están identificados.
- [ ] La IA tiene límites explícitos si interviene.
- [ ] La IA no recibe secretos, PII innecesaria ni autoridad de negocio.
- [ ] Logs/audit events/métricas requeridos están definidos.
- [ ] Existe fallback, rollback o degradación segura si aplica.
- [ ] Feature flags y efectos sobre operación activa están evaluados.

### Aprobación final

- [ ] Nivel DoR clasificado correctamente.
- [ ] Auditoría requerida completada.
- [ ] Luigi entiende el plan y puede explicar qué se hará.
- [ ] Luigi aprobó iniciar el trabajo.
- [ ] Siguiente acción concreta definida.

---

## 11. Preguntas de bloqueo

Si la respuesta a alguna pregunta es “no sé”, el issue no pasa a `LISTO`; debe volver a `DESCUBRIMIENTO`, quedar `BLOQUEADO` o elevarse.

### Alcance

- ¿Qué resultado exacto debe existir al final?
- ¿Qué no vamos a construir en esta tarea?
- ¿Cómo sabremos que funciona?

### Reglas

- ¿Qué regla de negocio protege esta tarea?
- ¿Puede esta tarea cambiar resultado terminal, recurso crítico, puntos, reglas o acceso?
- ¿Qué ocurre en errores, reintentos, duplicados o concurrencia?

### Datos y seguridad

- ¿Qué datos entran, salen, se guardan y se muestran?
- ¿Hay PII, secreto, consentimiento o permisos involucrados?
- ¿Qué no debe llegar a logs, prompts o vistas públicas?

### IA

- ¿Qué parte requiere realmente un modelo y qué parte debe ser código?
- ¿Qué ocurre si el modelo alucina, falla, se niega o responde mal?
- ¿Cómo se valida que el modelo no tomó autoridad indebida?

### Operación

- ¿Cómo se observa el resultado?
- ¿Cómo se vuelve atrás si falla?
- ¿Qué hace el usuario si el servicio está degradado?

---

## 12. Criterio especial para trabajo con IA

Toda tarea que use IA debe responder antes de iniciar:

- [ ] ¿Cuál es la función exacta del modelo?
- [ ] ¿Qué decisión mantiene el backend determinista?
- [ ] ¿Qué inputs recibe el modelo?
- [ ] ¿Qué inputs están prohibidos?
- [ ] ¿Qué output espera el sistema?
- [ ] ¿Cómo se valida/sanitiza el output?
- [ ] ¿Qué pasa ante timeout, error, output inválido o rate limit?
- [ ] ¿Qué corpus de regresión/red teaming se ejecutará?
- [ ] ¿Qué métrica de costo, latencia y fallo se medirá?
- [ ] ¿Cómo se desactiva o degrada la IA sin romper la operación?

Si alguna respuesta falta, la tarea IA no está lista.

---

## 13. Criterio especial para datos y privacidad

Toda tarea que toque datos de usuario debe responder:

- [ ] ¿Qué dato es estrictamente necesario?
- [ ] ¿Cuál es su finalidad?
- [ ] ¿Es público, interno, sensible o secreto?
- [ ] ¿Quién puede verlo/modificarlo?
- [ ] ¿Cómo se obtiene/guarda/revoca consentimiento?
- [ ] ¿Cuánto tiempo se retiene?
- [ ] ¿Cómo se elimina, anonimiza o exporta si aplica?
- [ ] ¿Cómo se evita que aparezca en logs, prompts o DTOs públicos?
- [ ] ¿Qué test prueba que no se filtra?

---

## 14. Criterio especial para reglas de negocio y operaciones críticas

Toda tarea que toque operación, victoria, puntuación, ranking, recurso crítico o desempate debe responder:

- [ ] ¿Qué regla exacta implementa o modifica?
- [ ] ¿La regla está publicada/explicable para el usuario?
- [ ] ¿La decisión es determinista y reproducible?
- [ ] ¿Qué pasa con concurrencia, empate, duplicado o retry?
- [ ] ¿La configuración se congela durante operación activa?
- [ ] ¿El recurso crítico está reservado y tiene sustituto?
- [ ] ¿Existe audit log de la mutación?
- [ ] ¿La IA queda fuera de la decisión oficial?
- [ ] ¿Qué test garantiza resultado consistente único?
- [ ] ¿Qué runbook se usaría si algo falla?

---

## 15. Criterio especial para cambios de monetización

Los cambios de monetización, pagos, precio dinámico, anuncios, wallets o transacción monetaria están bloqueados en el MVP. Si en una fase futura se evalúan, deberán cumplir DoR-L4 y además:

- [ ] Investigación legal específica de jurisdicción actualizada.
- [ ] Revisión profesional documentada.
- [ ] Modelo de negocio sin azar/pay-to-win confirmado.
- [ ] Vía gratuita y protección de usuario definidas.
- [ ] Bases, términos, privacidad, reembolso, disputa y soporte definidos.
- [ ] Ledger/contabilidad/auditabilidad definidos.
- [ ] Prevención de fraude, abuso y menores definida.
- [ ] Presupuesto, límites, alertas y kill switches definidos.
- [ ] Piloto/sandbox sin dinero real probado.
- [ ] Aprobación explícita para abrir una fase futura.

Hasta entonces, cualquier issue de este tipo permanece `RECHAZADO` o `PAUSADO` según la decisión vigente.

---

## 16. Auditoría de DoR

Antes de mover a `LISTO`, hacer una auditoría breve.

### Auditoría rápida L1/L2

```text
[ ] Entiendo el objetivo sin preguntar información adicional.
[ ] El alcance es pequeño y no mezcla módulos.
[ ] Sé cómo comprobar el resultado.
[ ] Sé qué archivo/artefacto se modificará.
[ ] No toca un área bloqueada o crítica.
```

### Auditoría reforzada L3/L4

```text
[ ] La tarea no contradice PM, plan, arquitectura, ADR o reglas activas.
[ ] Las reglas de negocio y riesgos tienen IDs trazables.
[ ] Hay plan de tests para flujo feliz, error, borde, permisos y regresión.
[ ] Datos, secretos, PII y permisos están clasificados.
[ ] IA, si existe, está aislada y sin autoridad crítica.
[ ] Existe fallback/rollback/degradación segura.
[ ] Logs, métricas y audit events están definidos.
[ ] Existe ADR o aprobación externa si corresponde.
[ ] Luigi puede explicar la tarea y acepta el riesgo residual.
```

### Resultado de auditoría

| Resultado | Acción |
|---|---|
| APROBADO | Mover a `LISTO` |
| APROBADO CON CONDICIONES | Completar condiciones antes de `LISTO` |
| DEVOLVER | Regresar a `PLANIFICADO` o `DESCUBRIMIENTO` |
| BLOQUEAR | Mover a `BLOQUEADO` con dueño y revisión |
| RECHAZAR | Mover a `RECHAZADO` y registrar motivo |

---

## 17. Ejemplos de aplicación

### Ejemplo A — E0-01: crear estructura documental local

| Campo | Valor |
|---|---|
| Nivel | DoR-L2 |
| Estado | LISTO cuando se complete checklist |
| Objetivo | Crear árbol local de documentos y carpetas del sistema |
| Incluye | Carpetas `00-control` a `14-entregas`, fuentes principales y archivos vacíos/plantillas necesarios |
| Excluye | Repositorio Git, código de app, APIs, secretos o proveedores |
| Riesgo | Estructura confusa o nombres inconsistentes |
| Mitigación | Validar contra roadmap y convención de nombres |
| Test | Comparar árbol creado con árbol aprobado |
| Evidencia | Lista/árbol de directorios y bitácora |

### Ejemplo B — E1-07: resultado consistente único

| Campo | Valor |
|---|---|
| Nivel | DoR-L3 |
| Objetivo | Garantizar un solo resultado terminal oficial por operación bajo concurrencia |
| Reglas | RB-004, RB-009 |
| Riesgos | R-005, R-006 |
| Incluye | Transacción/lock/criterio de servidor, audit event y test concurrente |
| Excluye | UI de celebración, entrega real de recurso crítico, IA como juez |
| Pruebas | Unit, integración, concurrencia y simulacro |
| Observabilidad | Métrica resultado terminales por operación, alerta si >1 |
| Runbook | `runbook-doble-resultado terminal.md` |
| Aprobación | Luigi + segunda revisión de arquitectura |

### Ejemplo C — Cambio de copy en onboarding

| Campo | Valor |
|---|---|
| Nivel | DoR-L1 o L2 según impacto legal | 
| Objetivo | Explicar habilidad/no azar con lenguaje claro |
| Riesgo | Usar lenguaje que parezca apuesta o promesa de ganancia |
| Fuente | glosario legal, copy UX |
| Test | Revisión de términos prohibidos y prueba de comprensión |
| Condición | Si cambia bases, elegibilidad o compromiso contractual o financiero, escalar a L3 |

### Ejemplo D — Activar pagos

| Campo | Valor |
|---|---|
| Nivel | DoR-L4 |
| Estado actual | RECHAZADO / BLOQUEADO para MVP |
| Razón | Requiere nueva fase, gates legales, técnicos y operativos |
| Acción actual | No implementar; registrar solo como hipótesis futura |

---

## 18. Antipatrones

### “La IA sabe qué hacer”

No es DoR. La IA necesita objetivo, restricciones, fuentes, tests y criterios. Si la tarea depende de que el modelo adivine, no está lista.

### “Hazlo como la otra aplicación”

No es DoR hasta que se documente qué comportamiento se quiere copiar y qué diferencias existen.

### “Solo es un cambio pequeño”

Un cambio pequeño en permisos, prompt, DB, recurso crítico, estado o privacidad puede tener impacto alto. Clasificar por riesgo, no por número de líneas de código.

### “Después escribimos tests”

No es DoR si el criterio de prueba no está definido. En áreas críticas, el test se diseña antes o junto con la implementación.

### “Ya está documentado en el chat”

Una conversación no es fuente de verdad. El contexto relevante debe estar en documento/issue/bitácora.

### “Lo probamos directo en producción”

No es aceptable para cambios de alto riesgo. Requiere staging, simulacro o procedimiento de excepción documentado.

---

## 19. Gate de cierre del documento

Este documento se considera activo cuando:

- [x] Define cuándo un elemento pasa a `LISTO`.
- [x] Tiene cuatro niveles según riesgo.
- [x] Exige objetivo, alcance, criterios, fuentes, riesgos, dependencias y evidencia.
- [x] Define requisitos reforzados para IA, datos, reglas, recurso crítico y monetización.
- [x] Incluye estructura reusable de issue.
- [x] Incluye auditoría y preguntas de bloqueo.
- [x] Incluye ejemplos prácticos.
- [x] Confirma que Luigi aprueba el inicio de ejecución.

### Próximo documento

`definition-of-done.md` — condiciones obligatorias para aceptar y cerrar una tarea, módulo, documento o hito sin dejar evidencia ni dependencias ocultas.

---

## 20. Historial de cambios

| Versión | Fecha | Cambio | Responsable |
|---|---|---|---|
| 0.1.0 | 2026-09-10 | Creación de la Definition of Ready por niveles de riesgo | Luigi |
