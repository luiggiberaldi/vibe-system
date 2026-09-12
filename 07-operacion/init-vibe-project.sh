#!/usr/bin/env bash
# init-vibe-project.sh — Arranque de un proyecto derivado con un solo comando.
# Crea el árbol canónico de 16 carpetas, siembra la tríada de memoria y los
# documentos de control compactos, instala la suite de gates parametrizada,
# el workflow de CI, hace el commit fundacional y valida con la suite.
#
# Uso:
#   bash init-vibe-project.sh <nombre-proyecto> [prefijo] [destino]
#
#   <nombre-proyecto>  Nombre corto del proyecto (obligatorio). Ej: "mi-tienda"
#   [prefijo]          Prefijo de IDs (default: 4 caracteres del nombre). Ej: "TIED"
#   [destino]          Carpeta destino (default: ./<nombre-proyecto>)
#
# Referencias: paquete-inicial-de-proyecto.md, guia-de-arranque-de-nuevo-proyecto.md,
# template-verify-gates.sh, template-plan-pruebas.md, D-008.
set -euo pipefail

NOMBRE="${1:-}"
PREFIJO="${2:-}"
DESTINO="${3:-}"

if [ -z "$NOMBRE" ]; then
  echo "Uso: bash init-vibe-project.sh <nombre-proyecto> [prefijo] [destino]"
  exit 1
fi
if [ -z "$PREFIJO" ]; then
  PREFIJO="$(printf '%s' "$NOMBRE" | tr -cd '[:alnum:]' | cut -c1-4 | tr '[:lower:]' '[:upper:]')"
fi
if [ -z "$DESTINO" ]; then
  DESTINO="./$NOMBRE"
fi

CORE="$(cd "$(dirname "$0")/.." && pwd)"
DATE="$(date +%Y-%m-%d)"

if [ -e "$DESTINO" ] && [ -n "$(ls -A "$DESTINO" 2>/dev/null)" ]; then
  echo "ERROR: el destino '$DESTINO' ya existe y no está vacío."
  exit 1
fi

echo "== Inicializando proyecto '$NOMBRE' (prefijo $PREFIJO) en $DESTINO =="
mkdir -p "$DESTINO"

# ── 1. Árbol canónico de 16 carpetas (con anclas: Git no versiona vacías) ────
for d in 00-control 01-requisitos 02-decisiones 03-arquitectura 04-ia 05-ux \
         06-calidad 07-operacion 08-legal-y-confianza 09-riesgos 10-tests \
         11-auditorias 12-runbooks 13-investigacion/borradores 14-entregas \
         fuentes-principales; do
  mkdir -p "$DESTINO/$d"
done

anchor() { # anchor <carpeta-vacía> — README ancla para que Git/CI conserven la carpeta
  local d="$1"
  if [ -z "$(ls -A "$DESTINO/$d" 2>/dev/null)" ]; then
    seed "$d/README.md" <<EOF
# $d

Carpeta canónica de @PROYECTO@ (topología Vibe System). Contenido pendiente; este archivo ancla la carpeta en Git (lección F-011 del core: las carpetas vacías no se versionan).
EOF
  fi
}

seed() { # seed <ruta-relativa>  (lee de stdin, sustituye @PROYECTO@ @PREFIJO@ @FECHA@)
  local rel="$1"
  sed -e "s/@PROYECTO@/$NOMBRE/g" -e "s/@PREFIJO@/$PREFIJO/g" -e "s/@FECHA@/$DATE/g" \
    > "$DESTINO/$rel"
}

for d in 01-requisitos 03-arquitectura 04-ia 05-ux 06-calidad \
         08-legal-y-confianza 13-investigacion 14-entregas; do
  anchor "$d"
done

# ── 2. Documentos de control compactos (semillas, ≤600 líneas, ADR-004) ──────
seed 00-control/convenciones.md <<'EOF'
# Convenciones — @PROYECTO@

> **Estado:** ACTIVO
> **Propósito:** nombres, IDs, rutas y reglas de Git del proyecto @PROYECTO@.
> **Responsable:** Luigi · **Creado:** @FECHA@

## Identificadores

