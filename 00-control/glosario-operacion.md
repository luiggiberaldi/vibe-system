# Glosario Vibe System — Módulo 3: Operación, Privacidad y Proceso

> **Fuente de verdad:** Sí, para los términos de este módulo. Índice central: `glosario.md`.
> **Versión:** 1.0.0 · **Creado:** 2026-09-11 · **Responsable:** Luigi · **Clasificación:** INTERNA
> **Nota de origen:** secciones 67 a 103 del glosario monolítico v1.0.0 (T-DOC-010/011).

# Parte E — Privacidad, operación y calidad

## 67. Sanitización

**Definición:** proceso de eliminar, transformar o limitar datos/contenido para que una salida, log, DTO, transcript o pantalla contenga solo información permitida.

**No significa:** cifrado, aunque ambos pueden ser necesarios; tampoco significa borrar evidencia necesaria de forma irrecuperable.

**Relacionado con:** PII, DTO público.

**Estado:** requisito vigente.

---

## 68. Minimización de datos

**Definición:** práctica de recopilar, procesar, mostrar y retener únicamente los datos necesarios para una finalidad definida.

**No significa:** no registrar nada; auditabilidad, seguridad y reclamo pueden requerir algunos datos justificados.

**Relacionado con:** privacidad.

**Estado:** vigente.

---

## 69. Retención

**Definición:** período y condiciones bajo los cuales un dato se conserva antes de eliminarse, anonimizarse o archivarse conforme a finalidad, cumplimiento y seguridad.

**No significa:** guardar datos indefinidamente “por si acaso”.

**Relacionado con:** .

**Estado:** política específica pendiente.

---

## 70. Feature flag

**Definición:** control de configuración que permite activar, desactivar o limitar una función por ambiente, cohorte o condición autorizada.

**No significa:** mecanismo para cambiar silenciosamente reglas de una operación activa, ignorar gates o introducir monetización sin aprobación.

**Ejemplo:** desactivar temporalmente un proveedor de IA o limitar el acceso a una cohorte alpha sin alterar la configuración congelada.

**Relacionado con:** .

**Estado:** diseñado; implementación pendiente.

---

## 71. Kill switch

**Definición:** control autorizado para detener de forma segura una función, operación, integración, cohorte o ruta de riesgo ante incidente o degradación.

**No significa:** borrar datos, ocultar evidencia o apagar sin comunicación/registro.

**Relacionado con:** `RB-010`.

**Estado:** requisito vigente.

---

## 72. Staging

**Definición:** ambiente de prueba similar a producción donde se validan integración, configuración, UX, observabilidad y rollback antes de abrir una funcionalidad a usuarios reales.

**No significa:** producción ni entorno para datos reales sin controles.

**Relacionado con:** roadmap H3–H6.

**Estado:** diseñado; pendiente de implementación.

---

## 73. Producción beta

**Definición:** ambiente controlado disponible para una cohorte limitada de usuarios reales, con observabilidad, soporte, gates, backups, flags y capacidad de pausa.

**No significa:** lanzamiento público masivo, estabilidad garantizada ni activación automática de monetización.

**Relacionado con:** H6/H7.

**Estado:** futuro; bloqueado hasta readiness.

---

## 74. Alpha privada

**Definición:** prueba limitada con un grupo pequeño y seleccionado para detectar fallos de comprensión, UX, seguridad, IA y operación antes de beta privada.

**No significa:** lanzamiento comercial ni sustituto de gates técnicos.

**Relacionado con:** H7.

**Estado:** futuro; bloqueado hasta H6.

---

## 75. Beta privada

**Definición:** prueba con una cohorte más amplia pero limitada, invitada de forma controlada, para validar comportamiento real, capacidad, soporte y métricas sin pagos activos.

**No significa:** disponibilidad pública irrestricta ni monetización.

**Relacionado con:** H7.

**Estado:** futuro; bloqueado hasta alpha/go-no-go.

---

## 76. Cohorte

**Definición:** grupo definido de testers/usuarios que recibe acceso bajo límites, objetivo, soporte, métricas y condiciones de participación específicos.

**No significa:** cualquier visitante que encuentra un enlace.

**Relacionado con:**  futuro.

**Estado:** vigente como concepto.

---

## 77. Go / no-go

**Definición:** decisión explícita, basada en gates, evidencia, riesgos y capacidad, de avanzar o no a un hito, release, cohorte o función.

**No significa:** decisión por presión de fecha, emoción, marketing o “ya llevamos mucho tiempo”.

**Relacionado con:** .

**Estado:** vigente.

---

## 78. Pausa

**Definición:** detención controlada y comunicada de una transacción o ciclo, función, cohorte o tarea, preservando estados, evidencia y derechos de usuarios según reglas.

