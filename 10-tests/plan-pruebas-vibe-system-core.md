# Plan de Pruebas — Vibe System Core (gates documentales)

> **Estado:** ACTIVO
> **Tipo:** especificación de pruebas, casos verificables y evidencia de calidad
> **Ámbito:** H1 — verificación determinista del core documental (post re-certificación v1.1.0)
> **Responsable:** Luigi
> **Relacionado con:** AUD-VS-001, AUD-VS-002 (evidencia E1–E10), ADR-004, ADR-005, PAR-01/02/04/06, RSK-007, RSK-008
> **Versión:** 1.0.0
> **Creado:** 2026-09-11
> **Última actualización:** 2026-09-11
> **Próxima revisión:** tras integrar la suite en CI o ante cambio de ADRs 004/005

---

## 1. Resumen sencillo

### Qué se está probando

Que el sistema documental Vibe System **sigue íntegro de forma verificable y repetible**: enlaces relativos, ausencia de vocabulario heredado del proyecto de juego, topología canónica de 16 carpetas, referencias a archivos existentes, techos de líneas por clase de documento (ADR-004), estado de los ADRs, coherencia de la tríada de memoria y ausencia de secretos evidentes.

### Por qué importa

Evita repetir el fallo raíz detectado en AUD-VS-001: **gates declarados "verificados" sin evidencia reproducible** (RSK-007). Una declaración manual vale una vez; una suite con código de salida vale en cada ejecución y puede correr en CI, en otra máquina o antes de cada push.

### Resultado esperado

`bash 07-operacion/verify-gates.sh` termina con **EXIT=0** y 12/12 gates `[PASS]`. Ante cualquier violación plantada, el gate correspondiente marca `[FAIL]` y el script termina con **EXIT=1**.

### Fuera de alcance

- Verificación semántica del contenido (que un documento diga la verdad), no solo estructural.
- Render real de GitHub de los enlaces relativos (verificación manual única, hecha en AUD-VS-002).
- Pruebas de proyectos derivados: cada proyecto hereda la plantilla y define su propio plan en `10-tests/`.

---

## 2. Reglas y criterios cubiertos

| ID | Regla o criterio | Riesgo si falla | Fuente | Estado |
|---|---|---|---|---|
| RB-VS-001 | Cero enlaces absolutos `file:///` en Markdown | Documento inaccesible fuera de la máquina original | convenciones §11 / AUD-002 | Cubierto |
| RB-VS-002 | Cero vocabulario del proyecto de juego en el glosario | Contaminación semántica del vocabulario canónico | AUD-001 | Cubierto |
| RB-VS-003 | Topología canónica de 16 carpetas presente | Deriva estructural no gobernada | ADR-005 / PAR-02 | Cubierto |
| RB-VS-004 | Cero referencias a archivos inexistentes en docs activos | Instrucciones no ejecutables para la IA | AUD-006 | Cubierto |
| RB-VS-005 | Techos de líneas por archivo según clase (≤600 normativos nuevos) | Degradación de lectura por IA (lost-in-the-middle) | ADR-004 / PAR-01 | Cubierto |
| RB-VS-006 | ADRs estructurales en estado ACEPTADA | Decisiones sin vigencia formal | convenciones / ADR-001..005 | Cubierto |
| RB-VS-007 | Cero secretos evidentes en el repositorio | Fuga de credenciales | PAR-06 | Cubierto |
| RB-VS-008 | PAR-04 remite a `estados-del-trabajo.md` como autoridad de estados | Dos listas de estados divergentes | AUD-003 menor | Cubierto |
| RB-VS-009 | Índice README cubre ADRs y auditorías recientes | Navegación rota para humanos e IA | AUD-002/006 | Cubierto |
| RB-VS-010 | Tríada de memoria refleja la última re-certificación | La IA opera con memoria desactualizada | agent.md §8 | Cubierto |
| CA-VS-001 | La suite detecta violaciones plantadas (prueba negativa) | Gates que "pasan" siempre son gates falsos | RSK-007 | Cubierto |

