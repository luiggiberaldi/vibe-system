# Checklist de Gate Pre-Commit — Vibe System

> **Estado:** ACTIVO — manual; automatización pendiente cuando exista repositorio  
> **Tipo:** verificación antes de guardar un cambio en Git  
> **Responsable:** Luigi  
> **Relacionado con:** `agent.md`, `definition-of-ready.md`, `definition-of-done.md`, `convenciones.md`  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  
> **Próxima revisión:** al crear el repositorio y antes del primer sprint

---

## 0. Para qué sirve

Un commit es una fotografía guardada del proyecto. Este checklist evita guardar una fotografía rota, incompleta o con secretos.

No busca hacerte perder tiempo. Busca detectar errores baratos antes de que se conviertan en horas de arreglos o en una fuga de datos.

> **Regla central:** si un check crítico falla, no se hace commit hasta corregirlo o documentar una excepción aprobada.

---

## 1. Cuándo usarlo

Usar este checklist antes de cada commit que cambie:

- Código.
- Configuración.
- Documentos de fuente de verdad.
- Reglas de juego.
- Datos o migraciones.
- IA, prompts, proveedores o filtros.
- Seguridad, privacidad, permisos o secretos.
- Infraestructura, despliegue, alertas o backups.

Para un cambio pequeño de texto no crítico, se pueden omitir los checks técnicos que no aplican, pero nunca los de secretos, documentación básica y revisión del cambio.

---

## 2. Revisión humana rápida

Antes de ejecutar herramientas, responder:

```text
[ ] Puedo explicar este commit en una frase.
[ ] El commit hace una sola cosa principal.
[ ] No mezclé una función nueva con un refactor grande sin necesidad.
[ ] Sé qué hito/issue/ADR está relacionado.
[ ] Sé cómo volver atrás si el cambio afecta una ruta sensible.
[ ] Leí los documentos que aplican al cambio.
[ ] No estoy cerrando una tarea que todavía está solo diseñada.
```

### Mensaje de commit esperado

```text
[tipo]([ámbito]): [acción concreta]
```

Ejemplos:

```text
docs(H0): crear registro consolidado de riesgos
feat(round): bloquear cambios en configuracion activa
test(game): cubrir ganador unico en concurrencia
fix(attempt): conservar cuota ante timeout de ia
security(public): sanitizar campos del scoreboard
ops(staging): agregar smoke test post-deploy
```

No usar mensajes como:

```text
changes
fix
final
actualizacion
todo
wip
```

---

## 3. Checks obligatorios para todos los commits

```text
[ ] No hay API keys, passwords, tokens, claves privadas, seed phrases ni credenciales en archivos modificados.
[ ] No hay PII innecesaria, datos reales de usuarios ni transcripciones privadas.
[ ] Los nombres de archivo, IDs, fechas y rutas siguen `convenciones.md`.
[ ] Los archivos nuevos tienen título y cabecera si son documentos importantes.
[ ] No hay caracteres corruptos, texto ilegible o problemas de codificación UTF-8.
[ ] Los enlaces internos modificados apuntan a la ruta correcta.
[ ] El cambio no contradice `planmaestro.md`, `arquitectura.md` o una decisión vigente.
[ ] La bitácora se actualizó si el cambio es relevante.
[ ] La inteligencia se actualizó si apareció hecho, decisión, aprendizaje, riesgo o bloqueo durable.
[ ] El diff fue revisado: sé exactamente qué se va a guardar.
```

---

## 4. Checks para cambios de código

Aplicar si el commit modifica código, scripts, configuración ejecutable o dependencias.

```text
[ ] El código tiene un propósito claro y no supera el límite de 600 líneas por archivo.
[ ] Funciones grandes se dividieron si hacen más de una cosa.
[ ] No hay secretos hardcodeados.
[ ] No hay `console.log` de producción sin motivo documentado.
[ ] Las entradas externas se validan en servidor.
[ ] No se duplicó una regla crítica en frontend y backend.
[ ] No se usó el reloj del navegador para decidir ganador, empate o resultado o activo crítico.
[ ] No se dejó a la IA cambiar datos, resultado o activo crítico, ganador, permisos o estado crítico.
[ ] Se manejan errores esperados y se informa al usuario de forma clara.
[ ] Hay fallback o rollback cuando el cambio toca una ruta sensible.
```

---

## 5. Checks de pruebas

### Mínimo esperado

