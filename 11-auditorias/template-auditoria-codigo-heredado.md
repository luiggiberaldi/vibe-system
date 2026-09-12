# Auditoría E2E de Código Heredado — [NOMBRE-DEL-PROYECTO]

> **Estado:** PLANTILLA
> **Tipo:** auditoría de línea de base para proyectos NO creados por Vibe System (Vía B de incorporación)
> **Ámbito:** todo el código y documentación heredados, antes de cualquier adecuación
> **Responsable:** Luigi
> **Relacionado con:** ciclo-de-vida-de-proyecto.md (Etapa 0-B), template-plan-adecuacion.md, template-auditoria.md, verify-gates.sh
> **Versión:** 0.1.0
> **Creado:** YYYY-MM-DD
> **Última actualización:** YYYY-MM-DD

---

## 0. Para qué sirve esta plantilla

Es el **primer paso obligatorio** cuando Vibe System adopta un proyecto que ya existe (código propio previo, de un tercero, o generado fuera del sistema). No se toca nada hasta que esta auditoría produce el inventario y el diagnóstico de línea de base. Su producto alimenta directamente el [plan de adecuación](template-plan-adecuacion.md).

> **Regla central:** no se adecúa lo que no se conoce. Ningún cambio de código antes de completar esta auditoría y aprobar el plan de adecuación.

---

## 1. Resumen del proyecto heredado

| Campo | Valor |
|---|---|
| Nombre / repositorio | [URL o ruta] |
| Origen | [propio previo / terceros / generado por IA fuera del sistema] |
| Estado declarado | [producción / desarrollo activo / abandonado / desconocido] |
| Tamaño aproximado | [nº archivos, líneas por lenguaje] |
| Stack declarado | [lenguajes, frameworks, BD, hosting] |
| Documentación existente | [sí/no, dónde, calidad aparente] |
| Accesos disponibles | [repo, servidor, BD, servicios externos, credenciales] |
| Fecha de auditoría | YYYY-MM-DD |
| Auditor | [Luigi / agente] |

---

## 2. Inventario E2E (obligatorio antes de concluir)

| Dimensión | Qué registrar | Método mínimo | Hecho |
|---|---|---|---|
| Estructura | Árbol de carpetas, punto de entrada, módulos | `tree` / listado raíz | [ ] |
| Dependencias | Manifiestos (package.json, requirements, etc.) y sus versiones | leer manifiestos + lockfiles | [ ] |
| Datos | Modelos, migraciones, seeds, BD real si es accesible | leer esquema; nunca modificar | [ ] |
| Flujos críticos | Los 3–7 caminos que hacen al producto útil (E2E) | recorrer código + ejecutar app | [ ] |
| Puntos de entrada | Scripts, endpoints, jobs, CLI | grep de routers/main/cron | [ ] |
| Configuración | Variables de entorno (nombres, NO valores), flags, config files | listar nombres | [ ] |
| Secretos expuestos | Credenciales hardcodeadas, tokens en el repo | grep de patrones + revisión | [ ] |
| Externos | APIs, pagos, email, storage, dominios | grep de http/base URLs | [ ] |
| Deploy | Cómo se publica hoy (manual/CI/script), dónde vive | preguntar + buscar scripts | [ ] |
| Estado real | ¿Corre? ¿Compila? ¿Pasa algo? | ejecutar localmente | [ ] |

---

## 3. Evaluación por capas

Calificar cada capa: **OK / DÉBIL / CRÍTICO / DESCONOCIDO**, con evidencia.

| Capa | Calificación | Evidencia | Riesgo principal |
|---|---|---|---|
| Corre (build + arranque local) | | | |
| Pruebas existentes (¿hay? ¿pasan? ¿cubren flujos críticos?) | | | |
| Manejo de errores y recuperación | | | |
| Seguridad (secretos, permisos, entradas) | | | |
| Datos (integridad, backups, migraciones) | | | |
| Despliegue y rollback | | | |
| Documentación real vs. realidad | | | |
| Deuda técnica evidente (archivos monstruo, duplicación) | | | |

---

## 4. Hallazgos

| ID | Hallazgo | Severidad (Crítica/Alta/Media/Baja) | Evidencia | Impacto en la adecuación |
|---|---|---|---|---|
| AH-001 | | | | |
| AH-002 | | | | |

Reglas:
- Un hallazgo **Crítico** en "secretos expuestos" o "datos sin backup" pausa la adecuación y se mitiga primero.
- No inventar causas: lo no verificado se marca `DESCONOCIDO` con el comando que faltaría para verificarlo.

---

## 5. Mapa de flujos críticos E2E

Un flujo por fila; es la base de las pruebas de regresión del plan de adecuación.

| ID | Flujo (ej. "cliente paga y recibe comprobante") | Camino técnico (módulos/archivos) | ¿Funciona hoy? | Prueba de regresión propuesta |
|---|---|---|---|---|
| FLUJO-001 | | | Sí / No / Desconocido | |

---

## 6. Criterio de salida de la auditoría

```text
[ ] Inventario completo (sección 2, todo marcado).
[ ] Las 8 capas calificadas con evidencia o DESCONOCIDO justificado.
[ ] Flujos críticos mapeados con su estado real.
[ ] Hallazgos con severidad y evidencia.
[ ] Cero modificaciones de código durante la auditoría.
[ ] Secretos encontrados tratados: rotación planificada, nunca commiteados.
```

### Resultado final

```text
[ ] APROBADA — continuar con el plan de adecuación
[ ] APROBADA CON ACCIONES URGENTES — mitigar críticos primero, luego adecuar
[ ] BLOQUEADA — el proyecto no es candidato (justificar)
```

### Siguiente paso único

Elaborar el [plan de adecuación](template-plan-adecuacion.md) con estos hallazgos como línea de base.

---

## 7. Actualizaciones documentales

```text
[ ] bitácora: entrada de la auditoría con resultado.
[ ] inteligencia.md: hechos verificados (F-) sobre el estado real del heredado.
[ ] registro de riesgos: riesgos heredados como RSK- con severidad.
[ ] plan de adecuación: creado con esta auditoría como insumo.
```

---

## 8. Historial de cambios

| Fecha | Cambio | Responsable |
|---|---|---|
| YYYY-MM-DD | Creación de la auditoría de línea de base | [rol] |