---

## 3. Tipos de prueba

| Tipo | Aplicación en este ámbito |
|---|---|
| Unitaria (gate) | Cada gate G1–G12 verifica una sola regla con un comando determinista |
| Regresión | Cada hallazgo de AUD-VS-001 tiene su gate permanente |
| Seguridad | G9 (secretos evidentes) |
| Manual guiada | Render de enlaces relativos en GitHub (única vez, AUD-VS-002) |
| E2E | `10-tests/test-vias-incorporacion.sh`: las dos vías de incorporación de punta a punta (init real de proyectos en sandbox, migración de legado, guardas y negativas) |

---

## 4. Datos de prueba

### Regla de seguridad

Las violaciones plantadas usan **contenido sintético** (`file:///c:/x.md`, `T-GAME-999`, IDs ficticios). Nunca plantar secretos reales, rutas personales ni datos de producción.

### Fixtures necesarios

| ID | Fixture | Para qué sirve | Datos permitidos | Estado |
|---|---|---|---|---|
| FX-001 | Archivo temporal raíz con enlace `file:///` | Prueba negativa de G1 | Ruta falsa sintética | Listo |
| FX-002 | Línea `T-GAME-999 condición de victoria` en un módulo del glosario | Prueba negativa de G2/G5 | IDs y términos de juego ya eliminados | Listo |

### Preparación del ambiente

- Ambiente: Local (Git Bash / bash ≥ 4). Compatible con CI Linux.
- Dependencias: `bash`, `grep`, `sed`, `wc`, `git` (todas estándar).
- Datos que se limpian después: archivos plantados (`99-neg-test.md`, líneas añadidas al glosario se revierten con `git checkout --`).
- Responsable de preparar: quien ejecute la suite (agente o humano).

---

## 5. Casos de prueba

La suite ejecuta los gates G1–G12 (ver `07-operacion/verify-gates.sh` para el comando exacto de cada uno). Cada gate = 1 caso unitario:

| ID | Nombre | Gate | Resultado esperado | Evidencia | Estado |
|---|---|---|---|---|---|
| T-VS-001 | Sin enlaces absolutos `file:///` | G1 | `[PASS]` | Salida de suite 2026-09-11 | PASA |
| T-VS-002 | Glosario sin vocabulario de juego | G2 | `[PASS]` | Salida de suite 2026-09-11 | PASA |
| T-VS-003 | Sin menciones activas de la carpeta obsoleta del prefijo 05 | G3 | `[PASS]` | Salida de suite 2026-09-11 | PASA |
| T-VS-004 | Sin referencias colgantes activas | G4 | `[PASS]` | Salida de suite 2026-09-11 | PASA |
| T-VS-005 | Sin IDs colgantes `PM-*`/`T-GAME-*` en control/requisitos | G5 | `[PASS]` | Salida de suite 2026-09-11 | PASA |
| T-VS-006 | Normativos nuevos ≤600 líneas por archivo | G6 | `[PASS]` (máx 594) | Salida de suite 2026-09-11 | PASA |
| T-VS-007 | ADR-004 y ADR-005 en ACEPTADA | G7 | `[PASS]` | Salida de suite 2026-09-11 | PASA |
| T-VS-008 | Topología 16/16 carpetas | G8 | `[PASS]` | Salida de suite 2026-09-11 | PASA |
| T-VS-009 | Sin secretos evidentes | G9 | `[PASS]` | Salida de suite 2026-09-11 | PASA |
| T-VS-010 | PAR-04 remite a estados-del-trabajo.md | G10 | `[PASS]` | Salida de suite 2026-09-11 | PASA |
| T-VS-011 | README indexa ADR-004 y AUD-VS-002 | G11 | `[PASS]` | Salida de suite 2026-09-11 | PASA |
| T-VS-012 | inteligencia.md refleja AUD-VS-002 | G12 | `[PASS]` | Salida de suite 2026-09-11 | PASA |
| T-VS-015 | Resolvedor: todo enlace .md relativo resuelve | G13 | `[PASS]` (72 verificados) | Salida de suite 2026-09-12 | PASA |
| T-VS-016 | Negativa: enlace roto plantado dispara G13 | — | `[FAIL]` + EXIT=1 | Ejecución 2026-09-12 | PASA |
| T-VS-013 | Negativa: enlace `file:///` plantado dispara G1 | — | `[FAIL]` + EXIT=1 | Ejecución 2026-09-11 | PASA |
| T-VS-014 | Negativa: residuo `T-GAME-999` plantado dispara G2+G5 | — | `[FAIL]` + EXIT=1 | Ejecución 2026-09-11 | PASA |

