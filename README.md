# Vibe System — Sistema Operativo Metodológico y Documental para Vibe Coders

> **Estado:** ACTIVO / BASE DEL SISTEMA  
> **Propósito:** Definir los parámetros, reglas, flujo de ejecución y ciclo de actualización para construir cualquier producto digital asistido por IA con control total.  
> **Autor y Responsable:** Luigi  
> **Versión:** 1.1.0  
> **Última actualización:** 2026-09-11  

---

## 0. ¿Qué es Vibe System?

**Vibe System** es un sistema operativo metodológico y documental diseñado para **vibe coders, desarrolladores asistidos por IA, freelancers y equipos pequeños**.

Permite concebir, planificar, construir, probar y entregar aplicaciones complejas con IA **sin perder el contexto, sin acumular deuda técnica invisible, sin depender de prompts improvisados y sin que el modelo tome decisiones destructivas.**

> **Principio rector:** La IA propone e implementa; el sistema documental guía y restringe; los tests deterministas y el humano validan.

---

## 1. El Flujo de Ejecución de Vibe System

Cualquier proyecto construido bajo Vibe System sigue un ciclo de vida predecible en 5 etapas:

```text
[ 1. Ideación & Alcance ]
         ↓
[ 2. Fundación Documental (Kit Vibe) ]
         ↓
[ 3. Tareas con DoR (Definition of Ready) ]
         ↓
[ 4. Ejecución asistida por IA & Tests ]
         ↓
[ 5. Cierre con DoD & Actualización de Memoria ]
```

### Etapa 1: Delimitación del Alcance (Anti-Scope Creep)
- Se define el problema en una frase, el usuario objetivo y el MVP mínimo viable.
- Se redacta la **lista explícita de exclusiones** (lo que NO se construirá en esta fase).
- Se establecen las restricciones de costo, privacidad y dependencias.

### Etapa 2: Fundación Documental (El Paquete Inicial)
- Se copia la estructura de carpetas estándar (`00` a `14` y `fuentes-principales/`).
- Se configuran los 3 pilares de memoria viva:
  - [`fuentes-principales/agent.md`](fuentes-principales/agent.md): Las instrucciones operativas que la IA debe obedecer.
  - [`fuentes-principales/inteligencia.md`](fuentes-principales/inteligencia.md): La memoria curada (decisiones vigentes, hechos, bloqueos).
  - [`fuentes-principales/bitacora.md`](fuentes-principales/bitacora.md): El historial cronológico de sesiones.

### Etapa 3: Preparación de Tareas bajo DoR
- Ninguna tarea se inicia sin cumplir la [`00-control/definition-of-ready.md`](00-control/definition-of-ready.md).
- Cada tarea debe tener un ID único, archivo afectado, criterios de aceptación (`CA-###`) y prueba esperada.

### Etapa 4: Construcción y Verificación Determinista
- La IA trabaja en una sola intención a la vez.
- El código se valida con pruebas automáticas o verificaciones reproducibles en servidor, nunca confiando ciegamente en "lo que dice la IA".
- Se prohíbe el uso de credenciales o secretos reales en prompts o repositorios.

### Etapa 5: Cierre, Auditoría y Actualización de Memoria
- Se comprueba la [`00-control/definition-of-done.md`](00-control/definition-of-done.md).
- Se corre el checklist [`00-control/pre-commit-gate-checklist.md`](00-control/pre-commit-gate-checklist.md).
- Se actualizan `bitacora.md` e `inteligencia.md` para que la siguiente sesión conserve el 100% del contexto.

---

## 2. Parámetros y Reglas de Oro del Sistema

