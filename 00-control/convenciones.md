# Convenciones del Sistema Documental — Vibe System

> **Estado:** ACTIVO  
> **Fuente de verdad para:** nombres, IDs, rutas, formato, lenguaje, versiones, fechas, referencias, archivos, futuras ramas/commits y actualización de documentos  
> **Relacionado con:** `estados-del-trabajo.md`, `definition-of-ready.md`, `definition-of-done.md`, `glosario.md`, `inteligencia.md`, `bitacora.md`  
> **Responsable:** Luigi  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-10  
> **Última actualización:** 2026-09-11  
> **Próxima revisión:** al crear la estructura local definitiva o antes de migrar el sistema a Git

---

## 0. Propósito

Estas convenciones permiten que todos los documentos, decisiones, riesgos, pruebas y tareas tengan nombres predecibles y referencias estables. El objetivo es que Luigi y la IA puedan encontrar, enlazar y actualizar información sin depender de memoria, nombres improvisados o búsquedas ambiguas.

> **Regla central:** si un elemento no tiene nombre, ID, estado, ubicación y responsable claros, todavía no forma parte controlada del sistema.

---

## 1. Principios de nomenclatura

1. **Consistencia antes que creatividad:** usar el mismo patrón siempre.
2. **Legibilidad antes que abreviaturas oscuras:** un nombre debe poder entenderse sin abrir el archivo.
3. **Estabilidad antes que perfección:** no renombrar archivos sin registrar la migración.
4. **Una fuente por concepto:** no crear varios documentos con nombres similares para el mismo propósito.
5. **Sin espacios ni caracteres especiales en rutas:** usar minúsculas y guiones medios.
6. **ID permanente:** un ID no se recicla, aunque el elemento sea rechazado o deprecado.
7. **Fechas ISO:** usar `YYYY-MM-DD` para ordenar sin ambigüedad.
8. **Idioma principal:** español claro y consistente; conservar términos técnicos estándar cuando mejoren precisión.
9. **Nombres neutrales:** no usar nombres de personas, secretos, datos privados o clientes en rutas públicas.
10. **Cambios trazables:** un renombre, movimiento o reemplazo debe dejar referencia al archivo anterior.

---

## 2. Estructura local de documentos

Mientras el proyecto no esté en Git, los documentos viven en una carpeta local raíz:

```text
sistema-proyectos/ (o el nombre de tu proyecto)
├── 00-control/
├── 01-requisitos/
├── 02-decisiones/
├── 03-arquitectura/
├── 04-ia/
├── 05-ux/
├── 06-calidad/
├── 07-operacion/
├── 08-legal-y-confianza/
├── 09-riesgos/
├── 10-tests/
├── 11-auditorias/
├── 12-runbooks/
├── 13-investigacion/
├── 14-entregas/
└── fuentes-principales/
```

### Regla de numeración de carpetas

- Los prefijos `00` a `14` definen orden lógico, no prioridad absoluta.
- No renumerar carpetas porque se agregue una nueva; usar una carpeta nueva con el número disponible o subcarpeta temática.
- `fuentes-principales/` contiene los documentos de contexto vivo y debe mantenerse separado de documentos especializados.

### Carpeta temporal

Si se necesita material provisional, usar:

```text
13-investigacion/borradores/
```

Reglas:

- Todo borrador debe tener fecha y responsable.
- Un borrador no es fuente de verdad.
- Un borrador se promueve a documento activo, se archiva o se elimina tras extraer aprendizajes.
- No usar carpetas llamadas `final`, `final-final`, `nuevo`, `varios` u `otros`.

---

## 3. Convención de nombres de archivos

### Patrón general

```text
[nombre-descriptivo].md
```

Ejemplos correctos:

```text
estados-del-trabajo.md
definition-of-ready.md
matriz-trazabilidad.md
reglas-negocio.md
registro-riesgos.md
runbook-ia-caida.md
pruebas-invariantes.md
```

Ejemplos incorrectos:

```text
Documento final.md
nuevo plan!!.md
PM 1 listo.md
cosas importantes.md
archivo(2).md
```