### Casos críticos en formato detallado

```md
### T-VS-013 — La suite rechaza un enlace absoluto plantado

- Tipo: Negativa / regresión.
- Riesgo cubierto: RB-VS-001 / CA-VS-001.
- Dado: el repositorio en estado íntegro (suite en verde).
- Cuando: se crea `99-neg-test.md` con un enlace Markdown absoluto hacia una ruta sintética `file:///c:/x.md` (fixture FX-001) y se ejecuta la suite.
- Entonces: G1 marca `[FAIL]`, el resumen reporta ≥1 gate fallido y EXIT=1.
- Limpieza: eliminar el archivo plantado.
- Estado: PASA (2026-09-11).
```

```md
### T-VS-014 — La suite detecta residuo de juego plantado en el glosario

- Tipo: Negativa / regresión.
- Riesgo cubierto: RB-VS-002 / RB-VS-004 (IDs colgantes).
- Dado: el repositorio en estado íntegro.
- Cuando: se añade al glosario una línea con `T-GAME-999` y "condición de victoria".
- Entonces: G2 y G5 marcan `[FAIL]` y EXIT=1.
- Limpieza: `git checkout -- 00-control/glosario-metodologia.md`.
- Estado: PASA (2026-09-11).
```

---

## 6. Casos obligatorios por riesgo

Aplicables al ámbito documental (los grupos de IA/privacidad/juego de la plantilla no aplican al core; se heredan en proyectos derivados):

- [x] Una regla violada es detectada (gates G1–G12).
- [x] Una violación plantada es rechazada (pruebas negativas T-VS-013/014).
- [x] El script es idempotente: correrlo dos veces da el mismo resultado.
- [x] El script no muta el repositorio (solo lee; los fixtures los planta quien ejecuta).
- [x] EXIT=0 solo con integridad total; cualquier FAIL produce EXIT=1.

---

## 7. Resultado de ejecución

### Resumen

| Fecha | Ambiente | Casos ejecutados | Pasan | Fallan | Bloqueados | Responsable |
|---|---|---:|---:|---:|---:|---|
| 2026-09-11 | Local (Git Bash) | 14 (12 gates + 2 negativas) | 14 | 0 | 0 | Buffy (agente) |
| 2026-09-12 | Local (Git Bash) | 20 (`test-vias-incorporacion.sh`: 10 Vía A + 10 Vía B) | 20 | 0 | 0 | Buffy (agente) |

### Fallos encontrados durante la primera ejecución (valor del sistema)

| ID de test | Qué falló | Impacto | Causa probable | Acción inmediata | Dueño | Estado |
|---|---|---|---|---|---|---|
| T-VS-005 (1ª corrida) | G5 detectó `T-GAME-003` residual en `convenciones.md` §IDs (ejemplo del prefijo `T-`) | Medio | Residuo de juego no cubierto por el escaneo de AUD-VS-002 (el ejemplo estaba dentro de una tabla de convenciones) | Ejemplo corregido a `T-001` y escaneo de G5 quedará cubierto por este gate en adelante | Luigi | Cerrada |
| T-VS-006 (1ª corrida) | G6 falló por lógica incorrecta del propio gate: sumaba líneas de todos los archivos (940) en vez de verificar por archivo (máx 594) | Medio | Error del implementador de la suite, no del sistema | Gate reescrito con verificación por archivo | Luigi | Cerrada |
| T-VS-008 (2ª corrida) | G8 detectó `13/16`: `05-ux/`, `06-calidad/`, `08-legal-y-confianza/` **no estaban en Git ni en GitHub** (carpetas vacías no trackeadas) | Alto | El push de v1.1.0 publicó 13 carpetas, no las 16 de ADR-005; el stash local lo ocultó | Creación de README placeholder en cada carpeta reservada; commit y push | Luigi | Cerrada |

> Hallazgo destacado: la suite detectó en su primera ejecución un **defecto real de la entrega v1.1.0 publicada en GitHub** que AUD-VS-002 no capturó (solo evidenciaba el árbol local). Esto valida RSK-007 y justifica mantener la suite como gate permanente pre-push.

### Regresiones

| ID | Comportamiento que volvió a fallar | Origen | Prueba añadida o reforzada | Estado |
|---|---|---|---|---|
| REG-001 | Residuo de vocabulario de juego (hallazgo AUD-001) reapareció en `convenciones.md` | Extracción del proyecto de juego | Gate G5 permanente (antes: escaneo puntual en auditoría) | Cerrada |
| REG-002 | Topología incompleta en el remoto (derivada de AUD-003) | Carpetas vacías no trackeadas por Git | Gate G8 permanente + READMEs placeholder | Cerrada |

### Mejoras derivadas (bucle de mejora)

1. `RSK-007` queda **mitigado con evidencia**: los gates ahora son ejecutables (`verify-gates.sh`), no solo declarativos.
2. Nuevo aprendizaje a registrar en la tríada: *carpetas vacías no se versionan en Git — toda carpeta canónica necesita un archivo ancla*.
3. Siguiente mejora propuesta: ejecutar la suite en CI (GitHub Actions) para que el gate corra en cada push sin depender de la memoria del agente.

---

## 8. Criterio de salida

```text
[x] Los casos críticos definidos existen (12 gates + 2 negativos).
[x] Los casos críticos pasan en el ambiente requerido (Local; CI pendiente, no bloqueante).
[x] No hay fallos críticos o altos sin resolver/documentar (los 3 detectados están cerrados).
[x] Los casos de error, borde y permiso relevantes fueron cubiertos (negativas incluidas).
[x] Los datos de prueba son sintéticos y seguros.
[x] Se guardó evidencia reproducible (salida de suite registrada aquí; reproducible con un comando).
[x] La documentación y trazabilidad se actualizaron (bitácora, inteligencia, README, riesgos).
```

### Resultado final

```text
[x] APROBADO CON ACCIONES MENORES
[ ] BLOQUEADO
[ ] REQUIERE NUEVA DECISIÓN/ADR
```

### Siguiente paso único

Integrar `verify-gates.sh` en GitHub Actions para que el gate se ejecute automáticamente en cada push a `main`. *(Hecho 2026-09-11; el CI ejecuta además los tests de vías.)*

---

## 9. Actualizaciones documentales

```text
[x] Actualicé `bitacora.md` con ejecución y resultado.
[x] Actualicé `inteligencia.md` con el aprendizaje y el hecho verificado.
[x] Actualicé el registro de riesgos (RSK-007 → mitigación con evidencia).
[ ] Actualicé la matriz de trazabilidad (no existe en el core; removida por AUD-VS-001).
[ ] Actualicé el plano de arquitectura en `03-arquitectura/` (sin cambios de contrato).
[ ] No requirió ADR (la suite operacionaliza ADR-004/005; no cambia ninguna decisión).
[ ] No requirió runbook nuevo (el propio script es el procedimiento operativo).
```

---

## 10. Historial de cambios

| Fecha | Cambio | Responsable |
|---|---|---|
| 2026-09-11 | Creación del plan de pruebas con 12 gates + 2 pruebas negativas y ejecución inicial (14/14 PASA, 3 fallos detectados y cerrados) | Buffy (agente) |
