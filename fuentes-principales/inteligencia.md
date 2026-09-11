# Inteligencia del Proyecto — Vibe System Core

> **Estado:** ACTIVO — fundación metodológica y operacional  
> **Tipo:** memoria curada e índice operativo de Vibe System  
> **Fuente de verdad:** No; resume y enlaza a las fuentes de autoridad  
> **Responsable:** Luigi  
> **Clasificación:** INTERNA  
> **Versión:** 1.1.0  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  
> **Próxima revisión:** al iniciar H1  

---

## 0. Para qué sirve

Este archivo es la memoria corta y ordenada de **Vibe System**. Sirve para que Luigi o cualquier agente de IA comprendan de inmediato cómo está estructurado el marco metodológico, qué decisiones están vigentes, qué reglas no pueden violarse y cuál es el estado de avance de la especificación.

No sustituye a los documentos especializados. Si existe discrepancia entre este resumen y una fuente de verdad (como los requisitos de arquitectura o las convenciones), se corrige la discrepancia inmediatamente; nunca se asume una versión en silencio.

### Reglas de uso

- No almacenar contraseñas, API keys, tokens ni secretos bajo ninguna circunstancia.
- No registrar datos personales innecesarios.
- No copiar conversaciones completas de IA ni respuestas voluminosas sin sintetizar.
- Marcar la información explícitamente: hecho, decisión, aprendizaje, supuesto, riesgo o pendiente.
- Actualizar al abrir y cerrar cada sesión de trabajo relevante.
- Mantener este documento sintetizado y dentro del límite operativo de ~600 líneas.

### Jerarquía de autoridad ante conflicto

1. Código y pruebas automatizadas que pasan (en proyectos implementadores).
2. Especificaciones maestras en `01-requisitos/` (Visión, Flujo, Parámetros, Actualización).
3. Arquitectura documental en `03-arquitectura/arquitectura-documental-vibe-system.md`.
4. Decisiones de diseño aceptadas en `02-decisiones/` (ADRs).
5. Reglas de trabajo en `fuentes-principales/agent.md`.
6. Memoria curada en `fuentes-principales/inteligencia.md`.
7. Historial cronológico en `fuentes-principales/bitacora.md`.
8. Charlas, notas sueltas o sugerencias en borradores.

---

## 1. Resumen ejecutivo

### Qué es Vibe System

Vibe System es un **meta-sistema operativo y marco de arquitectura documental** concebido para ingenieros de software y *vibe coders* que desarrollan aplicaciones en simbiosis con Inteligencia Artificial.

Su objetivo es eliminar los cuatro problemas críticos del desarrollo con LLMs:
1. La degradación y olvido de contexto.
2. La cascada de alucinaciones y código desconectado de requisitos.
3. La desincronización permanente entre documentación y código.
4. El colapso del proyecto por acumulación de deuda técnica invisible.

### Resultado esperado

Un ecosistema metodológico autocontenido donde:
- Iniciar un proyecto nuevo tome menos de 10 minutos copiando el **Starter Kit**.
- Cada tarea esté blindada por una **Definition of Ready (DoR)** antes de tocar código.
- Cada cambio sea quirúrgico, determinista y auditado por una **Definition of Done (DoD)** y un **Pre-commit Gate**.
- La IA funcione como un copiloto de alta velocidad disciplinado, bajo la autoridad exclusiva de Luigi.

### Estado actual

| Elemento | Estado actual | Observación |
|---|---|---|
| Fase de trabajo | Vibe System v1.1.0 OFICIAL | H0 Cerrado / AUD-VS-001 remediada / H1 Habilitado |
| Repositorio Git | Inicializado con remote `origin` | `https://github.com/luiggiberaldi/vibe-system` |
| Módulo de control | Completo (`00-control/`) | Convenciones, DoR, DoD, Estados, Glosario, Checklists |
| Módulo de requisitos | En redacción (`01-requisitos/`) | Flujo de ejecución, Parámetros, Actualización, Visión |
| Módulo de arquitectura | En redacción (`03-arquitectura/`) | Arquitectura documental y flujo de datos |
| Plantillas de ingeniería | Disponibles | ADRs, Tests, Auditorías, Runbooks, Issues, Cambios de alcance |
| Desacoplamiento de proyectos | Completado | proyectos de aplicación externos migrado a su propio espacio independiente |

