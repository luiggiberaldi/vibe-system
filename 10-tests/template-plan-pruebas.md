# Plan de Pruebas — [NOMBRE-DEL-PROYECTO] (gates documentales)

> **Estado:** BORRADOR
> **Tipo:** especificación de pruebas, casos verificables y evidencia de calidad
> **Ámbito:** H0/H1 — verificación determinista del proyecto (heredado de Vibe System Core)
> **Responsable:** Luigi
> **Relacionado con:** `07-operacion/verify-gates.sh` (suite), ADR-004, ADR-005, convenciones.md (prefijos), PAR-06
> **Versión:** 0.1.0
> **Creado:** YYYY-MM-DD
> **Última actualización:** YYYY-MM-DD
> **Próxima revisión:** tras el primer gate en rojo o al cerrar la fase inicial

---

## 0. Para qué sirve esta plantilla

Es la versión heredable del plan de pruebas de Vibe System Core (`10-tests/plan-pruebas-vibe-system-core.md` en el repositorio maestro). Todo proyecto derivado la copia a su `10-tests/`, reemplaza los marcadores `[...]` y ejecuta la suite heredada `07-operacion/verify-gates.sh` para saber **de forma determinista** si su documentación está íntegra: EXIT=0 verde, EXIT=1 rojo.

> **Regla central:** una regla documental no está "verificada" si no existe un comando repetible que la compruebe.

---

## 1. Resumen sencillo

### Qué se está probando

Que la documentación del proyecto sigue íntegra de forma verificable: enlaces relativos, glosario sin vocabulario heredado del core, referencias a archivos existentes, techos de líneas por archivo (ADR-004), topología canónica de 16 carpetas, ausencia de secretos evidentes, Git activo y tríada de memoria presente.

### Por qué importa

Evita el fallo raíz que AUD-VS-001 detectó en el core: gates declarados "verificados" sin evidencia reproducible (RSK-007). En el core, una suite de gates detectó en su primera corrida un defecto real ya publicado en GitHub que la auditoría manual no capturó.

### Resultado esperado

`bash 07-operacion/verify-gates.sh` termina con **EXIT=0** y 10/10 gates `[PASS]`. Ante una violación plantada, el gate correspondiente marca `[FAIL]` y el script termina con **EXIT=1**.

### Fuera de alcance

- Verificación semántica del contenido (que un documento diga la verdad).
- Pruebas del producto en sí: créalas con [template-tests.md](template-tests.md) en este mismo directorio.

---

## 2. Reglas y criterios cubiertos

| ID | Regla o criterio | Riesgo si falla | Fuente | Estado |
|---|---|---|---|---|
| RB-001 | Cero enlaces absolutos `file:///` en Markdown | Documento inaccesible fuera de la máquina original | convenciones.md §enlaces | Pendiente |
| RB-002 | Glosario sin vocabulario heredado del core | Contaminación semántica entre proyectos | AUD-VS-001 (lección core) | Pendiente |
| RB-003 | Topología canónica de 16 carpetas | Deriva estructural no gobernada | ADR-005 / PAR-02 | Pendiente |
| RB-004 | Cero referencias colgantes en docs activos | Instrucciones no ejecutables para la IA | AUD-VS-001 (lección core) | Pendiente |
| RB-005 | Techos de líneas por archivo según clase (ADR-004) | Degradación de lectura por IA (lost-in-the-middle) | ADR-004 / PAR-01 | Pendiente |
| RB-006 | Cero secretos evidentes en el repositorio | Fuga de credenciales | PAR-06 | Pendiente |
| RB-007 | Git activo con árbol limpio | Trabajo sin versionar; rollback imposible | ADR-001 / RSK-008 | Pendiente |
| RB-008 | Tríada de memoria presente y activa | La IA opera sin memoria o desactualizada | agent.md / ADR-002 | Pendiente |
| CA-001 | La suite detecta violaciones plantadas (prueba negativa) | Gates que "pasan" siempre son gates falsos | RSK-007 | Pendiente |

---

## 3. Tipos de prueba

| Tipo | Aplicación en este ámbito |
|---|---|
| Unitaria (gate) | Cada gate G1–G10 verifica una sola regla con un comando determinista |
| Regresión | Cada gate nace de un hallazgo real documentado en el core (AUD-VS-001/002) |
| Seguridad | G6 (secretos evidentes) |
| Manual guiada | Render de enlaces relativos en GitHub (una vez tras el primer push) |

---

## 4. Datos de prueba

### Regla de seguridad

Las violaciones plantadas usan **contenido sintético** (rutas falsas, IDs ficticios). Nunca plantar secretos reales, rutas personales ni datos de producción.

### Fixtures necesarios

| ID | Fixture | Para qué sirve | Datos permitidos | Estado |
|---|---|---|---|---|
| FX-001 | Archivo temporal con enlace Markdown absoluto hacia ruta `file:///` sintética | Prueba negativa de G1 | Ruta falsa | Pendiente |
| FX-002 | Línea con ID colgante sintético (p. ej. `T-GAME-999`) en un módulo del glosario | Prueba negativa de G2 | IDs ya eliminados | Pendiente |

### Preparación del ambiente

- Ambiente: Local (Git Bash / bash ≥ 4). Compatible con CI Linux.
- Dependencias: `bash`, `grep`, `wc`, `git` (estándar).
- Limpieza posterior: revertir archivos plantados (`git checkout --` / `rm`).
- Responsable: quien ejecute la suite (agente o humano).

---

## 5. Casos de prueba