### Reglas obligatorias

- Usar minúsculas.
- Usar guiones medios (`-`) entre palabras.
- No usar espacios.
- No usar tildes, `ñ`, comillas, paréntesis, signos de interrogación ni puntuación en el nombre.
- Usar extensión `.md` para documentos Markdown.
- Usar nombre descriptivo y no genérico.
- Mantener un archivo por propósito principal.

### Prefijos por tipo

| Tipo | Patrón | Ejemplo |
|---|---|---|
| ADR | `ADR-[nnn]-[tema].md` | `ADR-001-stack-provisional.md` |
| Auditoría | `auditoria-[ambito].md` | `auditoria-H0.md` |
| Test | `tests-[dominio].md` | `tests-ia.md` |
| Runbook | `runbook-[escenario].md` | `runbook-doble-ganador.md` |
| Riesgo | `registro-riesgos.md` o `riesgo-[tema].md` | `riesgo-proveedor-ia.md` |
| Investigación | `investigacion-[tema].md` | `investigacion-proveedores-ia.md` |
| Decisión de producto | `decision-[tema].md` si no requiere ADR | `decision-monetizacion-beta.md` |
| Plantilla | `template-[tipo].md` | `template-runbook.md` |
| Acta | `acta-[tema]-[YYYY-MM-DD].md` | `acta-alpha-2026-09-10.md` |
| Release | `release-[version].md` | `release-v0-1-0.md` |
| Incidente | `incidente-[ID]-[tema].md` | `incidente-INC-001-pii-expuesta.md` |

### Nombres de fuentes principales

Estos nombres son fijos y no deben cambiarse sin ADR/documento de migración:

```text
README.md
agent.md
inteligencia.md
bitacora.md
planmaestro.md
arquitectura.md
roadmap.md
```

---

## 4. Convención de IDs

### Regla general

- Los IDs son únicos y permanentes.
- Nunca reutilizar un ID eliminado, rechazado o deprecado.
- El número se incrementa secuencialmente dentro de su tipo.
- Los IDs se escriben siempre en mayúscula.
- Las referencias cruzadas usan el ID exacto.

### Catálogo de IDs

| Tipo | Prefijo | Ejemplo | Uso |
|---|---|---|---|
| Hito | `H` | `H0`, `H4` | Etapa grande del roadmap |
| Epic | `E-` | `E-0`, `E-4` | Área de trabajo dentro de hito |
| Issue de epic | `E[n]-[nn]` | `E4-09` | Tarea ejecutable |
| Documento | `DOC-` | `DOC-CONTROL-001` | Documento importante si necesita trazabilidad |
| Requisito de negocio | `RB-` | `RB-006` | Regla/invariante de negocio |
| Requisito no funcional | `RNF-` | `RNF-003` | Rendimiento, seguridad, disponibilidad, etc. |
| Criterio de aceptación | `CA-` | `CA-008` | Resultado verificable |
| Decisión | `D-` | `D-009` | Decisión vigente del proyecto |
| ADR | `ADR-` | `ADR-004` | Decisión estructural documentada |
| Riesgo | `RSK-` | `RSK-003` | Riesgo de producto, seguridad, costo o legalidad |
| Deuda técnica | `DT-` | `DT-002` | Deuda registrada y controlada |
| Dependencia externa | `DEP-` | `DEP-001` | Proveedor, acceso, persona o condición externa |
| Pregunta pendiente | `Q-` | `Q-007` | Pregunta sin resolver |
| Supuesto | `SUP-` | `SUP-004` | Hipótesis pendiente de validar |
| Hecho verificado | `F-` | `F-011` | Hecho con fuente/evidencia |
| Aprendizaje | `L-` | `L-003` | Patrón confirmado por evidencia |
| Error conocido | `ERR-` | `ERR-001` | Problema con causa/prevención conocida |
| Incidente | `INC-` | `INC-001` | Evento operativo o de seguridad |
| Regla de UX | `UXR-` | `UXR-003` | Principio/requisito de experiencia |
| Evento de analítica | `EVT-` | `EVT-007` | Evento de producto/operación |
| Test general | `T-` | `T-GAME-003` | Prueba individual |
| Simulacro | `S-` | `S-004` | Simulación operativa o de incidente |
| Métrica | `M-` | `M-006` | Indicador de producto/sistema |
| Alerta | `AL-` | `AL-003` | Alerta operacional |
| Runbook | `RUN-` | `RUN-004` | Procedimiento de operación |
| Experimento | `EXP-` | `EXP-002` | Experimento UX/producto |
| Cohorte | `COH-` | `COH-ALPHA-001` | Grupo de testers |
| Feature flag | `FF-` | `FF-008` | Flag controlable de producto/sistema |
| Migración | `MIG-` | `MIG-001` | Cambio versionado de datos/esquema |
| Integración | `INT-` | `INT-002` | Proveedor/adaptador/integración |

