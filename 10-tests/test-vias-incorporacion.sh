#!/usr/bin/env bash
# test-vias-incorporacion.sh — Tests deterministas de las dos vías de incorporación de Vibe System.
#
# Vía A: proyecto desde cero  → init-vibe-project.sh → estructura, parámetros, gates y guardas.
# Vía B: proyecto heredado    → plantillas (auditoría E2E + plan de adecuación), orden audit→plan,
#                               y simulación de migración de código legado con gates en verde.
#
# Uso: bash 10-tests/test-vias-incorporacion.sh    → EXIT=0 todo verde; EXIT=1 con fallos.
# Referencias: ciclo-de-vida-de-proyecto.md §0-bis, D-010, init-vibe-project.sh, verify-gates.sh.
set -u
PASS=0; FAIL=0
CORE="$(cd "$(dirname "$0")/.." && pwd)"
cd "$CORE"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

pass() { printf '  [PASS] %s\n' "$1"; PASS=$((PASS+1)); }
fail() { printf '  [FAIL] %s\n' "$1"; FAIL=$((FAIL+1)); }

echo "== Vía A — Proyecto desde cero =="

# TVA-001 — El inicializador existe y su sintaxis bash es válida
if [ -f 07-operacion/init-vibe-project.sh ] && bash -n 07-operacion/init-vibe-project.sh 2>/dev/null; then
  pass "TVA-001 init-vibe-project.sh existe y su sintaxis es válida"
else
  fail "TVA-001 init-vibe-project.sh falta o tiene errores de sintaxis"
fi

# TVA-002 — Las 5 plantillas del starter-kit y de la Vía B existen
OK=1
for f in 07-operacion/template-verify-gates.sh 07-operacion/template-ci-verify-gates.yml \
         10-tests/template-plan-pruebas.md 11-auditorias/template-auditoria-codigo-heredado.md \
         01-requisitos/template-plan-adecuacion.md; do
  [ -f "$f" ] || OK=0
done
[ "$OK" -eq 1 ] && pass "TVA-002 las 5 plantillas (gates, CI, plan de pruebas, auditoría, adecuación) existen" \
               || fail "TVA-002 falta alguna plantilla requerida"

# TVA-003 — Init con prefijo explícito termina EXIT=0
PROJ_A="$WORK/mi-tienda"
if bash 07-operacion/init-vibe-project.sh mi-tienda TIED "$PROJ_A" >/dev/null 2>&1; then
  pass "TVA-003 init con prefijo explícito termina EXIT=0"
else
  fail "TVA-003 init con prefijo explícito falló"
fi

# TVA-004 — Estructura generada: 16 carpetas, tríada, CI, .env bloqueado, commit fundacional
if [ -d "$PROJ_A" ]; then
  N=0
  for d in 00-control 01-requisitos 02-decisiones 03-arquitectura 04-ia 05-ux 06-calidad \
           07-operacion 08-legal-y-confianza 09-riesgos 10-tests 11-auditorias 12-runbooks \
           13-investigacion 14-entregas fuentes-principales; do
    [ -d "$PROJ_A/$d" ] && N=$((N+1))
  done
  TRIAD=0
  for f in agent.md inteligencia.md bitacora.md; do
    [ -s "$PROJ_A/fuentes-principales/$f" ] && TRIAD=$((TRIAD+1))
  done
  if [ "$N" -eq 16 ] && [ "$TRIAD" -eq 3 ] \
     && [ -f "$PROJ_A/.github/workflows/verify-gates.yml" ] \
     && grep -q '^\.env$' "$PROJ_A/.gitignore" 2>/dev/null \
     && [ "$(git -C "$PROJ_A" rev-list --count HEAD 2>/dev/null)" = "1" ]; then
    pass "TVA-004 estructura generada: 16 carpetas, tríada, CI, .env bloqueado, commit fundacional"
  else
    fail "TVA-004 estructura incompleta (carpetas=$N/16, tríada=$TRIAD/3)"
  fi
else
  fail "TVA-004 el proyecto A no fue creado"
fi

# TVA-005 — Parámetros (nombre y prefijo) propagados
if grep -q 'PROYECTO="mi-tienda"' "$PROJ_A/07-operacion/verify-gates.sh" 2>/dev/null \
   && grep -q 'PREFIJO="TIED"' "$PROJ_A/07-operacion/verify-gates.sh" 2>/dev/null \
   && grep -q 'T-TIED-001' "$PROJ_A/00-control/convenciones.md" 2>/dev/null \
   && grep -q 'mi-tienda' "$PROJ_A/fuentes-principales/inteligencia.md" 2>/dev/null; then
  pass "TVA-005 nombre y prefijo propagados a gates, convenciones y tríada"