1. **Determinismo sobre generación:** La IA genera texto, código y bocetos; la lógica de negocio, validaciones de seguridad, estados y finanzas viven en código determinista fuera del modelo.
2. **Desacoplamiento de la memoria:** El contexto del proyecto no reside en la ventana de chat del modelo (que se reinicia o satura); reside en archivos Markdown persistentes versionados.
3. **Límite de tamaño documental (escalonado, ADR-004):** Los documentos normativos (leídos completos por la IA) no superan las 600 líneas; los registros append-only (bitácora, changelogs) crecen sin techo y rotan entradas antiguas a anexos; las referencias se dividen por dominios.
4. **Una fuente por concepto:** Cero documentos duplicados con el mismo propósito. Cada archivo tiene un dueño y una responsabilidad única.
5. **IDs permanentes e inmutables:** Los identificadores de decisiones (`D-###`, `ADR-###`), riesgos (`R-###`), criterios (`CA-###`) y tareas no se reciclan.
6. **Invariantes no negociables:** Todo proyecto tiene reglas inviolables (ej. "cero secretos en código", "respaldo antes de migrar", "pruebas antes de deploy").

---

## 3. Estructura Canónica de Carpetas

Vibe System estandariza el espacio de trabajo en 16 carpetas predecibles:

```text
sistema de proyectos/ (Vibe System Core)
├── README.md                            <- Este documento (mapa del sistema)
├── 00-control/                          <- Reglas, convenciones, DoR, DoD, estados
├── 01-requisitos/                       <- Visión, especificaciones, ciclo de vida
├── 02-decisiones/                       <- Architecture Decision Records (ADRs)
├── 03-arquitectura/                     <- Planos de componentes y flujo de datos
├── 04-ia/                               <- Prompts de sistema, adaptadores y corpus
├── 05-ux/                               <- Flujos, interacción y diseño de pantallas
├── 06-calidad/                          <- Políticas de pruebas y gates de calidad
├── 07-operacion/                        <- Despliegue, CI/CD, monitoreo y arranque
├── 08-legal-y-confianza/                <- Privacidad, términos y cumplimiento
├── 09-riesgos/                          <- Registro de riesgos y mitigaciones
├── 10-tests/                            <- Estrategia y suites de pruebas
├── 11-auditorias/                       <- Auditorías de hitos y gates formales
├── 12-runbooks/                         <- Procedimientos ante fallos e incidentes
├── 13-investigacion/
│   └── borradores/                      <- Notas exploratorias y antecedentes
├── 14-entregas/                         <- Changelog, releases y actas
└── fuentes-principales/                 <- Memoria viva: agent, inteligencia, bitácora
```

---

## 4. ¿Cómo se actualiza y mejora Vibe System?

Vibe System es un sistema vivo que evoluciona con cada proyecto completado:

1. **Registro de errores y lecciones:** Cuando un proyecto sufre un error o fricción con la IA, se registra un aprendizaje (`L-###`) en `fuentes-principales/inteligencia.md`.
2. **Promoción de patrones:** Si una regla o checklist evita un fallo recurrente, se promueve a `00-control/convenciones.md` o a las plantillas correspondientes.
3. **Depuración de plantillas:** Las plantillas en `00-control/`, `02-decisiones/`, `10-tests/`, etc., se actualizan para que los futuros proyectos arranquen con mayor madurez.
4. **Separación estricta:** La documentación de Vibe System define **cómo construir**. Los proyectos creados con Vibe System (ej. juegos, SaaS, e-commerce) viven en sus propios repositorios independientes y solo heredan este paquete inicial.

---

## 5. Índice de Documentos Clave de Vibe System