### Límites críticos

- Vibe System define **CÓMO trabajar**; no contiene lógica, reglas ni dependencias de productos específicos.
- Los documentos normativos no superan ~600 líneas; los registros append-only se rotan a anexos (ADR-004).
- Las decisiones críticas y validaciones de negocio deben ser deterministas.
- Luigi es la única autoridad humana con poder de aprobación para cambios de alcance o arquitectura.

---

## 2. Fuentes de verdad del sistema

| Dominio | Archivo de referencia | Estado | Propósito |
|---|---|---|---|
| Visión general | `README.md` | ACTIVO | Panorama general del sistema, reglas de oro y estructura |
| Roadmap del framework | `00-control/roadmap-vibe-system.md` | ACTIVO | Hitos de madurez y evolución del framework |
| Visión y alcance | `01-requisitos/vision-y-alcance-vibe-system.md` | ACTIVO | Propósito, problemas resueltos y límites no negociables |
| Flujo de ejecución | `01-requisitos/flujo-de-ejecucion.md` | ACTIVO | Ciclo de 5 fases y protocolo de sesión de trabajo |
| Parámetros del sistema | `01-requisitos/parametros-del-sistema.md` | ACTIVO | Reglas cuantitativas, límites, estados e identificadores |
| Mecanismo de actualización | `01-requisitos/mecanismo-de-actualizacion.md` | ACTIVO | Versionado SemVer, sincronización y control de cambios |
| Kit de inicio | `01-requisitos/paquete-inicial-de-proyecto.md` | ACTIVO | Paquete mínimo para inicializar proyectos nuevos |
| Arquitectura documental | `03-arquitectura/arquitectura-documental-vibe-system.md` | ACTIVO | Topología de carpetas y flujo de información |
| Atlas de Diagramas de Flujo | `03-arquitectura/diagramas-de-flujo.md` | ACTIVO | Modelado visual Mermaid de macroflujo, microflujo y estados |
| Nombres y estándares | `00-control/convenciones.md` | ACTIVO | Rutas, nomenclaturas, IDs y versionado |
| Ciclo y estados | `00-control/estados-del-trabajo.md` | ACTIVO | Ciclo de vida formal de ítems y transiciones |
| Inicio de tareas | `00-control/definition-of-ready.md` | ACTIVO | Condiciones obligatorias antes de escribir código |
| Cierre de tareas | `00-control/definition-of-done.md` | ACTIVO | Criterios obligatorios para considerar algo terminado |
| Filtro de commit | `00-control/pre-commit-gate-checklist.md` | ACTIVO | Verificación previa a guardar cambios en control de versiones |
| Reglas de agente IA | `fuentes-principales/agent.md` | ACTIVO | Guía de comportamiento y límites para LLMs |
| System Prompt Maestro | `04-ia/system-prompt-vibe-coder.md` | ACTIVO | Prompt de sistema reusable para IDEs y agentes |
| Protocolo Anti-Alucinaciones | `04-ia/protocolo-anti-alucinaciones.md` | ACTIVO | Criterios de verificación determinista para IAs |
| Guía de Arranque Rápido | `07-operacion/guia-de-arranque-de-nuevo-proyecto.md` | ACTIVO | Procedimiento paso a paso para nuevo proyecto en 5 min |
| Registro de Riesgos | `09-riesgos/registro-riesgos-vibe-system.md` | ACTIVO | Matriz de riesgos metodológicos y mitigaciones |
| Auditoría Cierre H0 | `11-auditorias/auditoria-H0-fundacion-vibe-system.md` | APROBADA | Certificación formal de la base documental v1.0.0 |
| Auditoría de coherencia | `11-auditorias/AUD-VS-001-auditoria-de-coherencia-v1.md` | REMEDIADA | Hallazgos AUD-001 a AUD-008 cerrados por el plan de fixeo |
| Plan de fixeo documental | `00-control/plan-de-fixeo-documental.md` | COMPLETADO | Fases 0 a 4 (T-DOC-001 a T-DOC-018) |
| Release Notes v1.0.0 | `14-entregas/RELEASE-NOTES-v1.0.0.md` | OFICIAL | Acta de lanzamiento oficial del framework |
| Memoria curada | `fuentes-principales/inteligencia.md` | ACTIVO | Este documento; estado activo condensado |
| Historial de sesiones | `fuentes-principales/bitacora.md` | ACTIVO | Diario de bitácora cronológico de sesiones |

