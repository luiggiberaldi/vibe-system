# ADR-005 — Topología Canónica: `05-ux/` y Conteo Oficial de 16 Carpetas

> **Estado:** ACEPTADA  
> **Fecha:** 2026-09-11  
> **Responsable:** Luigi  
> **Decisores:** Luigi  
> **Clasificación:** ESTRUCTURAL / TOPOLOGÍA DOCUMENTAL  
> **Versión:** 1.0.0  
> **Relacionado con:** AUD-VS-001 (hallazgo AUD-003), PAR-02, README §3, ADR-002, `00-control/plan-de-fixeo-documental.md` (T-DOC-004)  
> **Reemplaza:** la mención de `05-seguridad/` en PAR-02 v1.0.0  
> **Reemplazado por:** ninguno

---

## 1. Contexto y Problema

AUD-VS-001 (hallazgo AUD-003, Alto) detectó que PAR-02 declaraba `05-seguridad/` como carpeta canónica del prefijo 05, mientras el README §3, ADR-002 y el sistema de archivos real usan `05-ux/`. La topología canónica se contradecía entre documentos sin ADR que cubriera el cambio, y el conteo de carpetas aparecía como "15" y "16" según el documento.

**Hechos verificados (2026-09-11):**

- La carpeta existente en disco es `05-ux/`.
- README §3 ya la describía como `05-ux/` ("Flujos, interacción y diseño de pantallas").
- No existe ningún contenido de seguridad alojado bajo el prefijo 05.

---

## 2. Decisión

> **Decisión:** `05-ux/` es la carpeta canónica del prefijo 05, con propósito "UX & Diseño: flujos, interacción y diseño de pantallas". La topología canónica de Vibe System son **16 carpetas** (00 a 14, más `fuentes-principales/`).

### Regla operativa resultante

Ningún documento debe volver a mencionar `05-seguridad/` como carpeta canónica. Las preocupaciones de seguridad y privacidad viven en PAR-06, `08-legal-y-confianza/` y las auditorías de `11-auditorias/`; si algún día ameritan carpeta propia, requerirán un nuevo ADR con migración real de carpetas.

### Alcance

- **Incluye:** sincronización de PAR-02 con el README y el disco; conteo oficial único (16).
- **No incluye:** renombrar carpetas en disco (no hace falta: la realidad ya coincide con la decisión).

---

## 3. Alternativas Evaluadas

| Opción | Ventajas | Riesgos o costos | ¿Elegida? |
|---|---|---|---|
| A. Renombrar la carpeta real a `05-seguridad/` y actualizar todos los documentos | Dedicaría un espacio propio a seguridad | Rompe README, ADR-002 y referencias; la seguridad ya tiene hogar normativo (PAR-06, 08-legal-y-confianza) | No |
| B. Fijar `05-ux/` como canónica (realidad actual) | Cero migración; coincide con disco, README y ADR-002; la UX es necesidad recurrente de todo proyecto | La seguridad queda sin carpeta dedicada (cubierto por PAR-06 y 08) | **Sí** |
| C. Duplicar en `05-ux/` y `05-seguridad/` (16→17 carpetas) | — | Viola la regla "una fuente por concepto" e infla la topología | No |

---

## 4. Consecuencias

### Positivas

- Una sola topología canónica, verificable contra el disco, citable por la IA sin ambigüedad.
- El conteo "16 carpetas" queda fijado como cifra oficial.

### Negativas / Compromisos aceptados

- Los proyectos con necesidades de seguridad intensiva gestionan esas preocupaciones vía PAR-06, `08-legal-y-confianza/` y auditorías, sin carpeta dedicada.

### Riesgo residual

| ID | Riesgo que queda | Nivel | Mitigación | Responsable |
|---|---|---|---|---|
| RSK-003 | Drift entre topología documentada y real en futuros cambios | Bajo | Todo cambio de topología exige ADR + verificación contra disco en la auditoría de hito | Luigi |

---

## 5. Plan de implementación

1. Actualizar la fila `05-*` de PAR-02 en `01-requisitos/parametros-del-sistema.md`. — Hecho con este ADR.
2. Verificar que README §3 y ADR-002 ya usan `05-ux/` (no requieren cambio).

**Condición para que sea efectiva:** aceptación por Luigi (otorgada el 2026-09-11).

---

## 6. Historial de cambios

| Fecha | Cambio | Responsable |
|---|---|---|
| 2026-09-11 | Creación del ADR a partir de AUD-VS-001 (AUD-003) | Buffy (agente IA) |
