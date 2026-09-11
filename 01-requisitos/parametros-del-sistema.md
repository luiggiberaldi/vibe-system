# Parámetros del Sistema — Vibe System

> **Estado:** ACTIVO  
> **Tipo:** especificación cuantitativa de constantes, límites y umbrales normativos  
> **Fuente de verdad:** Sí, para todos los parámetros técnicos y operativos del sistema  
> **Responsable:** Luigi  
> **Clasificación:** INTERNA  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  

---

## 0. Propósito

Este documento compila el catálogo formal de **parámetros cuantitativos, umbrales y reglas estructurales** que rigen Vibe System. Ningún agente ni proceso puede alterar estos parámetros sin la aprobación formal de Luigi y la correspondiente actualización de este archivo.

---

## 1. Catálogo Maestro de Parámetros

### PAR-01: Límite de Longitud de Archivo (Techo de Contexto)
- **Valor nominal:** Máximo 600 líneas de texto/código.
- **Umbral de advertencia:** 500 líneas (evaluar división en componentes o submódulos).
- **Tolerancia máxima:** 650 líneas (exclusivamente para tablas extensas o glosarios consolidados).
- **Justificación técnica:** Los LLMs experimentan pérdida de atención (*lost in the middle*) y aumento drástico de alucinaciones en archivos con ventanas largas de tokens. Mantener archivos por debajo de 600 líneas garantiza precisión máxima en búsquedas y ediciones.

### PAR-02: Topología Canónica de Carpetas
Todo proyecto basado en Vibe System adopta la estructura numérica normalizada:

| Prefijo / Carpeta | Nombre Canónico | Propósito y Contenido |
|---|---|---|
| `fuentes-principales/` | Memoria Viva | `agent.md`, `inteligencia.md`, `bitacora.md` |
| `00-control/` | Control del Proyecto | Convenciones, DoR, DoD, Estados, Glosario, Checklists |
| `01-requisitos/` | Especificación Funcional | Visión, requisitos de usuario, casos de uso, flujos |
| `02-decisiones/` | Registro de Decisiones | ADRs (`ADR-xxx-[slug].md`) |
| `03-arquitectura/` | Diseño Técnico | Planos arquitectónicos, diagramas, modelo de datos |
| `04-ia/` | IA & Prompts | System prompts, políticas de modelos, adaptadores de IA |
| `05-seguridad/` | Seguridad & Privacidad | Modelado de amenazas, políticas de datos, auditoría de permisos |
| `06-calidad/` | Aseguramiento de Calidad | Estrategia de calidad, matrices de pruebas, métricas |
| `07-operacion/` | Operación & Infraestructura | Procedimientos operativos, scripts de arranque, backups |
| `08-legal-y-confianza/` | Términos & Cumplimiento | Términos de servicio, políticas de privacidad, descargos |
| `09-riesgos/` | Gestión de Riesgos | Matriz y registro de riesgos (`registro-riesgos.md`) |
| `10-tests/` | Suites de Pruebas | Planes de prueba, suites e informes de resultados |
| `11-auditorias/` | Revisiones Formales | Auditorías de hitos, auditorías de seguridad y código |
| `12-runbooks/` | Manuales Operativos | Procedimientos paso a paso para incidentes y despliegues |
| `13-investigacion/` | I+D & Borradores | Ideas preliminares, benchmarks, pruebas de concepto |
| `14-entregas/` | Paquetes de Lanzamiento | Notas de versión (release notes), changelogs y tags |

### PAR-03: Convención Sintáctica de Identificadores
Todos los elementos del sistema deben etiquetarse mediante sintaxis determinista:

| Tipo de Elemento | Prefijo | Patrón de Identificador | Ejemplo Válido |
|---|---|---|---|
| Architectural Decision Record | `ADR-` | `ADR-[nnn]-[slug-kebab-case].md` | `ADR-001-stack-postgresql.md` |
| Hito de Trabajo | `H` | `H[n]` (del 0 al N) | `H0`, `H1`, `H2` |
| Epic / Capacidad Mayor | `E-` | `E-[n]` | `E-1`, `E-2` |
| Requisito Funcional | `REQ-` | `REQ-[nnn]` | `REQ-001`, `REQ-042` |
| Tarea Atómica | `T-` | `T-[nnn]` | `T-015`, `T-102` |
| Decisión Vigente | `D-` | `D-[nnn]` | `D-001`, `D-010` |
| Hecho Verificado | `F-` | `F-[nnn]` | `F-001`, `F-006` |
| Regla Base Innegociable | `RB-` | `RB-[nnn]` | `RB-001`, `RB-005` |
| Riesgo Documentado | `RSK-` | `RSK-[nnn]` | `RSK-001` |
| Pregunta / Decisión Pendiente | `Q-` | `Q-[nnn]` | `Q-001` |
| Manual Operativo / Runbook | `RBK-` | `RBK-[nnn]-[slug].md` | `RBK-001-despliegue-staging.md` |

### PAR-04: Máquina de Estados Formal
Los ítems de trabajo (tareas, requisitos y documentos) deben transitar exclusivamente entre los siguientes 7 estados normativos:

1. `IDEA`: Propuesta no validada ni dimensionada.
2. `ESPECIFICADO`: Documentada con criterios de aceptación; pendiente de DoR.
3. `EN_PROGRESO`: En implementación activa (cumplió DoR formalmente).
4. `EN_REVISION`: Implementación lista; pendiente de verificación de pruebas y pre-commit gate.
5. `COMPLETADO`: Validada formalmente contra DoD y aceptada por Luigi.
6. `BLOQUEADO`: Detenida por dependencia no resuelta, riesgo crítico o falta de insumo.
7. `DEPRECADO`: Descartada o sustituida explícitamente sin borrado silencioso.

### PAR-05: Jerarquía de Verdad ante Conflicto
Si dos fuentes se contradicen, la resolución de discrepancias obedece estrictamente al siguiente orden descendente:

1. Código fuente y pruebas automatizadas que pasan en verde.
2. Especificaciones maestras de requisitos (`01-requisitos/`).
3. Arquitectura técnica y documental (`03-arquitectura/`).
4. ADRs aceptados (`02-decisiones/`).
5. Guía de agente de IA (`fuentes-principales/agent.md`).
6. Memoria curada (`fuentes-principales/inteligencia.md`).
7. Historial de sesiones (`fuentes-principales/bitacora.md`).
8. Conversaciones de chat, borradores o notas sueltas.

### PAR-06: Parámetros de Seguridad y Secretos
- **Secretos en repo:** `0` (cero tokens, llaves o contraseñas en cualquier commit o archivo).
- **Entornos separados:** Mínimo `desarrollo` (local) y `producción`; opcionalmente `staging`.
- **Variables de entorno:** Todas las credenciales se inyectan mediante archivos `.env` excluidos explícitamente en `.gitignore` y documentados en un `.env.example` sanitizado.