### IDs de tests por dominio

Usar este patrón:

```text
T-[DOMINIO]-[nnn]
```

Dominios permitidos inicialmente:

| Dominio | Ejemplo | Uso |
|---|---|---|
| `CORE` | `T-CORE-001` | Lógica de negocio, reglas, validaciones |
| `IA` | `T-IA-003` | Adapter, timeout, filtros, red teaming |
| `PRIV` | `T-PRIV-001` | PII, consentimiento, sanitización |
| `AUTH` | `T-AUTH-002` | Autenticación, permisos, roles |
| `API` | `T-API-004` | Contratos y endpoints |
| `UX` | `T-UX-003` | Flujos y accesibilidad |
| `OPS` | `T-OPS-001` | Deploy, backup, rollback, flags |
| `SEC` | `T-SEC-002` | Secret scan, abuso, inyección |
| `DOC` | `T-DOC-001` | Enlaces, IDs, formato documental |

---

## 5. Convención de títulos

### Documentos

```md
# [Tipo] — [Tema]
```

Ejemplos:

```md
# Roadmap de Ejecución — [Proyecto]
# Estados del Trabajo — Vibe System
# Runbook — Caída del proveedor de IA
# ADR-001 — Selección de base de datos
```

### Issues

```text
[ID] — [Verbo en infinitivo] [objeto] [resultado opcional]
```

Ejemplos:

```text
E0-01 — Crear estructura documental local
E1-03 — Congelar configuración inmutable mediante hash
E4-09 — Gestionar timeout IA sin consumir intento
E6-07 — Probar restauración de backup con fixture
```

Evitar títulos como:

```text
Arreglar cosas
Mejoras
Sistema IA
Hacer lo necesario
Bug raro
```

### ADRs

```text
ADR-[nnn] — [Decisión, no tarea]
```

Ejemplos:

```text
ADR-001 — Usar monorepo para web, API y reglas compartidas
ADR-002 — Mantener la autoridad de victoria fuera del LLM
ADR-003 — Usar alias públicos y PII separada
```

---

## 6. Cabecera estándar de documentos

Todo documento activo debe comenzar con una cabecera de metadatos.

### Cabecera mínima

```md
> **Estado:** [BORRADOR / EN REVISIÓN / ACTIVO / PAUSADO / DEPRECADO / ARCHIVADO]
> **Fuente de verdad:** [Sí / No]
> **Responsable:** [nombre o rol]
> **Versión:** [x.y.z]
> **Creado:** [YYYY-MM-DD]
> **Última actualización:** [YYYY-MM-DD]
> **Próxima revisión:** [fecha o condición]
```

### Cabecera completa para documentos críticos

```md
> **Estado:** ACTIVO
> **Fuente de verdad:** Sí
> **Responsable:** Luigi
> **Clasificación:** INTERNA / CONFIDENCIAL
> **Versión:** 0.1.0
> **Creado:** YYYY-MM-DD
> **Última actualización:** YYYY-MM-DD
> **Próxima revisión:** al cerrar H[n] o antes de [condición]
> **Relacionado con:** `archivo-a.md`, `archivo-b.md`, [IDs]
> **No reemplaza:** [documentos que mantienen autoridad propia]
```

### Regla de cabecera

