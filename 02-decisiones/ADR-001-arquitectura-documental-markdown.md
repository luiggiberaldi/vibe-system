# ADR-001 — Arquitectura Documental en Markdown Versionado

> **Estado:** ACEPTADA  
> **Fecha:** 2026-09-11  
> **Responsable:** Luigi  
> **Decisores:** Luigi  
> **Clasificación:** ESTRUCTURAL / FUNDACIONAL  
> **Versión:** 1.0.0  

---

## 1. Contexto y Problema

En el desarrollo de software tradicional y en equipos asistidos por Inteligencia Artificial, la documentación suele dispersarse en herramientas externas (Notion, Google Docs, Confluence, Trello o wikis cerradas).

Este enfoque genera tres problemas críticos para un *vibe coder*:
1. **Desincronización temporal:** El código evoluciona mediante commits en Git, mientras que la documentación externa se desactualiza rápidamente, perdiendo la trazabilidad de qué versión documental corresponde a qué commit.
2. **Invisibilidad para los modelos de lenguaje locales:** Los asistentes de IA en IDEs (Cursor, Antigravity, Claude Code) tienen acceso directo al sistema de archivos local, pero no pueden leer fluidamente bases de datos externas sin fricción de APIs o plugins.
3. **Costo y dependencia de plataformas:** Alojar el conocimiento del proyecto en servicios de terceros genera costos recurrentes, riesgo de exportación defectuosa y bloqueo de proveedor (*vendor lock-in*).

---

## 2. Decisión Tomada

Se decide adoptar **Markdown (.md) versionado en el mismo repositorio de Git** como el formato y almacenamiento primario universal para toda la documentación técnica, estratégica y metodológica de Vibe System y de cualquier proyecto derivado.

Toda documentación debe organizarse en una topología de carpetas numeradas (`00-control` a `14-entregas` más `fuentes-principales/`) y seguir las normas de formato UTF-8 y GitHub Flavored Markdown (GFM).

---

## 3. Alternativas Evaluadas

| Criterio | Markdown en Git (Elegida) | Notion / Confluence | Código auto-documentado sin docs |
|---|---|---|---|
| **Acceso para agentes de IA** | Nativo, instantáneo y sin API keys | Requiere integración web o exportación | Nulo (la IA pierde el panorama macro) |
| **Sincronización con código** | Atómica en el mismo commit | Manual y propensa a desincronización | Inexistente para diseño y visión |
| **Portabilidad y soberanía** | 100% texto plano, funciona offline | Dependiente de conexión y cuenta SaaS | Depende del repositorio |
| **Historial de cambios** | `git log` y `git diff` exacto por línea | Historial opaco en la nube | Solo historial de código |
| **Costo** | $0 USD | Suscripciones mensuales | $0 USD |

---

## 4. Consecuencias

### Positivas
- Los asistentes de IA pueden leer cualquier especificación de forma local en milisegundos con cero costo de llamadas a APIs externas.
- La documentación evoluciona al mismo ritmo que el código: un Pull Request puede y debe incluir tanto la funcionalidad como la actualización de su respectivo archivo `.md`.
- El repositorio es 100% autocontenido: clonar el proyecto equivale a clonar su sistema operativo documental completo.

### Negativas / Compromisos aceptados
- Requiere disciplina humana y de la IA para respetar la estructura de carpetas y no dispersar archivos fuera de su ubicación canónica.
- No ofrece interfaces de edición visual con arrastrar y soltar estilo Notion (se compensa usando editores con vista previa de Markdown).