| Tipo | Prefijo | Ejemplo |
|---|---|---|
| Tarea | `T-` | `T-@PREFIJO@-001` |
| Requisito | `REQ-` | `REQ-001` |
| Decisión | `D-` | `D-001` |
| Riesgo | `RSK-` | `RSK-001` |
| Aprendizaje | `L-` | `L-001` |
| Hecho verificado | `F-` | `F-001` |
| ADR | `ADR-[nnn]-[nombre].md` | `ADR-001-...md` |

## Reglas de oro

1. Formato Markdown versionado en Git; fechas ISO `YYYY-MM-DD`.
2. Enlaces internos **siempre relativos** (nunca rutas absolutas locales).
3. Documentos normativos ≤600 líneas por archivo (rotación a anexos si crecen).
4. Todo commit referencia al menos un ID (p. ej. `T-@PREFIJO@-001: ...`).
5. Pasos irreversibles (push, tag, deploy, borrados) requieren confirmación humana.
6. Estados de trabajo: ver [estados-del-trabajo.md](estados-del-trabajo.md).
7. Verificación obligatoria pre-push: `bash 07-operacion/verify-gates.sh` (EXIT=0).
EOF

seed 00-control/estados-del-trabajo.md <<'EOF'
# Estados del Trabajo — @PROYECTO@

> **Estado:** ACTIVO · **Fuente de verdad:** sí, para el flujo de tareas · **Creado:** @FECHA@

| Estado | Significado | Salida permitida |
|---|---|---|
| `PROPUESTA` | Idea por definir; pasa DoR antes de iniciarse | `EN-PROGRESO`, `DESCARTADA` |
| `EN-PROGRESO` | Trabajo activo según DoR | `EN-REVISION`, `BLOQUEADO` |
| `EN-REVISION` | Esperando verificación (DoD + gates) | `HECHO`, `EN-PROGRESO` |
| `BLOQUEADO` | Con obstáculo registrado y dueño asignado | `EN-PROGRESO`, `DESCARTADA` |
| `HECHO` | Cumple DoD y gates en verde; cierre registrado en bitácora | — |
| `DESCARTADA` | Cerrada sin ejecutar, con motivo registrado | — |

Regla: ninguna tarea pasa a `HECHO` con `verify-gates.sh` en rojo.
EOF

seed 00-control/definition-of-ready.md <<'EOF'
# Definition of Ready — @PROYECTO@

> **Estado:** ACTIVO · **Creado:** @FECHA@

Una tarea puede iniciarse cuando:

- [ ] Tiene ID asignado (`T-@PREFIJO@-nnn`) y título claro.
- [ ] Describe el resultado esperado y su criterio de verificación.
- [ ] Su alcance cabe en una sesión de trabajo.
- [ ] Dependencias y riesgos evidentes están identificados (`RSK-`).
- [ ] La bitácora tiene sesión abierta para este trabajo.
EOF

seed 00-control/definition-of-done.md <<'EOF'
# Definition of Done — @PROYECTO@

> **Estado:** ACTIVO · **Creado:** @FECHA@

Una tarea está hecha cuando:

- [ ] Cumple su criterio de verificación del DoR.
- [ ] `bash 07-operacion/verify-gates.sh` termina en verde (EXIT=0).
- [ ] La documentación afectada quedó actualizada (bitácora, inteligencia si aplica).
- [ ] El commit referencia el ID de la tarea.
- [ ] No quedan archivos temporales ni secretos en el árbol.
EOF

seed 00-control/glosario.md <<'EOF'
# Glosario — @PROYECTO@

> **Estado:** ACTIVO · **Propósito:** vocabulario común del proyecto · **Creado:** @FECHA@

| Término | Definición |
|---|---|
| Venta fiada | Venta registrada a crédito de un cliente, con saldo pendiente |
| Saldo | Monto pendiente de cobro de un cliente |
| Gate | Verificación determinista con código de salida (PASS/FAIL) |

> Regla: un término nuevo se define aquí antes de usarse en 2+ documentos.
> El glosario se divide en módulos (`glosario-*.md`) si supera ~500 líneas.
EOF

# ── 3. Tríada de memoria (fuentes-principales) ───────────────────────────────
seed fuentes-principales/agent.md <<'EOF'
# Reglas de Trabajo para IA — @PROYECTO@