- `Estado` del documento no sustituye el estado de sus elementos internos.
- Un documento puede estar `ACTIVO` aunque contenga pendientes.
- Si cambia su contenido sustancial, actualizar versión y fecha.
- Si un documento deja de ser vigente, indicar reemplazo antes de marcar `DEPRECADO`.

---

## 7. Convención de versiones

Usar versión semántica simple:

```text
MAYOR.MENOR.PARCHE
```

| Cambio | Ejemplo | Uso |
|---|---|---|
| Mayor | `1.0.0 → 2.0.0` | Cambio que invalida estructura, reglas o interpretación anterior |
| Menor | `0.1.0 → 0.2.0` | Nueva sección, criterio, regla o capacidad compatible |
| Parche | `0.1.0 → 0.1.1` | Corrección de redacción, enlace, typo o aclaración sin cambiar significado |

### Ejemplos

```text
0.1.0  Documento inicial
0.2.0  Se agrega matriz de evidencia
0.2.1  Se corrige enlace a runbook
1.0.0  Se aprueba como fuente de verdad para H0
```

### Regla de cambio mayor

Si un cambio altera una decisión, regla de negocio, obligación de seguridad, autoridad del LLM, privacidad, transacción crítica o gate, no basta con subir versión: crear ADR o registrar cambio formal.

---

## 8. Fechas, tiempo y zona horaria

### Formato obligatorio

```text
YYYY-MM-DD
```

Ejemplos:

```text
2026-09-10
2026-10-01
```

### Timestamps para incidentes, releases o auditoría

```text
YYYY-MM-DD HH:MM TZ
```

Ejemplo:

```text
2026-09-10 23:55 VET
```

### Reglas

- No usar formatos ambiguos como `10/09/26` o `09-10-2026`.
- Para fechas de revisión, preferir condición de hito cuando una fecha calendario no tiene sentido.
- Para incidentes, registrar zona horaria explícita.
- Si una fuente externa usa otra zona horaria, conservarla y documentar conversión si afecta operación.

---

## 9. Lenguaje y redacción

### Idioma

- Idioma principal del proyecto: español.
- Términos técnicos estándar pueden permanecer en inglés si aumentan precisión: `fallback`, `rollback`, `feature flag`, `staging`, `audit log`, `timeout`, `rate limit`, `runbook`, `issue`.
- La primera vez que aparezca un término técnico importante, incluir explicación breve si el documento está dirigido a personas no técnicas.

### Estilo

- Escribir en voz activa y frases directas.
- Priorizar verbos concretos: crear, validar, registrar, rechazar, pausar, probar, desplegar.
- Distinguir hechos, decisiones, supuestos, aprendizajes y pendientes.
- Usar tablas para matrices, estados, riesgos y comparaciones.
- Usar listas para pasos, criterios y checklists.
- Evitar párrafos largos cuando el contenido sea operacional.

### Palabras prohibitivas o que exigen precisión

| Evitar | Reemplazo o regla |
|---|---|
| “Listo” sin evidencia | Indicar estado de trabajo y evidencia |
| “Seguro” absoluto | Indicar control, test, límite y riesgo residual |
| “Legal” sin revisión profesional | “Requiere revisión legal” o “diseñado para reducir riesgo” |
| “Imposible de hackear” | “Mitigado contra escenarios evaluados” |
| “Gratis para siempre” | Indicar cuota, proveedor y condición |
| “Garantizado” | Usar solo cuando existe garantía contractual/documentada |
| “Apuesta”, “rifa”, “lotería”, “casino” | No usar en copy de producto salvo análisis legal/documentación interna |
| “El LLM decide” | Especificar qué valida el código y qué genera el modelo |

---

## 10. Clasificación de información

Todo contenido relevante debe poder clasificarse como:

| Clasificación | Prefijo sugerido | Regla |
|---|---|---|
| Hecho verificado | `F-` | Tiene fuente/evidencia y fecha |
| Decisión | `D-` / `ADR-` | Tiene responsable, motivo y estado |
| Supuesto | `SUP-` | No se presenta como hecho |
| Pregunta pendiente | `Q-` | Tiene dueño y revisión |
| Riesgo | `RSK-` | Tiene impacto, mitigación y dueño |
| Aprendizaje | `L-` | Tiene evidencia y aplicación |
| Error conocido | `ERR-` | Tiene causa y prevención |
| Información deprecada | `O-` o estado `DEPRECADO` | Indica reemplazo |

