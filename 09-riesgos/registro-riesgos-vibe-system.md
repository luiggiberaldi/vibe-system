# Registro de Riesgos — Vibe System Framework

> **Estado:** ACTIVO  
> **Tipo:** matriz y registro de riesgos operativos y metodológicos  
> **Fuente de verdad:** Sí, para la gestión de riesgos del framework Vibe System  
> **Responsable:** Luigi  
> **Clasificación:** INTERNA  
> **Versión:** 1.0.0  
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
| **RSK-003** | Crecimiento desmedido de archivos (> 600 líneas) | Media | Medio | **MEDIA** | MITIGADO | Monitoreo del techo PAR-01 con umbral preventivo a las 500 líneas. |
| **RSK-004** | Fuga accidental de llaves API o secretos en repositorio | Baja | Crítico | **ALTA** | MITIGADO | Pre-commit gate checklist, `.gitignore` estricto y escaneo previo a commit. |
| **RSK-005** | Desincronización entre plantillas maestras y proyectos derivados | Media | Medio | **MEDIA** | MITIGADO | Protocolo formal de sincronización upstream en `mecanismo-de-actualizacion.md`. |
| **RSK-006** | Dependencia o bloqueo de un único proveedor de LLM | Baja | Medio | **BAJA** | MITIGADO | Agnóstico al modelo; prompts en Markdown compatibles con cualquier LLM. |

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
- **Acción preventiva:** Refactorización inmediata al llegar a 500 líneas dividiendo en submódulos coordinados por un `index`.

### RSK-004 — Exposición de Secretos y Llaves en Repositorios
- **Descripción:** Incluir accidentalmente una variable `SUPABASE_SERVICE_ROLE_KEY` o `OPENAI_API_KEY` dentro de un archivo o commit visible para la IA.
- **Efecto:** Compromiso de infraestructura, cargos monetarios no autorizados y revocación de credenciales.
- **Acción preventiva:** Cero secretos en repositorio. Todo secreto vive exclusivamente en `.env.local` excluido en `.gitignore`.