else
  fail "TVA-005 parámetros no propagados al proyecto generado"
fi

# TVA-006 — Gates del proyecto generado en verde
if [ -d "$PROJ_A" ] && bash "$PROJ_A/07-operacion/verify-gates.sh" >/dev/null 2>&1; then
  pass "TVA-006 gates del proyecto generado en verde (EXIT=0)"
else
  fail "TVA-006 gates del proyecto generado en rojo"
fi

# TVA-007 — Init sin prefijo: prefijo automático + gates verdes
PROJ_C="$WORK/control-ventas"
if bash 07-operacion/init-vibe-project.sh control-ventas "" "$PROJ_C" >/dev/null 2>&1 \
   && grep -q 'PREFIJO="CONT"' "$PROJ_C/07-operacion/verify-gates.sh" 2>/dev/null \
   && bash "$PROJ_C/07-operacion/verify-gates.sh" >/dev/null 2>&1; then
  pass "TVA-007 init sin prefijo: prefijo automático (CONT) y gates en verde"
else
  fail "TVA-007 init sin prefijo falló"
fi

# TVA-008 — Guarda: init rechaza destino no vacío
if bash 07-operacion/init-vibe-project.sh otra-cosa "" "$PROJ_A" >/dev/null 2>&1; then
  fail "TVA-008 init permitió un destino no vacío (guarda rota)"
else
  pass "TVA-008 init rechaza destino no vacío (guarda funciona)"
fi

# TVA-009 — Negativa: violación plantada en el derivado → gates EXIT=1
echo '[x](file:///c:/x.md)' > "$PROJ_A/99-neg.md"
if ! bash "$PROJ_A/07-operacion/verify-gates.sh" >/dev/null 2>&1; then
  pass "TVA-009 violación plantada en el derivado → gates EXIT=1"
else
  fail "TVA-009 los gates no detectaron la violación plantada"
fi
rm -f "$PROJ_A/99-neg.md"

# TVA-010 — Restauración → verde
if bash "$PROJ_A/07-operacion/verify-gates.sh" >/dev/null 2>&1; then
  pass "TVA-010 proyecto restaurado → gates EXIT=0"
else
  fail "TVA-010 el proyecto no volvió a verde tras limpiar"
fi

echo "== Vía B — Proyecto heredado =="

# TVB-001 — Plantilla de auditoría con estructura completa y regla cero-modificaciones
AUD=11-auditorias/template-auditoria-codigo-heredado.md
OK=1
for s in "## 2. Inventario E2E" "## 3. Evaluación por capas" "## 4. Hallazgos" \
         "## 5. Mapa de flujos críticos E2E" "Cero modificaciones de código" \
         "no se adecúa lo que no se conoce"; do
  grep -qF "$s" "$AUD" 2>/dev/null || OK=0
done
[ "$OK" -eq 1 ] && pass "TVB-001 plantilla de auditoría E2E completa (inventario, capas, hallazgos, flujos, cero-modificaciones)" \
               || fail "TVB-001 plantilla de auditoría incompleta"

# TVB-002 — Plantilla de plan de adecuación con fases 0–4, exclusiones y RSK-A01
PLA=01-requisitos/template-plan-adecuacion.md
OK=1
for s in "### Fase 0" "### Fase 1" "### Fase 2" "### Fase 3" "### Fase 4" \
         "## 3. Exclusiones temporales de gates" "RSK-A01"; do
  grep -qF "$s" "$PLA" 2>/dev/null || OK=0
done
[ "$OK" -eq 1 ] && pass "TVB-002 plan de adecuación con fases 0–4, exclusiones de gates y RSK-A01" \
               || fail "TVB-002 plan de adecuación incompleto"

# TVB-003 — Ciclo de vida con §0-bis (dos vías) y Etapa 0-B con gate
CIC=01-requisitos/ciclo-de-vida-de-proyecto.md
OK=1
for s in "## 0-bis. Dos vías de incorporación" "### Etapa 0-B" \
         "no creado por el sistema" "Fases de adecuación cerradas"; do
  grep -qF "$s" "$CIC" 2>/dev/null || OK=0