```text
[ ] Se agregaron o actualizaron pruebas para el cambio.
[ ] Las pruebas relevantes pasan localmente o en CI.
[ ] Se probaron casos de error, borde y permisos aplicables.
[ ] Los fixtures son sintéticos.
[ ] Un bug o incidente importante tiene prueba de regresión.
[ ] No se marcaron pruebas como aprobadas sin ejecutarlas.
```

### Comandos futuros

Cuando exista el proyecto, registrar comandos reales aquí:

```text
Formato:       [comando pendiente]
Lint:          [comando pendiente]
Tipos:         [comando pendiente]
Unit tests:    [comando pendiente]
Integración:   [comando pendiente]
Secret scan:   [comando pendiente]
Build:         [comando pendiente]
```

Hasta entonces, usar revisión manual y documentar qué no se pudo automatizar.

---

## 6. Checks especiales por riesgo

### Si cambia una regla de juego

```text
[ ] Existe criterio de aceptación comprobable.
[ ] Se actualizó arquitectura si cambia estado, transición o validación.
[ ] Se actualizó matriz de trazabilidad.
[ ] Existe test de regla normal y caso límite.
[ ] Se revisó ganador único, empate, configuración congelada y audit log si aplican.
[ ] Se creó ADR si la regla cambia de forma estructural.
```

### Si cambia IA, prompt o proveedor

```text
[ ] La IA recibe solo contexto permitido.
[ ] No se envían secretos, PII, evidencia de resultado o activo crítico ni claves de validación.
[ ] La IA no obtiene autoridad de negocio.
[ ] Se probaron timeout, error, salida inválida y fallback.
[ ] Se actualizó corpus de evaluación/red teaming si existe.
[ ] Se revisó costo, límite y circuit breaker si aplica.
[ ] Se actualizó matriz de trazabilidad y arquitectura.
```

### Si cambia privacidad, datos o permisos

```text
[ ] Se revisó minimización de datos.
[ ] DTO/vista pública no expone campos internos.
[ ] Roles no autorizados reciben rechazo seguro.
[ ] Consentimiento y retención se revisaron si aplican.
[ ] Se agregaron pruebas de privacidad/autorización.
[ ] Se actualizaron riesgos, arquitectura y trazabilidad.
```

### Si cambia despliegue, infraestructura o configuración

```text
[ ] No se agregaron secretos al repositorio.
[ ] Existe `.env.example` sin valores sensibles si aparecen nuevas variables.
[ ] Existe plan de rollback.
[ ] Se sabe qué ambiente se afecta.
[ ] Se revisaron backup, migración y restauración si cambian datos.
[ ] Se actualizó runbook si el cambio crea nuevo escenario operativo.
```

---

## 7. Excepciones

Una excepción es rara y debe ser visible. No se usa para evitar pruebas o esconder presión de tiempo.

Para permitir un commit con un check no cumplido, registrar:

```text
- Check omitido:
- Motivo:
- Riesgo aceptado:
- Mitigación temporal:
- Responsable que aprueba: Luigi
- Fecha límite para corregir:
- Issue/riesgo relacionado:
```

No se permiten excepciones para:

- Secretos expuestos.
- PII expuesta.
- Más de un ganador oficial.
- Resultado o activo crítico sin reserva.
- IA con autoridad de negocio.
- Falta de rollback en un cambio crítico.

---

## 8. Resultado del gate

Antes de hacer commit, marcar una opción:

```text
[ ] VERDE — todos los checks aplicables pasan; se puede hacer commit.
[ ] AMARILLO — hay excepción menor documentada y aprobada; crear issue para corregir.
[ ] ROJO — hay fallo crítico; no hacer commit hasta corregir o revertir.
```

### Registro breve para la bitácora, si aplica

```text
Cambio: [descripción]
Gate: VERDE / AMARILLO / ROJO
Checks ejecutados: [lista]
Excepción: [ninguna / detalle]
Siguiente paso: [acción]
```

---

## 9. Automatización futura

Cuando exista repositorio Node/TypeScript u otro stack elegido, convertir este checklist en checks automáticos por etapas:

1. Formato y lint.
2. Typecheck.
3. Unit tests rápidos.
4. Límite de tamaño de archivos.
5. Secret scan.
6. Validación de enlaces/documentación relevante.
7. Checks de PR y staging para integración, E2E y seguridad.

La automatización no reemplaza revisar reglas, privacidad, alcance o UX; solo hace más difícil olvidar los controles repetibles.

---

## 10. Historial de cambios

| Versión | Fecha | Cambio | Responsable |
|---|---|---|---|
| 0.1.0 | 2026-09-11 | Creación del gate manual previo a Git y automatización futura | Luigi |
