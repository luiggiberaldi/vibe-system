# Release Notes — Vibe System v1.1.0 (Remediación y Publicación)

> **Versión:** 1.1.0  
> **Fecha de Lanzamiento:** 2026-09-11  
> **Autor:** Luigi  
> **Estado:** LANZAMIENTO OFICIAL  
> **Auditoría de re-certificación:** [`11-auditorias/AUD-VS-002-recertificacion-v1-1-0.md`](AUD-VS-002-recertificacion-v1-1-0.md)

---

## 0. Resumen del Lanzamiento

**Vibe System v1.1.0** remedia la totalidad de los hallazgos de la auditoría de coherencia [AUD-VS-001](../11-auditorias/AUD-VS-001-auditoria-de-coherencia-v1.md) y publica el sistema por primera vez en GitHub, cumpliendo por fin el mecanismo central definido en ADR-001 (Markdown versionado en Git).

El cambio estructural más importante es la **evolución de la regla de 600 líneas** a un régimen escalonado por clase de documento (ADR-004), que hace la norma cumplible sin truncar la historia de los registros append-only como la bitácora.

---

## 1. Principales Novedades en v1.1.0

### Base de control de versiones (Fase 0)
- Repositorio Git inicializado con commit base y remote `origin` en `https://github.com/luiggiberaldi/vibe-system`.
- `.gitignore` (excluye `.freebuff/`) y `.gitattributes` con normalización de finales de línea a LF.
- Cierra los hallazgos AUD-004 y AUD-008 de AUD-VS-001.

### ADR-004 — Límites escalonados de tamaño documental (Fase 1)
- PAR-01 v1.1.0 distingue tres clases: **normativos** (≤600 líneas), **registros append-only** (sin techo; rotación a `bitacora-anexos/`) y **referencias** (división por dominios).
- El espíritu de ADR-003 (*lost in the middle*) se preserva donde importa: los documentos que la IA lee completos.

### ADR-005 — Topología canónica (Fase 1)
- `05-ux/` es la carpeta canónica del prefijo 05; topología oficial fijada en **16 carpetas**.
- PAR-02 sincronizada con README §3 y el disco real. Cierra AUD-003.

### Migración de enlaces y referencias (Fase 2)
- Los 40 enlaces absolutos `file:///c:/Users/...` convertidos a **rutas relativas**; el sistema renderiza correctamente en GitHub. Cierra AUD-002.
- Referencias a archivos inexistentes (`planmaestro.md`, `arquitectura.md`, `matriz-trazabilidad.md`, `roadmap.md`) generalizadas a roles documentales en plantillas, DoR/DoD, `agent.md` y convenciones. Cierra AUD-006.
- Auditoría H0 normalizada como **AUD-VS-000** con cabecera conforme a plantilla.

### Glosario modularizado (Fase 3)
- Purga del vocabulario heredado del proyecto de aplicación (Parte A §§3–24 del glosario original) e IDs colgantes (`PM-*`, `D-011`, `INV-004`, `COH-ALPHA-001`, `T-GAME-*`).
- `glosario.md` (1.524 líneas) dividido en **índice + 3 módulos** por dominio: `glosario-metodologia.md`, `glosario-ia-seguridad.md`, `glosario-operacion.md`. Completa el cierre de AUD-001.

### Memoria y riesgos (Fase 4)
- `agent.md` v1.1.0 con historial de cambios sincronizado.
- Registro de riesgos ampliado con **RSK-007** (gates no verificables de forma reproducible) y **RSK-008** (sin control de versiones); RSK-003 realineado a ADR-004.
- Prefijo de riesgo unificado a `RSK-` en `convenciones.md` (cierra AUD-005).

---

## 2. Compatibilidad

- Sin cambios rompientes para proyectos derivados: el Starter Kit y el flujo de 5 fases no varían.
- Los proyectos derivados pueden adoptar la regla escalonada de ADR-004 como mejora recomendada.
- Cambio visible para consumidores del repo: los enlaces internos ahora son relativos y requieren clonar o navegar desde GitHub.

---

## 3. Cómo Comenzar

Consulta la [Guía de Arranque de Nuevo Proyecto](../07-operacion/guia-de-arranque-de-nuevo-proyecto.md) para clonar el Starter Kit e inicializar tu primer proyecto gobernado por Vibe System en menos de 5 minutos.
