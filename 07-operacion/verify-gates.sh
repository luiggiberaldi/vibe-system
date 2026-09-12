#!/usr/bin/env bash
# verify-gates.sh — Suite de verificación determinista de Vibe System Core
# Ejecuta los gates documentales como comandos reproducibles con código de salida.
# Uso: bash 07-operacion/verify-gates.sh
# Referencias: AUD-VS-002 §3 (evidencia E1–E10), RSK-007, ADR-004, ADR-005, PAR-03.
set -u
FAILS=0
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

pass() { printf '  [PASS] %s\n' "$1"; }
fail() { printf '  [FAIL] %s\n' "$1"; FAILS=$((FAILS+1)); }

echo "== Vibe System Core — Verificación determinista de gates =="

# G1 — Sin enlaces absolutos file:/// funcionales (AUD-002)
N=$(grep -rE ']\(file:///' --include='*.md' . 2>/dev/null | grep -v '.freebuff' | wc -l)
[ "$N" -eq 0 ] && pass "G1 enlaces file:/// = 0" || fail "G1 enlaces file:/// = $N (esperado 0)"

# G2 — Sin vocabulario de juego en el glosario (AUD-001)
N=$(grep -r -i -c -E 'victoria|jugador|desempate|T-GAME|PM-[0-9]' 00-control/glosario*.md 2>/dev/null | grep -v ':0' | wc -l)
[ "$N" -eq 0 ] && pass "G2 glosario sin vocabulario de juego" || fail "G2 archivos de glosario con residuo = $N"

# G3 — Sin menciones activas de 05-seguridad (AUD-003 / ADR-005)
N=$(grep -rl '05-seguridad' --include='*.md' . 2>/dev/null | grep -v '.freebuff' | grep -vE 'AUD-VS-001|AUD-VS-002|ADR-005|plan-de-fixeo' | wc -l)
[ "$N" -eq 0 ] && pass "G3 sin 05-seguridad activa" || fail "G3 documentos con 05-seguridad activa = $N"

# G4 — Sin referencias colgantes en docs activos (AUD-006)
N=$(grep -rlE 'planmaestro\.md|`arquitectura\.md`|matriz-trazabilidad\.md' --include='*.md' . 2>/dev/null | grep -v '.freebuff' | grep -vE 'bitacora\.md|11-auditorias|plan-de-fixeo|RELEASE-NOTES-v1\.1\.0|convenciones\.md' | wc -l)
[ "$N" -eq 0 ] && pass "G4 sin referencias colgantes activas" || fail "G4 documentos con referencias colgantes = $N"

# G5 — Sin IDs colgantes PM-*, T-GAME-* en docs de control y requisitos activos (AUD-001)
N=$(grep -rlE 'T-GAME-[0-9]|(^|[^A-Z-])PM-[0-9]' --include='*.md' 00-control 01-requisitos README.md 2>/dev/null | grep -vE 'plan-de-fixeo|estados-del-trabajo\.md|glosario-operacion\.md' | wc -l)
[ "$N" -eq 0 ] && pass "G5 sin IDs colgantes PM-*/T-GAME-* en control y requisitos" || fail "G5 documentos con IDs colgantes = $N"

# G6 — Normativos dentro del techo por archivo (ADR-004: ≤600 líneas c/u).
# Exenciones permanentes (deuda documental registrada en AUD-VS-001, pendiente ADR de refactor):
# convenciones/DoR/DoD/estados son heredados de v1.0.0; se regulan pero no bloquean el gate.
BAD=""
EXC="00-control/convenciones.md 00-control/definition-of-done.md 00-control/definition-of-ready.md 00-control/estados-del-trabajo.md"
for f in 00-control/glosario*.md 00-control/template-*.md 00-control/pre-commit-gate-checklist.md \
         01-requisitos/*.md 02-decisiones/ADR-*.md fuentes-principales/agent.md \
         07-operacion/verify-gates.sh 07-operacion/template-verify-gates.sh \
         07-operacion/init-vibe-project.sh 10-tests/template-*.md \
         11-auditorias/template-*.md 12-runbooks/template-runbook.md \
         .github/workflows/verify-gates.yml; do
  [ -f "$f" ] || continue
  L=$(wc -l < "$f" 2>/dev/null || echo 0)
  if [ "$L" -gt 600 ]; then BAD="$BAD $f($L)"; fi
done
[ -z "$BAD" ] && pass "G6 normativos dentro del techo (≤600 por archivo)" || fail "G6 sobre techo:$BAD"
# Sub-gate informativo: deuda heredada visible sin romper el build
DEU=""
for f in $EXC; do
  L=$(wc -l < "$f" 2>/dev/null || echo 0)
  [ "$L" -gt 600 ] && DEU="$DEU $f($L)"
done
[ -n "$DEU" ] && printf '  [WARN] deuda heredada sobre techo (no bloquea):%s\n' "$DEU"

# G7 — ADR-004 y ADR-005 aceptadas
N=$(grep -l '^> \*\*Estado:\*\* ACEPTADA' 02-decisiones/ADR-004-*.md 02-decisiones/ADR-005-*.md 2>/dev/null | wc -l)
[ "$N" -eq 2 ] && pass "G7 ADR-004 y ADR-005 aceptadas" || fail "G7 ADRs nuevas no aceptadas = $N/2"

# G8 — Topología canónica: 16 carpetas presentes (ADR-005)
N=0
for d in 00-control 01-requisitos 02-decisiones 03-arquitectura 04-ia 05-ux 06-calidad 07-operacion 08-legal-y-confianza 09-riesgos 10-tests 11-auditorias 12-runbooks 13-investigacion 14-entregas fuentes-principales; do
  [ -d "$d" ] && N=$((N+1))
done
[ "$N" -eq 16 ] && pass "G8 topología 16/16 carpetas" || fail "G8 carpetas = $N/16"

# G9 — Cero secretos evidentes (PAR-06)
N=$(grep -r -i -l -E '(api[_-]?key|token|secret|password)\s*[:=]\s*["'"'"'"][A-Za-z0-9_-]{16,}' --include='*.md' . 2>/dev/null | grep -v '.freebuff' | wc -l)
[ "$N" -eq 0 ] && pass "G9 sin secretos evidentes" || fail "G9 archivos con posibles secretos = $N"

# G10 — Estados normativos: PAR-04 remite a estados-del-trabajo (AUD-003 menor / flujo)
N=$(grep -c 'estados-del-trabajo.md' 01-requisitos/parametros-del-sistema.md 2>/dev/null)
[ "$N" -ge 1 ] && pass "G10 PAR-04 remite a estados-del-trabajo.md" || fail "G10 PAR-04 sin remisión al documento de autoridad"

# G11 — Índice README apunta a los ADRs y auditorías recientes
N=$(grep -c -E 'ADR-004-limites-escalonados|AUD-VS-002-recertificacion' README.md)
[ "$N" -ge 2 ] && pass "G11 README indexa ADR-004 y AUD-VS-002" || fail "G11 README sin entradas nuevas = $N"

# G12 — Memoria viva coherente: inteligencia registra la re-certificación
N=$(grep -c 'AUD-VS-002' fuentes-principales/inteligencia.md 2>/dev/null)
[ "$N" -ge 1 ] && pass "G12 inteligencia.md refleja AUD-VS-002" || fail "G12 inteligencia.md desactualizada"

echo "== Resultado: $FAILS gate(s) fallidos (0 = sistema íntegro) =="
exit $([ "$FAILS" -eq 0 ] && echo 0 || echo 1)