### Regla de investigación

Las fuentes externas viven en `13-investigacion/` hasta que una afirmación se verifique o una decisión la adopte. No copiar una conclusión de internet directamente a una regla de negocio o arquitectura sin clasificación y revisión.

---

## 11. Referencias y enlaces internos

### Referencia a archivo

Usar ruta relativa entre comillas invertidas:

```md
Ver `../00-control/roadmap.md`.
Ver `fuentes-principales/inteligencia.md`.
```

### Referencia a ID

```md
Relacionado con `RB-006`, `R-007`, `T-IA-003` y `RUN-002`.
```

### Referencia a sección

```md
Ver `roadmap.md`, sección “H4 — Integración segura de IA”.
```

### Regla de enlaces

- No usar enlaces rotos o rutas absolutas locales.
- Un archivo movido debe dejar una nota de migración o actualizar todos los enlaces relevantes.
- Los enlaces externos requieren fecha de consulta si su información afecta decisión, costo, legalidad o proveedor.

---

## 12. Tablas y checklists

### Tablas

Usar tablas para información comparable y rastreable:

```md
| ID | Elemento | Estado | Responsable | Siguiente acción |
|---|---|---|---|---|
| RSK-001 | Riesgo legal | Abierto | Luigi | Consultar especialista antes de monetización |
```

### Checklists

Usar checklists para gates y criterios:

```md
- [ ] Criterio cumplido.
- [ ] Evidencia guardada.
- [ ] Bitácora actualizada.
```

### Regla

No marcar una casilla como completada por intención. Solo marcarla cuando exista evidencia que pueda consultarse.

---

## 13. Convención de rutas y carpetas por dominio

| Dominio | Ruta | Contenido |
|---|---|---|
| Control | `00-control/` | Roadmap, estados, DoR, DoD, convenciones, glosario, trazabilidad |
| Requisitos | `01-requisitos/` | Visión, alcance, usuarios, reglas, criterios, exclusiones |
| Decisiones | `02-decisiones/` | ADRs y decisiones formales |
| Arquitectura | `03-arquitectura/` | Componentes, datos, contratos, roles, estados e integraciones |
| IA | `04-ia/` | Adapter, guardrails, prompts, corpus, evaluación y proveedores |
| UX | `05-ux/` | Journeys, pantallas, copy, accesibilidad y experimentos |
| Calidad | `06-calidad/` | Estrategia, cobertura, fixtures y gates |
| Operación | `07-operacion/` | Entornos, observabilidad, backup, soporte y feature flags |
| Legal/confianza | `08-legal-y-confianza/` | Bases beta, privacidad, consentimiento, términos de servicio, moderación, elegibilidad |
| Riesgos | `09-riesgos/` | Registro de riesgos, deuda, dependencias |
| Tests | `10-tests/` | Casos, invariantes, IA, E2E, simulacros |
| Auditorías | `11-auditorias/` | Auditorías de fases, hitos y releases |
| Runbooks | `12-runbooks/` | Incidentes, recuperación, releases y soporte |
| Investigación | `13-investigacion/` | Fuentes, hipótesis y análisis no adoptados |
| Entregas | `14-entregas/` | Changelog, releases, actas, reportes de cohortes |
| Fuentes principales | `fuentes-principales/` | Documentos vivos de alto nivel |

---

## 14. Convención para movimientos y deprecación

### Al mover un archivo

1. Actualizar enlaces internos.
2. Registrar el movimiento en historial de cambios.
3. Si el archivo era fuente frecuente, dejar una nota de redirección temporal.
4. Actualizar índice o roadmap si aplica.

### Al reemplazar un archivo

Agregar al inicio del archivo anterior:

```md
> **Estado:** DEPRECADO
> **Reemplazado por:** `[ruta/nuevo-archivo.md]`
> **Fecha de deprecación:** YYYY-MM-DD
> **Motivo:** [motivo]
```

