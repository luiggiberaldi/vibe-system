# ADR-004 — Límites Escalonados de Tamaño Documental (Evolución de PAR-01)

> **Estado:** ACEPTADA  
> **Fecha:** 2026-09-11  
> **Responsable:** Luigi  
> **Decisores:** Luigi  
> **Clasificación:** TÉCNICA / GOBIERNO DOCUMENTAL  
> **Versión:** 1.1.0  
> **Relacionado con:** AUD-VS-001 (hallazgo AUD-001), ADR-003, PAR-01, `00-control/plan-de-fixeo-documental.md` (T-DOC-003, T-DOC-013)  
> **Reemplaza:** la redacción única de "600 líneas para todo archivo operativo" de PAR-01 v1.0.0  
> **Reemplazado por:** ninguno

---

## 1. Contexto y Problema

La auditoría AUD-VS-001 (hallazgo AUD-001, Crítico) demostró que el techo único de 600 líneas (ADR-003 / PAR-01 v1.0.0) no se sostenía en la práctica:

1. Cinco documentos lo violaban ya en la certificación v1.0.0 (`glosario.md` 1.524 líneas, `estados-del-trabajo.md` 1.114, `convenciones.md` 818, DoR 706, DoD 674).
2. Los **registros append-only** (`bitacora.md`, changelogs, registro de riesgos) crecen indefinidamente **por diseño**: un techo duro los obliga a truncar historia o los convierte en regla incumplida desde el día uno.

Decisión de Luigi (2026-09-11, resolución de Q-002): **no derogar** la regla, sino **formalizarla escalonada por clase de documento**. El fundamento cuantitativo de ADR-003 (efecto *lost in the middle*, Liu et al.) sigue siendo válido para los documentos que la IA lee completos.

---

## 2. Decisión

> **Decisión:** PAR-01 se reescribe como regla escalonada de tres clases. El techo de 600 líneas aplica solo a documentos normativos; los registros append-only se gobiernan por rotación a anexos; las referencias se dividen por dominios.

| Clase de documento | Ejemplos | Límite | Mecanismo cuando crece |
|---|---|---|---|
| **Normativo** (la IA lo lee completo) | PAR, DoR, DoD, convenciones, `agent.md` | ≤600 líneas; aviso en 500; tolerancia 650 solo para tablas o glosarios consolidados | Dividir en submódulos con índice |
| **Registro anexo** (append-only) | `bitacora.md`, changelogs, registro de riesgos | Sin techo duro | Rotar entradas antiguas a anexos por período (ej. `bitacora-anexos/bitacora-2026-H2.md`); el archivo activo conserva una ventana reciente + índice de anexos |
| **Referencia** (consulta por búsqueda) | glosario | Techo flexible | Dividir por dominios con documento índice |

### Regla operativa resultante

Antes de citar el techo de 600 líneas, clasificar el documento: si es un registro append-only, **rotar** (no truncar); si es una referencia, **dividir por dominios**; solo los normativos están obligados a la partición por techo.

### Alcance

- **Incluye:** reescritura de PAR-01, regla #3 del README, rotación de bitácora, partición del glosario.
- **No incluye:** reorganización inmediata de `convenciones.md`, DoR y DoD (ver §4, deuda diferida).

---

## 3. Alternativas Evaluadas

| Opción | Ventajas | Riesgos o costos | ¿Elegida? |
|---|---|---|---|
| A. Mantener techo único de 600 para todo | Regla simple | Imposible de cumplir para registros; incentivó la evidencia falsa de la auditoría H0 | No |
| B. Eliminar todo límite | Cero fricción | El *lost in the middle* regresa justo donde más daña (normativos leídos completos por la IA) | No |
| C. Regla escalonada por clase | El espíritu de ADR-003 sobrevive donde importa; los registros crecen sin romper nada | Requiere clasificar cada documento y disciplinar la rotación | **Sí** |

---

## 4. Consecuencias

### Positivas

- La regla vuelve a ser **cumplible y verificable** por clase, restaurando la credibilidad de los gates (mitiga RSK-007).
- `bitacora.md` puede crecer sin violar norma alguna; su historia se preserva íntegra en anexos.
- El glosario puede organizarse por dominios sin culpa normativa.

### Negativas / Compromisos aceptados

- Deuda técnica diferida: `convenciones.md` (818), DoR (706) y DoD (674) son normativos por encima del techo. Se registra como **DT-001** con reorganización en submódulos diferida al siguiente hito; no bloquea la re-certificación v1.1.0.
- La rotación de bitácora introduce un paso de mantenimiento periódico (T-DOC-013).

### Riesgo residual

| ID | Riesgo que queda | Nivel | Mitigación | Responsable |
|---|---|---|---|---|
| RSK-007 | Gates no reproducibles si no se clasifica bien un documento | Bajo | La clase se declara en la cabecera del plan y en PAR-01; AUD-VS-002 verifica | Luigi |

---

## 5. Plan de implementación

1. Reescribir PAR-01 en `01-requisitos/parametros-del-sistema.md` (T-DOC-003). — Hecho con este ADR.
2. Actualizar regla #3 del README (T-DOC-003). — Hecho con este ADR.
3. Crear `fuentes-principales/bitacora-anexos/` y documentar rotación (T-DOC-013).
4. Dividir el glosario por dominios (T-DOC-011).

**Condición para que sea efectiva:** aceptación por Luigi (otorgada el 2026-09-11) y presencia de este ADR en `02-decisiones/`.

---

## 6. Historial de cambios

| Fecha | Cambio | Responsable |
|---|---|---|
| 2026-09-11 | Creación del ADR a partir de AUD-VS-001 y decisión de Luigi | Buffy (agente IA) |