**No significa:** abandono silencioso, eliminación de trazas o cambio informal de reglas.

**Relacionado con:** `RB-010`, estados del trabajo, runbooks.

**Estado:** vigente.

---

## 79. Rollback

**Definición:** procedimiento para volver a una versión o configuración previamente segura tras un fallo de despliegue, migración o cambio.

**No significa:** borrar evidencia de un incidente ni revertir reglas de una operación activa sin procedimiento.

**Relacionado con:** .

**Estado:** requisito diseñado.

---

## 80. Backup / restauración

**Definición:** copia controlada de datos/configuración crítica y proceso para recuperar un estado verificable en ambiente seguro o tras incidente.

**No significa:** una copia nunca probada; un backup no es confiable hasta ensayar restore.

**Relacionado con:** .

**Estado:** requisito diseñado.

---

## 81. Runbook

**Definición:** procedimiento operativo paso a paso para responder a un escenario definido: incidente, despliegue, pausa, restauración, soporte o resultado o activo crítico.

**No significa:** una lista vaga de recomendaciones ni un documento sin responsables, señales de activación o validación de recuperación.

**Relacionado con:** DoD.

**Estado:** plantillas pendientes.

---

## 82. Observabilidad

**Definición:** capacidad de entender el estado y comportamiento del sistema mediante logs estructurados, métricas, trazas, eventos, dashboards y alertas sin exponer información sensible.

**No significa:** registrar todo indiscriminadamente ni usar analítica invasiva.

**Relacionado con:** .

**Estado:** diseñado; implementación pendiente.

---

## 83. Métrica / SLI / SLO

**Métrica:** medida cuantitativa de producto, sistema, IA, riesgo u operación.

**SLI:** indicador específico que mide un aspecto de servicio o integridad, por ejemplo, intentos válidos procesados.

**SLO:** objetivo esperado para un SLI, por ejemplo, 100% de no-consumo ante fallos IA.

**No significa:** promesa comercial absoluta de disponibilidad.

**Relacionado con:** H6.

**Estado:** diseñado; valores finales pendientes.

---

## 84. Alerta

**Definición:** señal automática o manual que indica que una métrica, invariante o evento requiere atención según umbral y severidad definidos.

**No significa:** notificación sin responsable, prioridad o acción.

**Ejemplo:** alerta crítica si una transacción o ciclo tiene más de un ganador o si PII aparece en salida pública.

**Relacionado con:** .

**Estado:** diseñado; implementación pendiente.

---

## 85. SLO de integridad

**Definición:** objetivo no negociable vinculado a reglas que no pueden degradarse sin incidente: ganador único, resultado o activo crítico reservado, PII pública igual a cero o configuración activa inmutable.

**No significa:** métrica opcional de rendimiento que puede ignorarse por conveniencia.

**Relacionado con:** H6.

**Estado:** vigente como principio.

---

# Parte F — Documentación, planificación y proceso

## 86. Fuente de verdad

**Definición:** documento, artefacto o sistema reconocido como autoridad principal para un tipo de información.

**No significa:** el único documento que menciona un tema ni una conversación aislada.

**Ejemplo:** `planmaestro.md` controla alcance y fases; `arquitectura.md` controla diseño técnico; código/tests controlan comportamiento implementado.

**Relacionado con:** convenciones, inteligencia.

**Estado:** vigente.

---

## 87. Memoria curada

**Definición:** conjunto breve, clasificado y enlazado de hechos, decisiones, riesgos, aprendizajes y pendientes relevantes para continuidad del proyecto.

**No significa:** copia completa de conversaciones, logs, secretos, historial técnico total o base de datos.

**Relacionado con:** `inteligencia.md`.

**Estado:** vigente.

---

## 88. Bitácora

**Definición:** registro cronológico breve de sesiones, decisiones, avances, bloqueos, resultados y siguiente acción.

**No significa:** documento de arquitectura, repositorio de requisitos o memoria curada completa.

**Relacionado con:** `bitacora.md`.

**Estado:** vigente.

---

## 89. Plan maestro

**Definición:** documento rector que consolida visión, alcance, fases, gates, decisiones de producto y estado general del proyecto.

**No significa:** lista detallada de cada línea de código o sustituto del roadmap ejecutable.

**Relacionado con:** `planmaestro.md` a .

**Estado:** por consolidar en H0.

---

## 90. Roadmap

**Definición:** secuencia de hitos, epics, issues, dependencias, gates y criterios de salida que convierte el plan maestro en ejecución ordenada.

**No significa:** compromiso rígido de fechas ni garantía de que una función se construirá sin gates.

**Relacionado con:** `roadmap.md`.