La suite ejecuta los gates G1–G10 (comandos exactos en `07-operacion/verify-gates.sh`). Cada gate = 1 caso unitario:

| ID | Nombre | Gate | Resultado esperado | Evidencia | Estado |
|---|---|---|---|---|---|
| T-001 | Sin enlaces absolutos `file:///` | G1 | `[PASS]` | Salida de suite | Pendiente |
| T-002 | Glosario sin vocabulario heredado | G2 | `[PASS]` | Salida de suite | Pendiente |
| T-003 | Sin referencias colgantes activas | G3 | `[PASS]` | Salida de suite | Pendiente |
| T-004 | Normativos dentro del techo (≤600 por archivo) | G4 | `[PASS]` | Salida de suite | Pendiente |
| T-005 | Topología 16/16 carpetas | G5 | `[PASS]` | Salida de suite | Pendiente |
| T-006 | Sin secretos evidentes | G6 | `[PASS]` | Salida de suite | Pendiente |
| T-007 | Git activo y árbol limpio | G7 | `[PASS]` | Salida de suite | Pendiente |
| T-008 | Tríada de memoria 3/3 | G8 | `[PASS]` | Salida de suite | Pendiente |
| T-009 | Prefijo de IDs del proyecto configurado | G9 | `[PASS]` | Salida de suite | Pendiente |
| T-010 | inteligencia.md registra el proyecto | G10 | `[PASS]` | Salida de suite | Pendiente |
| T-011 | Negativa: enlace `file:///` plantado dispara G1 | — | `[FAIL]` + EXIT=1 | Ejecución | Pendiente |
| T-012 | Negativa: ID colgante plantado dispara G2 | — | `[FAIL]` + EXIT=1 | Ejecución | Pendiente |

### Formato para casos críticos

```md
### T-011 — La suite rechaza un enlace absoluto plantado

- Tipo: Negativa / regresión.
- Riesgo cubierto: RB-001 / CA-001.
- Dado: el proyecto en estado íntegro (suite en verde).
- Cuando: se crea un archivo temporal con un enlace Markdown absoluto hacia una ruta sintética `file:///` (fixture FX-001) y se ejecuta la suite.
- Entonces: G1 marca `[FAIL]`, el resumen reporta ≥1 gate fallido y EXIT=1.
- Limpieza: eliminar el archivo plantado.
- Estado: PENDIENTE / PASA / FALLA.
```

---

## 6. Casos obligatorios por riesgo

Aplicables al ámbito documental; los grupos de IA/privacidad/operación de la plantilla general se heredan vía [template-tests.md](template-tests.md) según el producto:

- [ ] Una regla violada es detectada (gates G1–G10).
- [ ] Una violación plantada es rechazada (pruebas negativas T-011/T-012).
- [ ] El script es idempotente: correrlo dos veces da el mismo resultado.
- [ ] El script no muta el repositorio (solo lee; los fixtures los planta quien ejecuta).
- [ ] EXIT=0 solo con integridad total; cualquier FAIL produce EXIT=1.

---

## 7. Resultado de ejecución

### Resumen

| Fecha | Ambiente | Casos ejecutados | Pasan | Fallan | Bloqueados | Responsable |
|---|---|---:|---:|---:|---:|---|
| YYYY-MM-DD | Local | 12 | 0 | 0 | 0 | [rol] |

### Fallos encontrados

| ID de test | Qué falló | Impacto | Causa probable | Acción inmediata | Dueño | Estado |
|---|---|---|---|---|---|---|
| T-XXX-00N | [fallo] | Bajo / Medio / Alto / Crítico | [hipótesis, no inventar] | [acción] | [rol] | Abierto |

### Regresiones

| ID | Comportamiento que volvió a fallar | Origen | Prueba añadida o reforzada | Estado |
|---|---|---|---|---|
| REG-001 | [comportamiento] | [cambio/incidente] | [test] | Abierta / Cerrada |

---

## 8. Criterio de salida

```text
[ ] Los casos críticos definidos existen (10 gates + 2 negativos).
[ ] Los casos críticos pasan en el ambiente requerido.
[ ] No hay fallos críticos o altos sin resolver/documentar.
[ ] Los casos de error y borde fueron cubiertos (negativas incluidas).
[ ] Los datos de prueba son sintéticos y seguros.
[ ] Se guardó evidencia reproducible (salida de la suite).
[ ] La documentación y trazabilidad se actualizaron (bitácora, inteligencia).
```

### Resultado final

```text
[ ] APROBADO PARA AVANZAR
[ ] APROBADO CON ACCIONES MENORES
[ ] BLOQUEADO
[ ] REQUIERE NUEVA DECISIÓN/ADR
```

### Siguiente paso único

[Ejemplo: "Configurar los parámetros del proyecto en `verify-gates.sh` (nombre, prefijo) y registrar la primera corrida verde aquí".]

---

## 9. Actualizaciones documentales

```text
[ ] Actualicé `bitacora.md` con ejecución y resultado.
[ ] Actualicé `inteligencia.md` si se confirmó un hecho, aprendizaje, riesgo o error.
[ ] Actualicé el registro de riesgos si apareció un riesgo o cambió su impacto.
[ ] Creé/actualicé ADR si se tomó una decisión estructural.
[ ] Creé/actualicé runbook si el fallo necesita respuesta operativa repetible.
```

---

## 10. Historial de cambios

| Fecha | Cambio | Responsable |
|---|---|---|
| YYYY-MM-DD | Creación del plan heredado desde Vibe System Core | [rol] |