---

## 3. Hechos verificados

| ID | Clasificación | Hecho | Evidencia | Fecha | Confianza | Estado |
|---|---|---|---|---|---|---|
| F-001 | HECHO_VERIFICADO | Vibe System reside en `sistema de proyectos` como estándar maestro desacoplado de casos de uso | Estructura de carpetas | 2026-09-11 | Alta | ACTIVO |
| F-002 | HECHO_VERIFICADO | Existen documentos de control activos para estados, DoR, DoD, convenciones, glosario y pre-commit | Archivos en `00-control/` | 2026-09-11 | Alta | ACTIVO |
| F-003 | HECHO_VERIFICADO | Todo el material específico de proyectos de aplicación externos fue extraído y preservado íntegramente en `carpetas externas de proyecto/` | Carpeta `carpetas externas de proyecto/` | 2026-09-11 | Alta | CERRADO |
| F-004 | HECHO_VERIFICADO | La tríada de memoria viva (`agent.md`, `inteligencia.md`, `bitacora.md`) rige el contexto de trabajo con IA | `fuentes-principales/` | 2026-09-11 | Alta | ACTIVO |
| F-005 | HECHO_VERIFICADO | Se establecen plantillas formales para ADRs, Tests, Auditorías, Runbooks y Cambios de Alcance | Carpetas `02`, `10`, `11`, `12` | 2026-09-11 | Alta | ACTIVO |
| F-006 | HECHO_VERIFICADO | El techo de ~600 líneas en documentos normativos previene la degradación de atención en agentes LLM (regla escalonada completa en ADR-004) | Métrica operativa | 2026-09-11 | Alta | ACTIVO |
| F-007 | HECHO_VERIFICADO | Vibe System v1.0.0 cuenta con auditoría formal de cierre H0 aprobada sin reservas | `auditoria-H0-fundacion-vibe-system.md` | 2026-09-11 | Alta | CERRADO |
| F-008 | HECHO_VERIFICADO | Los 8 hallazgos de AUD-VS-001 fueron remediados por el plan de fixeo y verificados por AUD-VS-002 | `AUD-VS-002` y commits Git | 2026-09-11 | Alta | ACTIVO |
| F-009 | HECHO_VERIFICADO | El sistema cuenta con repositorio Git local y remote `origin` en GitHub | `https://github.com/luiggiberaldi/vibe-system` | 2026-09-11 | Alta | ACTIVO |

---

## 4. Decisiones vigentes