| Documento | Ubicación | Qué define |
|---|---|---|
| **Roadmap del Framework** | [`00-control/roadmap-vibe-system.md`](00-control/roadmap-vibe-system.md) | Hitos estratégicos y evolución de Vibe System |
| **Visión y Alcance** | [`01-requisitos/vision-y-alcance-vibe-system.md`](01-requisitos/vision-y-alcance-vibe-system.md) | Propósito, problemas resueltos y límites no negociables |
| **Flujo de Ejecución** | [`01-requisitos/flujo-de-ejecucion.md`](01-requisitos/flujo-de-ejecucion.md) | Ciclo de 5 fases y protocolo de sesión diaria de trabajo |
| **Parámetros del Sistema** | [`01-requisitos/parametros-del-sistema.md`](01-requisitos/parametros-del-sistema.md) | Catálogo normativo de constantes, límites (600 líneas) e IDs |
| **Mecanismo de Actualización** | [`01-requisitos/mecanismo-de-actualizacion.md`](01-requisitos/mecanismo-de-actualizacion.md) | Versionado SemVer, sincronización de plantillas y RFCs |
| **Ciclo de Vida de Proyecto** | [`01-requisitos/ciclo-de-vida-de-proyecto.md`](01-requisitos/ciclo-de-vida-de-proyecto.md) | Etapas de maduración de un proyecto y gates de transición |
| **Paquete Inicial (Starter Kit)** | [`01-requisitos/paquete-inicial-de-proyecto.md`](01-requisitos/paquete-inicial-de-proyecto.md) | Estructura base para inicializar proyectos en 10 minutos |
| **Arquitectura Documental** | [`03-arquitectura/arquitectura-documental-vibe-system.md`](03-arquitectura/arquitectura-documental-vibe-system.md) | Topología de capas y flujo de información entre documentos |
| **Diagramas de Flujo** | [`03-arquitectura/diagramas-de-flujo.md`](03-arquitectura/diagramas-de-flujo.md) | Atlas visual de macroflujo, microflujo y estados del sistema |
| **Convenciones del Sistema** | [`00-control/convenciones.md`](00-control/convenciones.md) | Reglas de nombres, IDs, rutas, Git y formato |
| **Estados del Trabajo** | [`00-control/estados-del-trabajo.md`](00-control/estados-del-trabajo.md) | Ciclo de estados normativos (`IDEA` a `COMPLETADO`) |
| **Definition of Ready** | [`00-control/definition-of-ready.md`](00-control/definition-of-ready.md) | Criterios obligatorios para iniciar una tarea |
| **Definition of Done** | [`00-control/definition-of-done.md`](00-control/definition-of-done.md) | Criterios obligatorios para dar por cerrada una tarea |
| **Pre-Commit Gate Checklist** | [`00-control/pre-commit-gate-checklist.md`](00-control/pre-commit-gate-checklist.md) | Filtro de calidad antes de guardar cambios |
| **Glosario Operativo** | [`00-control/glosario.md`](00-control/glosario.md) | Diccionario de términos universales y definiciones compartidas |
| **ADR-001 Docs en Markdown** | [`02-decisiones/ADR-001-arquitectura-documental-markdown.md`](02-decisiones/ADR-001-arquitectura-documental-markdown.md) | Justificación de Markdown en Git frente a herramientas SaaS |
| **ADR-002 Memoria y Autoridad** | [`02-decisiones/ADR-002-triada-de-memoria-y-autoridad-humana.md`](02-decisiones/ADR-002-triada-de-memoria-y-autoridad-humana.md) | Justificación de la tríada de memoria viva y control humano |
| **ADR-003 Techo de 600 Líneas** | [`02-decisiones/ADR-003-techo-600-lineas-anti-lost-in-middle.md`](02-decisiones/ADR-003-techo-600-lineas-anti-lost-in-middle.md) | Justificación cuantitativa para mitigar pérdida de atención en LLMs |
| **ADR-004 Límites Escalonados** | [`02-decisiones/ADR-004-limites-escalonados-de-archivo.md`](02-decisiones/ADR-004-limites-escalonados-de-archivo.md) | Evolución de PAR-01: normativos, registros append-only y referencias |
| **ADR-005 Topología `05-ux/`** | [`02-decisiones/ADR-005-topologia-carpeta-05-ux.md`](02-decisiones/ADR-005-topologia-carpeta-05-ux.md) | Carpeta canónica del prefijo 05 y conteo oficial de 16 carpetas |
| **System Prompt Maestro** | [`04-ia/system-prompt-vibe-coder.md`](04-ia/system-prompt-vibe-coder.md) | Prompt de sistema reutilizable para Cursor, Claude, Antigravity |
| **Protocolo Anti-Alucinaciones** | [`04-ia/protocolo-anti-alucinaciones.md`](04-ia/protocolo-anti-alucinaciones.md) | Disciplina de verificación determinista para agentes de IA |
| **Guía de Arranque Rápido** | [`07-operacion/guia-de-arranque-de-nuevo-proyecto.md`](07-operacion/guia-de-arranque-de-nuevo-proyecto.md) | Procedimiento paso a paso para nuevo proyecto en 5 min |
| **Suite de Verificación (Gates)** | [`07-operacion/verify-gates.sh`](07-operacion/verify-gates.sh) | 12 gates deterministas (EXIT=0 = íntegro); obligatorio pre-push y en CI |
| **Workflow CI de Gates** | [`.github/workflows/verify-gates.yml`](.github/workflows/verify-gates.yml) | GitHub Actions: ejecuta la suite en cada push a `main` y en PRs |
| **Plantilla de Gates (Derivados)** | [`07-operacion/template-verify-gates.sh`](07-operacion/template-verify-gates.sh) | Suite heredable parametrizable (10 gates) para proyectos derivados |
| **Inicializador de Proyectos** | [`07-operacion/init-vibe-project.sh`](07-operacion/init-vibe-project.sh) | Arranque de un proyecto derivado con un solo comando: árbol, tríada, gates, CI y commit |
| **Auditoría de Código Heredado** | [`11-auditorias/template-auditoria-codigo-heredado.md`](11-auditorias/template-auditoria-codigo-heredado.md) | Vía B paso 1: auditoría E2E de línea de base para proyectos no creados por el sistema |
| **Plan de Adecuación** | [`01-requisitos/template-plan-adecuacion.md`](01-requisitos/template-plan-adecuacion.md) | Vía B paso 2: fases para gobernar un proyecto heredado sin romperlo |
| **Registro de Riesgos** | [`09-riesgos/registro-riesgos-vibe-system.md`](09-riesgos/registro-riesgos-vibe-system.md) | Matriz de riesgos metodológicos y mitigaciones |
| **Auditoría Cierre H0** | [`11-auditorias/auditoria-H0-fundacion-vibe-system.md`](11-auditorias/auditoria-H0-fundacion-vibe-system.md) | Certificación formal de la base documental v1.0.0 |
| **Auditoría de Coherencia** | [`11-auditorias/AUD-VS-001-auditoria-de-coherencia-v1.md`](11-auditorias/AUD-VS-001-auditoria-de-coherencia-v1.md) | Auditoría crítica de v1.0.0; base del plan de fixeo |
| **Re-Certificación v1.1.0** | [`11-auditorias/AUD-VS-002-recertificacion-v1-1-0.md`](11-auditorias/AUD-VS-002-recertificacion-v1-1-0.md) | Verificación reproducible del cierre de hallazgos y dictamen APROBADA |
| **Plan de Pruebas Core** | [`10-tests/plan-pruebas-vibe-system-core.md`](10-tests/plan-pruebas-vibe-system-core.md) | Casos, evidencia y bucle de mejora de los gates (14/14 PASA) |
| **Tests de las Dos Vías** | [`10-tests/test-vias-incorporacion.sh`](10-tests/test-vias-incorporacion.sh) | 20 tests E2E deterministas: Vía A (desde cero) y Vía B (heredados), idempotente |
| **Plantilla Plan de Pruebas (Derivados)** | [`10-tests/template-plan-pruebas.md`](10-tests/template-plan-pruebas.md) | Plan heredable del proyecto derivado: 10 gates + 2 pruebas negativas |
| **Release Notes v1.0.0** | [`14-entregas/RELEASE-NOTES-v1.0.0.md`](14-entregas/RELEASE-NOTES-v1.0.0.md) | Acta de lanzamiento oficial de Vibe System |
| **Reglas de Trabajo para IA** | [`fuentes-principales/agent.md`](fuentes-principales/agent.md) | Protocolo y límites de autoridad para asistentes de IA |
| **Memoria del Sistema** | [`fuentes-principales/inteligencia.md`](fuentes-principales/inteligencia.md) | Contexto curado, decisiones y hechos verificados |
| **Bitácora de Sesiones** | [`fuentes-principales/bitacora.md`](fuentes-principales/bitacora.md) | Diario cronológico de sesiones de trabajo |