**Estado:** vigente.

---

## 91. Hito

**Definición:** resultado demostrable de alto nivel que agrupa un conjunto de epics/issues y tiene un gate de salida propio.

**No significa:** una fecha del calendario ni una lista de tareas sin resultado verificable.

**Ejemplo:** H1 — Núcleo determinista del juego.

**Relacionado con:** roadmap.

**Estado:** vigente.

---

## 92. Epic

**Definición:** área coherente de trabajo dentro de un hito que agrupa issues relacionados hacia un resultado.

**No significa:** una tarea individual ni un proyecto entero sin límites.

**Ejemplo:** E-4 — Integración segura de IA.

**Relacionado con:** roadmap.

**Estado:** vigente.

---

## 93. Issue

**Definición:** unidad de trabajo pequeña, limitada, trazable y verificable con objetivo, DoR, criterios de aceptación, riesgos, tests y DoD.

**No significa:** una idea vaga, conversación o una petición de “hacer todo”.

**Relacionado con:** DoR, DoD, estados.

**Estado:** vigente.

---

## 94. ADR

**Definición:** Architecture Decision Record; documento que registra contexto, alternativas, decisión, consecuencias y estado de una decisión estructural.

**No significa:** una nota informal ni un documento que se edita para borrar decisiones históricas.

**Relacionado con:** `02-decisiones/`, arquitectura, convenciones.

**Estado:** vigente.

---

## 95. Criterio de aceptación

**Definición:** condición concreta, observable y comprobable que indica si una entrega satisface lo acordado.

**No significa:** “que se vea bien”, “que sea seguro” o “que funcione” sin definición.

**Ejemplo:** “Dado un timeout del proveedor IA, cuando el intento estaba procesándose, entonces el sistema lo marca como recuperable y no reduce la cuota del usuario.”

**Relacionado con:** `CA-`, DoR, DoD.

**Estado:** vigente.

---

## 96. Definition of Ready (DoR)

**Definición:** conjunto de condiciones necesarias para iniciar una tarea sin ambigüedad, dependencia oculta o riesgo no evaluado.

**No significa:** garantía de que no aparecerán problemas; significa que se puede iniciar de forma responsable.

**Relacionado con:** `definition-of-ready.md`.

**Estado:** vigente.

---

## 97. Definition of Done (DoD)

**Definición:** conjunto de condiciones necesarias para cerrar una entrega con evidencia, documentación, trazabilidad y siguiente paso claros.

**No significa:** que nunca se vuelva a cambiar el elemento.

**Relacionado con:** `definition-of-done.md`.

**Estado:** vigente.

---

## 98. Gate

**Definición:** condición o conjunto de verificaciones que bloquea o permite avanzar a un estado, hito, despliegue o cohorte.

**No significa:** una recomendación opcional que se ignora por urgencia.

**Ejemplo:** no abrir alpha sin backups, runbooks, resultado o activo crítico reservado, alertas y simulacros requeridos.

**Relacionado con:** roadmap.

**Estado:** vigente.

---

## 99. Auditoría

**Definición:** revisión estructurada de coherencia, evidencia, riesgos, cumplimiento de criterios y hallazgos antes de aprobar, cerrar o avanzar.

**No significa:** garantía absoluta de ausencia de fallos ni sustituto de pruebas.

**Relacionado con:** `11-auditorias/`, DoR, DoD.

**Estado:** vigente.

---

## 100. Matriz de trazabilidad

**Definición:** documento que conecta requisitos, decisiones, arquitectura, implementación, tests, métricas, alertas y runbooks.

**No significa:** tabla decorativa; debe actualizarse cuando cambia un elemento crítico.

**Ejemplo:** `RB-006 → D-009 → estado FALLIDO_RECUPERABLE → T-IA-003 → M-IA-002 → RUN-IA-001`.

**Relacionado con:** `00-control/matriz-trazabilidad.md`.

**Estado:** pendiente de creación.

---

## 101. Cambio de alcance

**Definición:** modificación aprobada de lo incluido, excluido, prometido o priorizado en el proyecto.

**No significa:** ajuste informal hecho durante implementación porque “parece fácil”.

**Relacionado con:** `CHG-`, convenciones, roadmap.

**Estado:** vigente.

---

## 102. Deuda técnica

**Definición:** costo futuro conocido creado al elegir una solución temporal, incompleta o menos mantenible, registrado con impacto, dueño y condición de resolución.

**No significa:** bug escondido, requisito omitido o falta de voluntad de terminar una tarea.

**Relacionado con:** `DT-`, riesgos, DoD.

**Estado:** vigente.

---

## 103. Dependencia externa