done
[ "$OK" -eq 1 ] && pass "TVB-003 ciclo de vida define las dos vías y la Etapa 0-B con gate" \
               || fail "TVB-003 ciclo de vida sin las dos vías o sin Etapa 0-B"

# TVB-004 — Las 3 piezas documentales dentro del techo de 600 líneas (ADR-004)
BAD=""
for f in "$AUD" "$PLA" "$CIC"; do
  L=$(wc -l < "$f" 2>/dev/null || echo 0)
  [ "$L" -gt 600 ] && BAD="$BAD $f($L)"
done
[ -z "$BAD" ] && pass "TVB-004 plantillas Vía B dentro del techo (≤600 por archivo)" \
             || fail "TVB-004 sobre techo:$BAD"

# TVB-005 — Orden obligatorio: auditoría → plan (referencias cruzadas en la dirección correcta)
if grep -qF "template-plan-adecuacion.md" "$AUD" 2>/dev/null \
   && grep -qF "template-auditoria-codigo-heredado.md" "$PLA" 2>/dev/null \
   && grep -qF "Precondición" "$PLA" 2>/dev/null; then
  pass "TVB-005 orden audit→plan codificado: la auditoría apunta al plan y el plan exige la auditoría como precondición"
else
  fail "TVB-005 el orden audit→plan no está codificado en las plantillas"
fi

# TVB-006 — Descubribilidad: README del core indexa ambas plantillas
if grep -qF "template-auditoria-codigo-heredado.md" README.md 2>/dev/null \
   && grep -qF "template-plan-adecuacion.md" README.md 2>/dev/null; then
  pass "TVB-006 README indexa las dos plantillas de la Vía B"
else
  fail "TVB-006 README no indexa las plantillas de la Vía B"
fi

# TVB-007 — Método de auditoría: detecta secreto heredado en código (no solo .md)
LEG="$WORK/legado"
mkdir -p "$LEG/src"
printf 'API_KEY="supersecret1234567890"\n' > "$LEG/src/config.py"
printf '# App Legada\n' > "$LEG/README.md"
if grep -r -i -l -E 'api[_-]?key[[:space:]]*[:=][[:space:]]*"[A-Za-z0-9_-]{16,}"' "$LEG" 2>/dev/null | grep -q .; then
  pass "TVB-007 el método de auditoría detecta secretos heredados en código (config.py)"
else
  fail "TVB-007 el método de auditoría no detectó el secreto plantado"
fi

# TVB-008 — Migración: código legado dentro de un proyecto Vibe → gates en verde
PROJ_B="$WORK/tienda-heredada"
if bash 07-operacion/init-vibe-project.sh tienda-heredada THER "$PROJ_B" >/dev/null 2>&1; then
  mkdir -p "$PROJ_B/src"
  cp "$LEG/src/config.py" "$PROJ_B/src/"
  cp "$LEG/README.md" "$PROJ_B/LEEME-LEGADO.md"
  git -C "$PROJ_B" add -A
  git -C "$PROJ_B" -c user.name=test -c user.email=test@local commit -qm "feat: migrar código legado (THER-001)"
  if bash "$PROJ_B/07-operacion/verify-gates.sh" >/dev/null 2>&1; then
    pass "TVB-008 código heredado migrado al árbol Vibe → gates en verde (el legado no rompe el sistema)"
  else
    fail "TVB-008 los gates fallaron con el código legado migrado"
  fi
else
  fail "TVB-008 el init del proyecto B falló"
fi

# TVB-009 — Negativa: secreto heredado en un .md del proyecto → gates EXIT=1 → restauración
printf '\nAPI_KEY="secreto-heredado-0987654321"\n' >> "$PROJ_B/LEEME-LEGADO.md"
if ! bash "$PROJ_B/07-operacion/verify-gates.sh" >/dev/null 2>&1; then
  pass "TVB-009 secreto en .md del proyecto adoptado → gates EXIT=1"
else
  fail "TVB-009 los gates no detectaron el secreto en .md"
fi
git -C "$PROJ_B" checkout -- LEEME-LEGADO.md
if bash "$PROJ_B/07-operacion/verify-gates.sh" >/dev/null 2>&1; then
  pass "TVB-010 proyecto B restaurado → gates EXIT=0"
else
  fail "TVB-010 el proyecto B no volvió a verde"
fi

echo "== Resultado: $FAIL test(s) fallidos de $((PASS+FAIL)) (0 = vías íntegras) =="
exit $([ "$FAIL" -eq 0 ] && echo 0 || echo 1)