> **Estado:** ACTIVO · **Versión:** 0.1.0 · **Creado:** @FECHA@

1. **Autoridad:** Luigi decide; la IA propone y ejecuta lo reversible. Lo irreversible (push, tag, deploy, borrados) requiere confirmación explícita.
2. **Memoria:** iniciar toda sesión leyendo la última entrada de `bitacora.md` y `inteligencia.md`. Cerrar toda sesión registrando entrada en bitácora.
3. **Verdad:** no inventar datos; verificar con comandos y citar evidencia. Dudas registradas como `Q-` o `SUP-`, nunca resueltas por intuición.
4. **Gates:** antes de cerrar cualquier tarea, `bash 07-operacion/verify-gates.sh` en verde (EXIT=0).
5. **DoR/DoD:** no iniciar sin DoR cumplido; no cerrar sin DoD cumplido.
6. **Límites:** documentos normativos ≤600 líneas; enlaces relativos; un término nuevo pasa por el glosario.
7. **Mejora continua:** todo error nuevo genera `L-` (aprendizaje) o `RSK-` (riesgo) en inteligencia/riesgos.
EOF

seed fuentes-principales/inteligencia.md <<'EOF'
# Memoria del Sistema — @PROYECTO@

> **Estado:** ACTIVO · **Versión:** 0.1.0 · **Creado:** @FECHA@

## 1. Resumen ejecutivo

@PROYECTO@ es un proyecto asistido por IA gobernado con Vibe System. Completar estos 2 párrafos en la primera sesión: qué se construye, resultado esperado de la fase inicial y límites críticos.

## 2. Decisiones vigentes

| ID | Tipo | Decisión | Justificación | Origen | Fecha | Estado |
|---|---|---|---|---|---|---|
| D-001 | Fundación | @PROYECTO@ adopta Vibe System como sistema de gobierno documental | Verificación determinista y memoria viva desde el día 0 | init @FECHA@ | @FECHA@ | VIGENTE |

## 3. Hechos verificados

| ID | Tipo | Hecho | Evidencia | Fecha | Confianza | Estado |
|---|---|---|---|---|---|---|
| F-001 | HECHO_VERIFICADO | Proyecto inicializado con árbol canónico y suite de gates en verde | `bash 07-operacion/verify-gates.sh` EXIT=0 | @FECHA@ | Alta | ACTIVO |

## 4. Historial de cambios

| Versión | Fecha | Cambio | Responsable |
|---|---|---|---|
| 0.1.0 | @FECHA@ | Inicialización del proyecto con Vibe System | init |
EOF

seed fuentes-principales/bitacora.md <<'EOF'
# Bitácora — @PROYECTO@

> **Estado:** ACTIVO · **Tipo:** historial cronológico de sesiones · **Creado:** @FECHA@
> **Regla de oro:** si una sesión cambió un documento, parámetro, flujo o decisión, queda registrada antes de concluir.
> **Anexos:** las entradas antiguas rotan a `bitacora-anexos/` cuando este archivo supere ~600 líneas.

## 1. Entradas cronológicas

## @FECHA@ — Inicialización de @PROYECTO@ con Vibe System

- Estado de sesión: CERRADA
- Responsable: Luigi
- Objetivo: arrancar el proyecto con gobierno documental y verificación determinista.

### Hecho
- Árbol canónico de 16 carpetas creado.
- Tríada de memoria sembrada y suite de gates instalada y parametrizada (prefijo @PREFIJO@).
- Commit fundacional realizado.

### Siguiente acción
- Completar el resumen ejecutivo de `inteligencia.md` y definir las primeras tareas `T-@PREFIJO@-nnn`.

---

## 2. Protocolo de registro

Cada sesión: fecha + título, estado (INICIADA/EN PROGRESO/CERRADA/BLOQUEADA), responsable, objetivo, hecho, decisiones, siguiente acción.
EOF

seed README.md <<'EOF'
# @PROYECTO@

