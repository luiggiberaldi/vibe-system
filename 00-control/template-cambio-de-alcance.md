# Cambio de Alcance — CHG-[NNN]

> **Estado:** IDEA  
> **Tipo:** propuesta de cambio de alcance, prioridad, función, regla o exclusión  
> **ID:** CHG-[NNN]  
> **Propuesto por:** [Luigi / rol]  
> **Responsable de evaluación:** Luigi  
> **Clasificación:** INTERNA  
> **Creado:** YYYY-MM-DD  
> **Última actualización:** YYYY-MM-DD  
> **Relacionado con:** [planmaestro, roadmap, ADR, requisitos, riesgos, tests]  
> **Afecta hito/epic:** [H[n] / E-[n] / ninguno]  
> **Decisión final:** PENDIENTE

---

## 0. Para qué sirve esta plantilla

Esta plantilla se usa cuando aparece una idea que cambia lo que el proyecto incluye, excluye, promete o prioriza.

Ejemplos:

- Agregar pagos, anuncios, cripto, wallets o transacción monetaria.
- Cambiar cómo se gana una transacción o ciclo.
- Agregar una función nueva al MVP.
- Eliminar una función ya planeada.
- Cambiar de audiencia, idioma, región o tipo de beta.
- Cambiar una regla de privacidad, IA, resultado o activo crítico o seguridad.

> **Regla central:** una idea no entra al proyecto solo porque suena buena. Primero se evalúa su impacto; después Luigi decide si se acepta, se pospone o se rechaza.

---

## 1. Cambio propuesto

### En una frase

[Ejemplo: “Permitir pagos para comprar intentos extra”.]

### Descripción sencilla

[Explica qué quiere cambiar una persona usuaria, el producto, una regla o una parte del plan.]

### Motivo

[Por qué surgió esta idea: feedback, bloqueo, oportunidad, costo, seguridad, aprendizaje, error o necesidad real.]

### Tipo de cambio

Marcar lo aplicable:

```text
[ ] Nueva función.
[ ] Cambio de prioridad.
[ ] Cambio de regla de juego.
[ ] Cambio de resultado o activo crítico/elegibilidad.
[ ] Cambio de privacidad/datos.
[ ] Cambio de IA/proveedor/prompt.
[ ] Cambio de arquitectura/stack.
[ ] Cambio de UX/idioma/audiencia.
[ ] Cambio de operación/hosting.
[ ] Eliminación o simplificación.
[ ] Corrección de alcance/documentación.
```

---

## 2. Comparación antes y después

| Área | Antes | Propuesta | Cambio real |
|---|---|---|---|
| Usuario | [estado actual] | [nuevo estado] | [impacto] |
| MVP | [incluido/excluido] | [incluido/excluido] | [impacto] |
| Regla de juego | [regla] | [regla propuesta] | [impacto] |
| IA | [límite actual] | [límite propuesto] | [impacto] |
| Datos/privacidad | [estado actual] | [estado propuesto] | [impacto] |
| Resultado o activo crítico/economía | [estado actual] | [estado propuesto] | [impacto] |
| Operación | [estado actual] | [estado propuesto] | [impacto] |

---

## 3. Impacto que debe revisarse

No asumir que un cambio pequeño es seguro. Revisar cada área y escribir “no aplica” solo con motivo.

| Área | Pregunta | Impacto | Acción necesaria |
|---|---|---|---|
| Producto | ¿Hace el MVP más claro o más confuso? | Bajo / Medio / Alto / Crítico | [acción] |
| Usuario | ¿Afecta comprensión, acceso, diversión o confianza? | Bajo / Medio / Alto / Crítico | [acción] |
| Reglas | ¿Cambia victoria, empate, puntos, operación o resultado o activo crítico? | Bajo / Medio / Alto / Crítico | [acción] |
| Equidad | ¿Da ventaja injusta, pay-to-win o azar? | Bajo / Medio / Alto / Crítico | [acción] |
| IA | ¿Da más autoridad, datos o herramientas al modelo? | Bajo / Medio / Alto / Crítico | [acción] |
| Privacidad | ¿Pide, guarda o expone más datos? | Bajo / Medio / Alto / Crítico | [acción] |
| Seguridad | ¿Abre una nueva forma de abuso, fuga o acceso? | Bajo / Medio / Alto / Crítico | [acción] |
| Legal/confianza | ¿Cambia elegibilidad, resultado o activo crítico, dinero, publicidad o comunicación? | Bajo / Medio / Alto / Crítico | [acción] |
| Arquitectura | ¿Requiere nuevo proveedor, datos, contrato o migración? | Bajo / Medio / Alto / Crítico | [acción] |
| Costo | ¿Agrega costo fijo, variable o riesgo de cuota? | Bajo / Medio / Alto / Crítico | [acción] |
| Operación | ¿Requiere alerta, backup, soporte, rollback o runbook? | Bajo / Medio / Alto / Crítico | [acción] |
| Roadmap | ¿Retrasa/bloquea un hito o agrega trabajo? | Bajo / Medio / Alto / Crítico | [acción] |