**Definición:** condición, proveedor, acceso, respuesta, aprobación o servicio fuera del control directo del proyecto que puede bloquear o afectar una entrega.

**No significa:** excusa general para no avanzar; debe tener dueño, impacto y plan alternativo.

**Relacionado con:** `DEP-`, riesgos, roadmap.

**Estado:** vigente.

---

# Parte G — Términos bloqueados o deprecados

## 104. Pago real

**Definición:** transferencia de valor económico real por parte de un usuario o hacia un usuario mediante tarjeta, banco, wallet, cripto, pasarela, saldo comprado u otro mecanismo.

**Estado actual:** bloqueado fuera del MVP y H0–H8 hasta nueva fase, gates y revisión profesional.

---

## 105. Anuncio recompensado activo

**Definición:** publicidad que un usuario puede ver a cambio de una recompensa o beneficio dentro del producto.

**Estado actual:** bloqueado; solo diseño conceptual futuro.

---

## 106. Wallet / USDT / blockchain

**Definición:** mecanismos financieros o de custodia/transferencia basados en activos digitales, claves, redes o contratos inteligentes.

**Estado actual:** bloqueados en MVP y beta inicial.

---

## 107. Precio dinámico real

**Definición:** mecanismo que cambia precio/costo real para usuarios según variables de demanda, pote, tiempo, comportamiento u otras señales.

**Estado actual:** bloqueado; puede existir únicamente como simulación/documentación futura sin cobro.

---

## 108. Agente autónomo con herramientas críticas

**Definición:** IA capaz de usar sin supervisión herramientas que cambian el mundo o sistemas: shell, browser, filesystem, DB, pagos, infraestructura, credenciales o acciones externas.

**Estado actual:** prohibido en MVP y beta inicial.

---

## 109. “Imposible de romper”

**Definición:** expresión prohibida para describir seguridad, prompts, filtros, modelos o arquitectura.

**Reemplazo:** “evaluado contra el corpus X”, “mitigado contra el escenario Y”, “requiere defensa en profundidad”, “riesgo residual Z”.

**Estado:** deprecado/prohibido en documentación operativa.

---

## 110. “Listo” sin estado/evidencia

**Definición:** expresión insuficiente y prohibida como cierre autónomo.

**Reemplazo:** indicar estado de trabajo, estado de evidencia, resultado de pruebas, responsable y siguiente paso.

**Estado:** deprecado/prohibido como única descripción.

---

## 111. “Legal” sin revisión profesional

**Definición:** afirmación que no puede usarse como conclusión final sin asesoría aplicable a jurisdicción, modelo de negocio y momento de lanzamiento.

**Reemplazo:** “diseñado para reducir riesgo”, “requiere revisión legal”, “pendiente de validación profesional”.

**Estado:** deprecado/prohibido como conclusión no sustentada.

---

## 112. Mantenimiento del glosario

### Agregar término nuevo

Antes de agregar un término, verificar:

- [ ] No existe ya un término equivalente.
- [ ] El término es necesario para tomar decisiones o evitar ambigüedad.
- [ ] Tiene definición clara y no circular.
- [ ] Indica qué no significa si hay riesgo de confusión.
- [ ] Incluye ejemplo o contexto.
- [ ] Tiene fuente/documento relacionado.
- [ ] Tiene estado: vigente, pendiente o deprecado.

### Modificar término existente

- [ ] Registrar motivo de cambio.
- [ ] Evaluar impacto en requisitos, arquitectura, UX, legalidad, tests y copy.
- [ ] Crear ADR si modifica una regla estructural.
- [ ] Marcar definición anterior como deprecada si cambia el significado.
- [ ] Actualizar documentos relacionados.
- [ ] Registrar cambio en bitácora e inteligencia si es durable.

---

## 113. Gate de cierre del documento

Este documento se considera activo cuando:

- [x] Define términos de producto, operación, resultado o activo crítico y equidad.
- [x] Define estados, arquitectura, datos, secretos, auditoría e idempotencia.
- [x] Define IA, guardrails, filtros, red teaming, fallback y evaluación.
- [x] Define privacidad, operación, beta, métricas, alertas y runbooks.
- [x] Define documentación, roadmap, DoR, DoD, gate y trazabilidad.
- [x] Identifica términos bloqueados, deprecados o que requieren precisión.
- [x] Define proceso para mantener el glosario.

### Próximo documento

`matriz-trazabilidad.md` — conectar requisitos críticos, decisiones, arquitectura, implementación futura, pruebas, métricas, alertas y runbooks.

---

## 114. Historial de cambios

| Versión | Fecha | Cambio | Responsable |
|---|---|---|---|
| 0.1.0 | 2026-09-10 | Creación del glosario operativo inicial | Luigi |
