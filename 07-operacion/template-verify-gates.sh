#!/usr/bin/env bash
# verify-gates.sh — Suite de verificación determinista [NOMBRE-DEL-PROYECTO]
# Plantilla heredada de Vibe System Core (07-operacion/verify-gates.sh).
# Ejecuta los gates documentales como comandos reproducibles con código de salida.
# Uso: bash 07-operacion/verify-gates.sh
# Referencias: ADR-004 (límites escalonados), ADR-005 (topología), convenciones.md (prefijos), PAR-06 (secretos).
set -u
FAILS=0
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

# ── Parámetros del proyecto (edítalos una sola vez al arrancar) ──────────────
PROYECTO="[NOMBRE-DEL-PROYECTO]"          # Nombre corto del proyecto
DOCS_NORMATIVOS="00-control/convenciones.md 00-control/definition-of-ready.md 00-control/definition-of-done.md"  # Archivos con techo ≤600 (ADR-004); añade aquí los tuyos
# Topología: el listado de 16 carpetas está en el gate G5 (ajústalo solo si tu proyecto deriva con ADR propio)

pass() { printf '  [PASS] %s\n' "$1"; }
fail() { printf '  [FAIL] %s\n' "$1"; FAILS=$((FAILS+1)); }

echo "== $PROYECTO — Verificación determinista de gates =="

# G1 — Sin enlaces absolutos file:/// funcionales
N=$(grep -rE ']\(file:///' --include='*.md' . 2>/dev/null | grep -v '.freebuff' | wc -l)
[ "$N" -eq 0 ] && pass "G1 enlaces file:/// = 0" || fail "G1 enlaces file:/// = $N (esperado 0)"

# G2 — Sin vocabulario heredado del core (glosario limpio)
N=$(grep -r -i -E 'Vibe System Core|victoria|jugador|desempate|T-GAME|PM-[0-9]' 00-control/glosario*.md 2>/dev/null | wc -l)
[ "$N" -eq 0 ] && pass "G2 glosario sin vocabulario heredado" || fail "G2 archivos de glosario con residuo = $N"

# G3 — Sin referencias colgantes en docs activos
N=$(grep -rlE 'planmaestro\.md|`arquitectura\.md`|matriz-trazabilidad\.md' --include='*.md' . 2>/dev/null | grep -v '.freebuff' | grep -vE 'bitacora\.md|11-auditorias|RELEASE-NOTES|convenciones\.md' | wc -l)
[ "$N" -eq 0 ] && pass "G3 sin referencias colgantes activas" || fail "G3 documentos con referencias colgantes = $N"

# G4 — Techos de líneas por archivo (ADR-004: ≤600 normativos, por archivo)
BAD=""
for f in $DOCS_NORMATIVOS 00-control/glosario*.md 07-operacion/verify-gates.sh; do
  [ -f "$f" ] || continue
  L=$(wc -l < "$f" 2>/dev/null || echo 0)
  if [ "$L" -gt 600 ]; then BAD="$BAD $f($L)"; fi
done
[ -z "$BAD" ] && pass "G4 normativos dentro del techo (≤600 por archivo)" || fail "G4 sobre techo:$BAD"

# G5 — Topología canónica: 16 carpetas presentes
N=0
for d in 00-control 01-requisitos 02-decisiones 03-arquitectura 04-ia 05-ux 06-calidad 07-operacion 08-legal-y-confianza 09-riesgos 10-tests 11-auditorias 12-runbooks 13-investigacion 14-entregas fuentes-principales; do
  [ -d "$d" ] && N=$((N+1))
done
[ "$N" -eq 16 ] && pass "G5 topología 16/16 carpetas" || fail "G5 carpetas = $N/16"

# G6 — Cero secretos evidentes (PAR-06)
N=$(grep -r -i -l -E '(api[_-]?key|token|secret|password)\s*[:=]\s*["'"'"'][A-Za-z0-9_-]{16,}' --include='*.md' . 2>/dev/null | grep -v '.freebuff' | wc -l)
[ "$N" -eq 0 ] && pass "G6 sin secretos evidentes" || fail "G6 archivos con posibles secretos = $N"

# G7 — Git inicializado y árbol limpio (ADR-001)
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  if [ -z "$(git status --porcelain --untracked-files=normal | head -1)" ]; then
    pass "G7 Git activo y árbol limpio"
  else
    fail "G7 árbol Git sucio (commit o stash pendiente)"
  fi
else
  fail "G7 no es un repositorio Git"
fi

# G8 — Tríada de memoria activa
N=0
for f in fuentes-principales/agent.md fuentes-principales/inteligencia.md fuentes-principales/bitacora.md; do
  [ -s "$f" ] && N=$((N+1))
done
[ "$N" -eq 3 ] && pass "G8 tríada de memoria 3/3 presente" || fail "G8 tríada incompleta = $N/3"

# G9 — Prefijo de IDs del proyecto configurado (edítalo al arrancar)
PREFIJO="[PROJ]"
N=$(grep -c -E "\`T-${PREFIJO}-" 00-control/convenciones.md 2>/dev/null)
[ "$N" -ge 1 ] && pass "G9 prefijo de IDs ${PREFIJO} configurado en convenciones" || fail "G9 convenciones sin prefijo ${PREFIJO}"

# G10 — Memoria viva coherente: inteligencia registra el arranque del proyecto
N=$(grep -c -i "$PROYECTO" fuentes-principales/inteligencia.md 2>/dev/null)
[ "$N" -ge 1 ] && pass "G10 inteligencia.md registra el proyecto" || fail "G10 inteligencia.md sin mención del proyecto"

echo "== Resultado: $FAILS gate(s) fallidos (0 = sistema íntegro) =="
exit $([ "$FAILS" -eq 0 ] && echo 0 || echo 1)