---

## 4. Reglas que no se pueden romper

Evaluar cada una. Si alguna pasa de “no afecta” a “afecta”, el cambio requiere revisión extra y probablemente ADR.

```text
[ ] La beta inicial sigue teniendo participación gratuita.
[ ] El producto sigue siendo habilidad, no apuesta/azar.
[ ] La IA no decide ganador, resultado o activo crítico, dinero, precio, permisos ni estados críticos.
[ ] No se exponen secretos, PII o transcripciones privadas.
[ ] Una operación activa no cambia reglas silenciosamente.
[ ] El resultado o activo crítico sigue reservado antes de activar una transacción o ciclo.
[ ] Existe un único ganador oficial si aplica.
[ ] Un fallo externo no castiga injustamente a usuarios.
[ ] Acciones críticas siguen dejando audit log.
[ ] El sistema sigue pudiendo pausar y recuperarse con seguridad.
```

### Funciones bloqueadas afectadas

| Función bloqueada | ¿La propuesta intenta activarla? | Revisión obligatoria |
|---|---|---|
| Pagos reales | Sí / No | Legal, seguridad, arquitectura, operación y aprobación explícita |
| Resultado o activo crítico monetario | Sí / No | Legal, reserva, elegibilidad, impuestos y operación |
| Anuncios activos | Sí / No | UX, privacidad, política de anuncios y no pay-to-win |
| Wallets / USDT / blockchain | Sí / No | Seguridad, legal, custodia y arquitectura |
| Precio dinámico real | Sí / No | Equidad, legal, UX y transparencia |
| Agentes autónomos | Sí / No | Seguridad, permisos, herramientas y auditoría |
| Multiidioma / expansión internacional | Sí / No | UX, legal, soporte y operación |

---

## 5. Alternativas

| Opción | Beneficio | Costo/riesgo | Facilidad para Luigi | ¿Mantiene MVP pequeño? | Recomendación |
|---|---|---|---|---|---|
| No cambiar | [beneficio] | [costo] | Alta / Media / Baja | Sí / No | [nota] |
| Implementar versión pequeña | [beneficio] | [costo] | Alta / Media / Baja | Sí / No | [nota] |
| Implementar propuesta completa | [beneficio] | [costo] | Alta / Media / Baja | Sí / No | [nota] |
| Posponer a fase futura | [beneficio] | [costo] | Alta / Media / Baja | Sí / No | [nota] |

---

## 6. Decisión

### Resultado

Seleccionar uno:

```text
[ ] ACEPTADO
[ ] ACEPTADO CON LÍMITES
[ ] POSPUESTO
[ ] RECHAZADO
[ ] REQUIERE INVESTIGACIÓN
[ ] REQUIERE ADR
[ ] REQUIERE REVISIÓN PROFESIONAL
```

### Motivo de la decisión

[Explica en pocas líneas por qué se eligió este resultado.]

### Condiciones obligatorias

- [ ] [Condición antes de implementar.]
- [ ] [Prueba, límite o aprobación requerida.]
- [ ] [Cambio documental requerido.]

### Si se acepta

- Hito/epic/issue destino: [ID].
- Prioridad: Must / Should / Could / Won't.
- ADR requerido: Sí / No.
- Riesgos a registrar/actualizar: [IDs].
- Tests requeridos: [IDs].
- Rollback/fallback: [descripción].
- Feature flag necesaria: Sí / No / Pendiente.

---

## 7. Actualizaciones obligatorias

```text
[ ] Actualicé `planmaestro.md` si cambió alcance o prioridad.
[ ] Actualicé `roadmap.md` si cambió hito, epic, issue o dependencia.
[ ] Actualicé `inteligencia.md` con la decisión durable.
[ ] Actualicé `bitacora.md` con la sesión y siguiente paso.
[ ] Actualicé `arquitectura.md` si cambió componentes, datos, contratos o proveedores.
[ ] Actualicé `matriz-trazabilidad.md` si cambió regla, prueba, alerta o runbook crítico.
[ ] Actualicé `registro-riesgos.md` si cambió riesgo, dependencia o deuda.
[ ] Creé ADR si el cambio es estructural.
[ ] Creé/actualicé pruebas y runbook si corresponde.
```

---

## 8. Historial de cambios

| Fecha | Cambio | Responsable |
|---|---|---|
| YYYY-MM-DD | Cambio de alcance propuesto | [rol] |