No borrar inmediatamente un archivo deprecado si contiene decisiones o evidencia histórica necesaria.

---

## 15. Convención para cambios de alcance

Todo cambio de alcance debe registrar:

```md
## Cambio de alcance — CHG-[nnn]

- Fecha: YYYY-MM-DD
- Propuesto por: [persona/rol]
- Estado: IDEA / DESCUBRIMIENTO / ACEPTADO / RECHAZADO
- Cambio solicitado: [descripción]
- Motivo: [por qué]
- Impacto en alcance: [detalle]
- Impacto técnico: [detalle]
- Impacto en riesgos: [IDs]
- Impacto legal/privacidad: [detalle]
- Impacto en plazo/costo: [detalle]
- Decisión: [aceptar / posponer / rechazar]
- Fuente: [ADR/issue/bitácora]
```

### Regla

Un cambio no se considera aprobado solo porque se mencionó en una conversación. Debe tener `CHG-ID`, impacto y decisión explícita.

---

## 16. Convenciones futuras para Git

> Estas reglas se preparan ahora, pero no se aplican hasta que el sistema documental se migre a un repositorio.

### Ramas

```text
main                         # versión estable
feature/[descripcion]        # funcionalidad nueva
fix/[descripcion]            # corrección
chore/[descripcion]          # documentación, mantenimiento o configuración
security/[descripcion]       # seguridad, secretos, permisos o vulnerabilidades
release/[version]            # preparación de release si el flujo lo requiere
```

Ejemplos:

```text
feature/round-state-machine
fix/attempt-idempotency
chore/document-control-system
security/sanitize-public-transcript
```

### Commits

Patrón:

```text
[tipo]([ámbito]): [acción concreta]
```

Tipos permitidos:

| Tipo | Uso |
|---|---|
| `docs` | Documentación |
| `plan` | Roadmap, alcance, fases o planificación |
| `feat` | Funcionalidad nueva |
| `fix` | Corrección |
| `test` | Pruebas/fixtures |
| `security` | Seguridad, permisos, secretos, sanitización |
| `refactor` | Reorganización sin cambio de comportamiento esperado |
| `chore` | Configuración, herramientas, mantenimiento |
| `ops` | CI/CD, observabilidad, backups, operación |
| `revert` | Reversión explícita |

Ejemplos:

```text
docs(H0): crear sistema de control documental
plan(H1): definir invariantes del núcleo determinista
feat(round): implementar transiciones válidas
fix(attempt): evitar doble consumo por retry
test(ia): agregar fixture de timeout recuperable
security(public): redactar PII de transcript
ops(staging): agregar smoke tests post-deploy
```

### Regla de commits

- Un commit debe tener una intención clara.
- No mezclar refactor grande, nueva función y cambio de reglas en un mismo commit.
- Todo commit que altere arquitectura, reglas, datos, IA o seguridad actualiza documentos correspondientes.
- No usar commits como `changes`, `fix`, `final`, `todo` o `wip` para cambios cerrados.

---

## 17. Convención para versiones de producto y releases futuras

### Versión de producto

Usar:

```text
v0.x.y  → prototipo/beta
v1.0.0  → primera versión estable definida por gate
```

Ejemplos:

```text
v0.1.0  Fundación documental y núcleo local inicial
v0.2.0  Vertical slice de staging
v0.3.0  Alpha privada
v0.4.0  Beta privada
```

### Documento de release

Ruta:

```text
14-entregas/release-v0-1-0.md
```

Debe incluir:

- Versión y fecha.
- Hitos/issues incluidos.
- Cambios de reglas/configuración.
- Tests y gates ejecutados.
- Riesgos conocidos.
- Rollback.
- Estado de feature flags.
- Métricas post-release esperadas.
- Responsable de operación.

---

## 18. Convención de seguridad documental

### Nunca incluir