> Proyecto gobernado con [Vibe System](https://github.com/luiggiberaldi/vibe-system) · Iniciado: @FECHA@ · Prefijo de IDs: `@PREFIJO@`

## Verificación

```bash
bash 07-operacion/verify-gates.sh   # EXIT=0 = íntegro; obligatorio pre-push (también en CI)
```

## Estructura

- `fuentes-principales/` — tríada de memoria: `agent.md`, `inteligencia.md`, `bitacora.md`
- `00-control/` — convenciones, DoR/DoD, estados, glosario
- `02-decisiones/` — ADRs · `09-riesgos/` — riesgos `RSK-` · `10-tests/` — planes de pruebas
- `11-auditorias/` · `12-runbooks/` · `14-entregas/` — auditorías, procedimientos y releases

Primera tarea sugerida: completar el resumen ejecutivo de `fuentes-principales/inteligencia.md`.
EOF

# ── 4. Plantillas puras copiadas del core ────────────────────────────────────
cp "$CORE/00-control/template-issue.md"                 "$DESTINO/00-control/template-issue.md"
cp "$CORE/00-control/template-cambio-de-alcance.md"     "$DESTINO/00-control/template-cambio-de-alcance.md"
cp "$CORE/00-control/pre-commit-gate-checklist.md"      "$DESTINO/00-control/pre-commit-gate-checklist.md"
cp "$CORE/02-decisiones/ADR-000-template.md"            "$DESTINO/02-decisiones/ADR-000-template.md"
cp "$CORE/10-tests/template-tests.md"                   "$DESTINO/10-tests/template-tests.md"
cp "$CORE/10-tests/template-plan-pruebas.md"            "$DESTINO/10-tests/plan-pruebas.md"
cp "$CORE/11-auditorias/template-auditoria.md"          "$DESTINO/11-auditorias/template-auditoria.md"
cp "$CORE/12-runbooks/template-runbook.md"              "$DESTINO/12-runbooks/template-runbook.md"
sed -i -e "s/\[NOMBRE-DEL-PROYECTO\]/$NOMBRE/g" -e "s/@FECHA@/$DATE/g" \
  "$DESTINO/10-tests/plan-pruebas.md"

seed 09-riesgos/registro-riesgos.md <<'EOF'
# Registro de Riesgos — @PROYECTO@

> **Estado:** ACTIVO · **Creado:** @FECHA@

| ID | Riesgo | Probabilidad | Impacto | Severidad | Estado | Mitigación |
|---|---|---|---|---|---|---|
| RSK-001 | Pérdida de historial por falta de control de versiones | Baja | Alto | MEDIA | MITIGADO | Git + remote desde el día 0; gates en CI |
EOF

# ── 5. Suite de gates parametrizada + workflow de CI ─────────────────────────
sed -e "s/\[NOMBRE-DEL-PROYECTO\]/$NOMBRE/g" -e 's/PREFIJO="\[PROJ\]"/PREFIJO="'"$PREFIJO"'"/' \
  "$CORE/07-operacion/template-verify-gates.sh" > "$DESTINO/07-operacion/verify-gates.sh"
mkdir -p "$DESTINO/.github/workflows"
cp "$CORE/07-operacion/template-ci-verify-gates.yml" "$DESTINO/.github/workflows/verify-gates.yml"

# ── 6. Git: .gitignore + commit fundacional ─────────────────────────────────
seed .gitignore <<'EOF'
# Variables de entorno y secretos (INNEGOCIABLE)
.env
.env.local
.env.*.local
*.pem
*.key
credentials.json

# Dependencias y builds
node_modules/
dist/
build/
.venv/
__pycache__/

# Logs y temporales
*.log
*.tmp
*.bak
.DS_Store
Thumbs.db
.freebuff/
EOF

cd "$DESTINO"
git init -q -b main
git add -A
git -c user.name="${GIT_AUTHOR_NAME:-Luigi}" -c user.email="${GIT_AUTHOR_EMAIL:-luigi@local}" \
  commit -q -m "chore: inicialización de $NOMBRE bajo Vibe System (gates en verde)"

# ── 7. Validación con la suite ───────────────────────────────────────────────
echo "== Validación con la suite de gates =="
if bash 07-operacion/verify-gates.sh; then
  echo "== Proyecto '$NOMBRE' inicializado y verificado (EXIT=0) =="
else
  echo "== AVISO: gates en rojo tras el arranque; revisar los [FAIL] arriba =="
  exit 1
fi
