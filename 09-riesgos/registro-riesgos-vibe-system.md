# Registro de Riesgos — Vibe System Framework

> **Estado:** ACTIVO  
> **Tipo:** matriz y registro de riesgos operativos y metodológicos  
> **Fuente de verdad:** Sí, para la gestión de riesgos del framework Vibe System  
> **Responsable:** Luigi  
> **Clasificación:** INTERNA  
> **Versión:** 1.1.0  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  

---

## 0. Propósito

Este documento identifica y gestiona los **riesgos metodológicos, técnicos y humanos** inherentes al desarrollo acelerado con Inteligencia Artificial y al uso continuado de Vibe System. Cada riesgo cuenta con una probabilidad, un impacto y una estrategia de mitigación obligatoria.

---

## 1. Matriz Resumen de Riesgos

| ID | Riesgo Identificado | Probabilidad | Impacto | Severidad | Estado | Mitigación Primaria |
|---|---|---|---|---|---|---|
| **RSK-001** | Desidia humana en actualización de memoria viva (`bitacora.md` e `inteligencia.md`) | Media | Alto | **ALTA** | MITIGADO | Checklist de cierre de sesión obligatorio en `agent.md`. |
| **RSK-002** | Omisión del gate DoR por urgencia de entrega | Alta | Alto | **CRÍTICA** | MITIGADO | Regla de oro #1: La IA tiene prohibido escribir código sin DoR. |
| **RSK-003** | Crecimiento desmedido de archivos (> 600 líneas) | Media | Medio | **MEDIA** | MITIGADO | Regla escalonada ADR-004: partición de normativos y rotación de registros a anexos. |
| **RSK-004** | Fuga accidental de llaves API o secretos en repositorio | Baja | Crítico | **ALTA** | MITIGADO | Pre-commit gate checklist, `.gitignore` estricto y escaneo previo a commit. |
| **RSK-005** | Desincronización entre plantillas maestras y proyectos derivados | Media | Medio | **MEDIA** | MITIGADO | Protocolo formal de sincronización upstream en `mecanismo-de-actualizacion.md`. |
| **RSK-006** | Dependencia o bloqueo de un único proveedor de LLM | Baja | Medio | **BAJA** | MITIGADO | Agnóstico al modelo; prompts en Markdown compatibles con cualquier LLM. |
| **RSK-007** | Gates no verificables de forma reproducible (evidencia declarada pero no reproducible) | Alta | Alto | **ALTA** | MITIGADO | Verificación con comandos reproducibles (`wc -l`, `grep`) documentada en cada auditoría; AUD-VS-002 verifica con evidencia. |
| **RSK-008** | Pérdida de historial por ausencia de control de versiones | Media | Alto | **ALTA** | MITIGADO | Repositorio Git inicializado con remote GitHub; commit base y tags por release (ADR-001). |

---

## 2. Detalle de Riesgos y Planes de Mitigación

### RSK-001 — Desidia en el Mantenimiento de la Memoria Viva
- **Descripción:** Luigi o la IA terminan una sesión de trabajo exitosa pero olvidan asentar la entrada en `bitacora.md` o actualizar hechos en `inteligencia.md`.
- **Efecto:** La siguiente sesión arranca con un contexto borroso, perdiendo hasta 20 minutos en reevaluar el estado del proyecto.
- **Acción preventiva:** El agente de IA debe incluir como último paso obligatorio de su respuesta el recordatorio de cierre de bitácora.

### RSK-002 — Omisión del Gate DoR (Programar a Ciegas)
- **Descripción:** El desarrollador le pide a la IA que implemente una funcionalidad compleja mediante una sola frase vaga, sin haber redactado los criterios de aceptación ni pruebas asociadas.
- **Efecto:** La IA alucina la arquitectura, genera código incompatible con el resto de la app y obliga a reescribir todo el trabajo.
- **Acción preventiva:** `agent.md` exige que ante cualquier instrucción imprecisa, la IA solicite primero estructurar la tarea con DoR antes de tocar código.

### RSK-003 — Degradación de Atención por Archivos Largos (> 600 Líneas)
- **Descripción:** Por conveniencia o descuido, se siguen acumulando funciones en un solo archivo de código o especificación.
- **Efecto:** Al superar las 700 líneas, los LLMs truncan código existente, olvidan imports y generan parches sintácticos fallidos.
- **Acción preventiva:** Regla escalonada de ADR-004: documentos normativos se dividen en submódulos al llegar a 500 líneas; los registros append-only rotan entradas antiguas a anexos.
- **Actualización (2026-09-11):** la evidencia de AUD-VS-001 demostró que el techo único no se sostenía; la regla se formalizó escalonada en ADR-004 y PAR-01 v1.1.0.

### RSK-004 — Exposición de Secretos y Llaves en Repositorios
- **Descripción:** Incluir accidentalmente una variable `SUPABASE_SERVICE_ROLE_KEY` o `OPENAI_API_KEY` dentro de un archivo o commit visible para la IA.
- **Efecto:** Compromiso de infraestructura, cargos monetarios no autorizados y revocación de credenciales.
- **Acción preventiva:** Cero secretos en repositorio. Todo secreto vive exclusivamente en `.env.local` excluido en `.gitignore`.

### RSK-007 — Gates No Verificables de Forma Reproducible
- **Descripción:** Las auditorías declaran gates "verificados" (ej. techo de 600 líneas, "0 residuos") sin dejar evidencia reproducible; AUD-VS-001 demostró que la evidencia H0 no se reproducía.
- **Efecto:** Falsa confianza en la certificación; defectos estructurales llegan a producción documental sin detección.
- **Acción preventiva:** Toda auditoría debe incluir comandos reproducibles (`wc -l`, `grep`, recorridos de enlaces) y sus resultados numéricos exactos; el auditor revisa con comandos propios antes de dictaminar.
- **Origen:** AUD-VS-001, hallazgo AUD-001 y decisión Q-003.

### RSK-008 — Pérdida de Historial por Ausencia de Control de Versiones
- **Descripción:** El sistema documental operó sin repositorio Git pese a que ADR-001 define "Markdown versionado en Git" como mecanismo central.
- **Efecto:** Imposible auditar quién cambió qué y cuándo; sin rollback ante ediciones destructivas de IA o humanos.
- **Acción preventiva:** Repositorio Git inicializado (commit base `a443929`), remote GitHub configurado, `.gitattributes` con normalización LF y tag por release.
- **Origen:** AUD-VS-001, hallazgo AUD-004.
