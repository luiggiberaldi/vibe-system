# Plan de Adecuación a Vibe System — [NOMBRE-DEL-PROYECTO]

> **Estado:** PLANTILLA
> **Tipo:** plan de incorporación de un proyecto heredado al gobierno de Vibe System (Vía B, paso 2)
> **Precondición:** [auditoría E2E de código heredado](../11-auditorias/template-auditoria-codigo-heredado.md) APROBADA — citar su fecha y hallazgos críticos aquí
> **Responsable:** Luigi
> **Relacionado con:** ciclo-de-vida-de-proyecto.md (Etapa 0-B), verify-gates.sh, paquete-inicial-de-proyecto.md
> **Versión:** 0.1.0
> **Creado:** YYYY-MM-DD
> **Última actualización:** YYYY-MM-DD

---

## 0. Para qué sirve esta plantilla

Convierte el diagnóstico de la auditoría heredada en un **plan por fases** para dejar el proyecto gobernado por Vibe System: memoria viva, gates deterministas, flujo DoR/DoD y trazabilidad — **sin frenar la operación** si el proyecto está en producción.

> **Regla central:** la adecuación es incremental y por fases. El proyecto sigue funcionando entre fase y fase; nada de "gran rewrite".

---

## 1. Línea de base (resumen de la auditoría)

| Campo | Valor |
|---|---|
| Fecha de auditoría E2E | [enlace al documento en 11-auditorias/] |
| Resultado | APROBADA / APROBADA CON ACCIONES URGENTES |
| Hallazgos críticos/altos que condicionan | [AH-xxx: resumen] |
| Flujos críticos mapeados | [nº] (FLUJO-001…nnn) |
| Estado de pruebas heredadas | [ninguna / parciales / buena] |

---

## 2. Fases de adecuación

Cada fase es independiente, terminable en 1–3 sesiones y termina en gates verdes + bitácora. No se inicia la siguiente sin cerrar la anterior (DoD).

### Fase 0 — Contención (solo si la auditoría halló críticos)
- [ ] Secretos expuestos rotados y movidos a variables de entorno.
- [ ] Backup verificado de datos y código (repo espejado).
- **Salida:** críticos mitigados, registrados en bitácora y riesgos.

### Fase 1 — Gobierno documental mínimo
- [ ] Inicializar estructura Vibe con `init-vibe-project.sh` en un directorio aparte y trasladar el código heredado al árbol (o init directo sobre el repo, previo backup).
- [ ] Configurar convenciones (prefijo de IDs del proyecto) y estados del flujo.
- [ ] Sembrar tríada: `agent.md` con reglas de trabajo, `inteligencia.md` con los hechos (F-) de la auditoría, `bitacora.md` con la entrada de adopción.
- [ ] Registrar la deuda heredada como `RSK-` en el registro de riesgos.
- **Salida:** gates `verify-gates.sh` en verde **excepto** los gates que el legado aún no pueda pasar (registrar cuáles y por qué en la sección 3).

### Fase 2 — Red de seguridad
- [ ] Reproducir local: build + arranque documentado en `12-runbooks/`.
- [ ] Pruebas de regresión de los flujos críticos FLUJO-001…nnn (mínimo 1 prueba por flujo) en `10-tests/`.
- [ ] CI con `verify-gates.yml` + pruebas de regresión en cada push.
- **Salida:** todo cambio futuro detecta roturas de flujos críticos automáticamente.

### Fase 3 — Higiene y trazabilidad
- [ ] Un commit por tarea `T-PREF-nnn`; ningún cambio sin ID.
- [ ] Secretos fuera del repo; `.env.example` documentado.
- [ ] Archivos monstruo (>600 líneas) identificados; dividir **solo los que se tocan a menudo** (los demás quedan como deuda documentada).
- **Salida:** gates completos en verde, sin exclusiones.

### Fase 4 — Operación Vibe plena
- [ ] Flujo DoR → EN-PROGRESO → DoD → gates → bitácora como único modo de trabajo.
- [ ] Roadmap de mejora del legado priorizado en `01-requisitos/` (opcional, según ambition del proyecto).
- **Salida:** el proyecto heredado se gestiona igual que uno nacido en Vibe. Etapa 0-B CERRADA → continúa ciclo de vida normal.

---

## 3. Exclusiones temporales de gates

Registrar aquí cualquier gate que el legado no pueda pasar todavía. Cada exclusión tiene dueño y fecha de revisión; una exclusión sin plan de salida no se aprueba.

| Gate excluido | Motivo | Plan de salida | Revisión | Estado |
|---|---|---|---|---|
| G-x | | | YYYY-MM-DD | VIGENTE |

---

## 4. Riesgos de la propia adecuación

| ID | Riesgo | Mitigación |
|---|---|---|
| RSK-A01 | La adecuación rompe un flujo crítico en producción | Fase 2 antes de refactorizar; pruebas de regresión primero |
| RSK-A02 | Boicot invisible: el equipo/IA salta el flujo por prisa | Gates en CI; commits sin ID rechazados |
| RSK-A03 | Sobre-adecuación: gobernar código muerto | Solo se divide/refactoriza lo que se toca |

---

## 5. Criterio de salida (Etapa 0-B cerrada)

```text
[ ] Fases 1–4 cerradas (Fase 0 si aplicó) con bitácora al día.
[ ] verify-gates.sh en verde, sin exclusiones vigentes (o con plan de salida aprobado).
[ ] CI activo en el repositorio del proyecto.
[ ] Tríada viva: la última sesión está registrada y los hechos de la auditoría están en inteligencia.
[ ] Luigi declara cerrada la Etapa 0-B.
```

### Resultado final

```text
[ ] ADECUACIÓN COMPLETA
[ ] ADECUACIÓN PARCIAL ACEPTADA (justificar y listar exclusiones)
[ ] BLOQUEADA (volver a auditoría)
```

### Siguiente paso único

[Primera tarea del ciclo de vida normal, p. ej. "T-XXX-001: definir REQ del próximo hito"]

---

## 6. Historial de cambios

| Fecha | Cambio | Responsable |
|---|---|---|
| YYYY-MM-DD | Creación del plan de adecuación | [rol] |