- API keys.
- Passwords.
- Tokens de sesión.
- Claves privadas.
- Seed phrases.
- Datos completos de tarjetas.
- Copias de bases de datos reales.
- PII innecesaria.
- Credenciales de terceros.
- Prompts secretos/productivos completos si su publicación permite evadir controles.
- Chain-of-thought o razonamiento interno del modelo.

### Usar referencias seguras

Ejemplo:

```md
Proveedor IA configurado en ambiente de staging.
Credenciales: gestor de secretos externo.
Verificación: RUN-002 / fecha YYYY-MM-DD.
```

### Clasificación en cabecera

Usar una de estas etiquetas cuando corresponda:

```text
PÚBLICA
INTERNA
CONFIDENCIAL
RESTRINGIDA
```

Regla:

- `PÚBLICA`: puede compartirse sin datos internos.
- `INTERNA`: uso del equipo/proyecto.
- `CONFIDENCIAL`: contiene estrategia, datos de negocio o detalles sensibles.
- `RESTRINGIDA`: acceso limitado; no copiar a prompts o materiales públicos.

---

## 19. Convención de actualización documental

### Actualizar siempre `bitacora.md` cuando

- Se inicia o termina una sesión relevante.
- Se toma una decisión.
- Se descubre un bloqueo o riesgo.
- Se completa una tarea/hito.
- Se encuentra un error o incidente.
- Se cambia el siguiente paso.

### Actualizar `inteligencia.md` cuando

- Se confirma un hecho.
- Se aprueba o depreca una decisión.
- Se aprende un patrón reutilizable.
- Aparece un riesgo importante.
- Cambia el estado general del proyecto.
- Se define una pregunta/bloqueo durable.

### Actualizar `planmaestro.md` cuando

- Cambia visión, alcance, exclusión, fase, gate o roadmap mayor.
- Se aprueba una nueva dirección de producto.
- Se cierra o reabre una fase PM.

### Actualizar `arquitectura.md` cuando

- Cambia componente, stack, contrato, flujo de datos, estado, integración, rol o permiso.
- Se agrega migración, estrategia de fallback o mecanismo de auditoría.

### Actualizar matriz de trazabilidad cuando

- Cambia requisito, regla, decisión, código, test, métrica o runbook crítico.

### Actualizar registro de riesgos cuando

- Aparece un riesgo.
- Cambia probabilidad/impacto.
- Se implementa o prueba una mitigación.
- Se acepta o cierra riesgo residual.

---

## 20. Checklist de cumplimiento de convenciones

Antes de aceptar/cerrar un documento, issue o decisión:

```text
[ ] Nombre de archivo sigue convención.
[ ] Ruta es correcta para su dominio.
[ ] ID es único y usa prefijo correcto.
[ ] Título describe la acción/decisión.
[ ] Cabecera incluye estado, responsable, versión y fechas.
[ ] Las fechas usan formato ISO.
[ ] Los enlaces internos usan rutas relativas o IDs exactos.
[ ] Hechos, supuestos, decisiones y riesgos están separados.
[ ] No incluye secretos ni PII innecesaria.
[ ] Historial de cambios fue actualizado.
[ ] Documento indica próxima revisión o condición de revisión.
[ ] Documento enlaza fuentes relacionadas cuando aplica.
```

---

## 21. Gate de cierre del documento

Este documento se considera activo cuando:

- [x] Define estructura local de rutas y nombres de archivos.
- [x] Define catálogo de IDs y reglas de permanencia.
- [x] Define títulos, cabeceras, versiones y fechas.
- [x] Define lenguaje, clasificación y referencias internas.
- [x] Define manejo de movimientos, deprecación y cambios de alcance.
- [x] Prepara convención futura de Git, ramas, commits y releases.
- [x] Define seguridad documental y actualización de fuentes principales.
- [x] Incluye checklist verificable.

### Próximo documento

`glosario.md` — términos de producto, estados, IA, seguridad, operación, legalidad y documentación usados de forma única en todo el proyecto.

---

## 22. Historial de cambios

| Versión | Fecha | Cambio | Responsable |
|---|---|---|---|
| 0.1.0 | 2026-09-10 | Creación de convenciones de nombres, IDs, rutas, versiones y actualización | Luigi |