| ID | Clasificación | Decisión | Motivo | Fuente | Fecha | Estado |
|---|---|---|---|---|---|---|
| D-001 | DECISIÓN | Markdown versionado como formato primario universal | Portabilidad, legibilidad humana y compatibilidad nativa con LLMs | Core | 2026-09-10 | ACTIVA |
| D-002 | DECISIÓN | Tríada obligatoria de memoria en `fuentes-principales/` | Mantener contexto claro, reglas firmes e historial sin desbordamiento | Core | 2026-09-10 | ACTIVA |
| D-003 | DECISIÓN | Límite escalonado de líneas: ~600 para normativos, rotación para registros (ver ADR-004) | Preservar ventana de contexto útil de la IA | Core + ADR-004 | 2026-09-11 | ACTIVA |
| D-004 | DECISIÓN | DoR obligatorio antes de escribir código | Evitar retrabajo, alucinaciones y código sin requisitos claros | `00-control/` | 2026-09-11 | ACTIVA |
| D-005 | DECISIÓN | DoD obligatorio antes de dar por cerrada cualquier tarea | Garantizar calidad verificada con pruebas y documentación actualizada | `00-control/` | 2026-09-11 | ACTIVA |
| D-006 | DECISIÓN | Separación estricta entre framework (`sistema de proyectos`) y proyectos de aplicación | Evitar acoplamiento y contaminación de reglas específicas | Core | 2026-09-11 | ACTIVA |
| D-007 | DECISIÓN | Determinismo en servidor y pruebas; la IA no valida negocio ni seguridad | Proteger la confiabilidad del producto final | `agent.md` | 2026-09-11 | ACTIVA |
| D-008 | DECISIÓN | Cero secretos en repositorio, prompts, logs o capturas | Seguridad defensiva no negociable | `agent.md` | 2026-09-11 | ACTIVA |
| D-009 | DECISIÓN | Control estricto de cambios de alcance mediante RFC documental | Proteger la visión del proyecto contra "scope creep" no aprobado | `template-cambio` | 2026-09-11 | ACTIVA |
| D-010 | DECISIÓN | Autoridad humana única: Luigi es el único decisor | La IA asiste y ejecuta; no toma decisiones estructurales autónomas | `agent.md` | 2026-09-11 | ACTIVA |
| ADR-001 | ADR | Arquitectura documental en Markdown versionado en Git | Soberanía, lectura local instantánea por IAs y sincronización atómica con código | `02-decisiones/` | 2026-09-11 | ACEPTADA |
| ADR-002 | ADR | Tríada de memoria viva y principio de autoridad humana | Erradicar amnesia y autonomía destructiva | `02-decisiones/` | 2026-09-11 | ACEPTADA |
| ADR-003 | ADR | Techo cuantitativo de ~600 líneas por archivo | Evitar efecto Lost in the Middle y degradación de atención en LLMs | `02-decisiones/` | 2026-09-11 | ACEPTADA |
| ADR-004 | ADR | Límites escalonados por clase de documento (normativo / registro / referencia) | Hacer la regla PAR-01 cumplible y verificable sin truncar historia | `02-decisiones/` | 2026-09-11 | ACEPTADA |
| ADR-005 | ADR | Topología canónica: `05-ux/` y 16 carpetas | Unificar la topología contradictoria detectada por AUD-VS-001 | `02-decisiones/` | 2026-09-11 | ACEPTADA |

---

## 5. Parámetros del sistema (Resumen)

- **Límite de líneas:** escalonado por clase según ADR-004 (normativos ~600; registros con rotación a anexos; referencias divididas por dominios).
- **Formato de fechas:** Estándar ISO `YYYY-MM-DD`.
- **Estructura de carpetas:** Nomenclatura numérica de dos dígitos (`00-control` a `14-entregas`) más `fuentes-principales`.
- **Sintaxis de identificadores:**
  - ADRs: `ADR-[nnn]-[nombre-corto].md`
  - Hitos: `H[n]` (ej. `H0`, `H1`)
  - Tareas: `T-[nnn]`
  - Requisitos: `REQ-[nnn]`
  - Decisiones: `D-[nnn]`
  - Hechos: `F-[nnn]`
  - Reglas base: `RB-[nnn]`
  - Riesgos: `RSK-[nnn]`
  - Runbooks: `RBK-[nnn]-[procedimiento].md`

---

## 6. Historial de cambios

| Versión | Fecha | Cambio | Responsable |
|---|---|---|---|
| 1.0.0 | 2026-09-11 | Reescritura completa de inteligencia para Vibe System Core tras desacoplamiento de un proyecto de aplicación externo | Luigi / Antigravity |
| 1.1.0 | 2026-09-11 | Sincronización post-fixeo: estado v1.1.0, ADR-004/005, hechos F-008/F-009, D-003 escalonada, repositorio GitHub | Buffy (agente IA) |
