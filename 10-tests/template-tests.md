# Plan de Pruebas — [Ámbito]

> **Estado:** BORRADOR  
> **Tipo:** especificación de pruebas, casos verificables y evidencia de calidad  
> **Ámbito:** [H0 / H1 / módulo / flujo / release / incidente]  
> **Responsable:** [Luigi / rol]  
> **Relacionado con:** [hito, epic, issue, requisito, ADR, riesgo, arquitectura, runbook]  
> **Versión:** 0.1.0  
> **Creado:** YYYY-MM-DD  
> **Última actualización:** YYYY-MM-DD  
> **Próxima revisión:** [fecha o condición]

---

## 0. Para qué sirve esta plantilla

Este documento explica cómo comprobar que una parte del proyecto funciona de verdad, también cuando algo sale mal. No se trata de “probar botones hasta que parezcan bien”; se trata de definir qué debe ocurrir, qué no debe ocurrir y qué evidencia demuestra el resultado.

> **Regla central:** una función crítica no está terminada si no existe una forma clara y repetible de comprobarla.

---

## 1. Resumen sencillo

### Qué se está probando

[Describe el flujo, regla, pantalla, integración o hito.]

### Por qué importa

[Explica qué riesgo evita. Ejemplo: “Evita que dos usuarios procesen simultáneamente la misma transacción con estados inconsistentes”.]

### Resultado esperado

[Explica qué comportamiento demuestra que funciona.]

### Fuera de alcance

- [Qué no prueba este documento.]
- [Qué se prueba en otro documento o fase.]

---

## 2. Reglas y criterios cubiertos

| ID | Regla o criterio | Riesgo si falla | Fuente | Estado |
|---|---|---|---|---|
| RB-XXX | [regla] | [riesgo] | [documento/ADR] | Pendiente / Cubierto |
| CA-XXX | [criterio de aceptación] | [riesgo] | [issue/documento] | Pendiente / Cubierto |
| RNF-XXX | [requisito no funcional] | [riesgo] | [documento] | Pendiente / Cubierto |

---

## 3. Tipos de prueba

No todas las reglas necesitan el mismo tipo de prueba. Elegir la más pequeña que realmente compruebe el riesgo.

| Tipo | Cuándo usarlo | Ejemplo sencillo |
|---|---|---|
| Unitaria | Una regla o función pequeña | “Una orden confirmada rechaza cambiar su importe o estado de forma silenciosa” |
| Integración | Varias piezas trabajan juntas | “El servidor registra ganador y audit log en la misma operación” |
| Contrato | Dos partes respetan el mismo formato | “La pantalla recibe solo datos públicos del servidor” |
| E2E | Camino completo como lo vive una persona | “Usuario entra, hace intento y ve respuesta segura” |
| Regresión | Algo que ya falló antes | “Timeout de IA no descuenta intento después de corregir bug” |
| Seguridad | Secretos, permisos, abuso o fuga | “El adaptador IA no recibe email ni credenciales” |
| Privacidad | Datos personales y visibilidad | “Scoreboard no muestra email o transcript privado” |
| Accesibilidad | Uso con diferentes necesidades/dispositivos | “El mensaje de error se puede leer y entender en móvil” |
| Carga | Mucha actividad al mismo tiempo | “Dos intentos simultáneos no crean dos ganadores” |
| Manual guiada | Algo que todavía no se automatiza | “Revisar que copy de pausa no prometa cosas falsas” |

---

## 4. Datos de prueba

### Regla de seguridad

Usar datos falsos o sintéticos. Nunca usar API keys reales, emails reales, conversaciones privadas, datos confidenciales ni credenciales de producción.

### Fixtures necesarios

| ID | Fixture | Para qué sirve | Datos permitidos | Estado |
|---|---|---|---|---|
| FX-001 | Entidad preparada | Probar apertura/activación | IDs sintéticos, parámetros de prueba | Pendiente |
| FX-002 | Entidad activa | Probar inmutabilidad y cierre | Configuración sintética | Pendiente |
| FX-003 | Dos intentos simultáneos | Probar ganador único | Alias falsos | Pendiente |
| FX-004 | Fallo de proveedor IA | Probar timeout/fallback | Error simulado | Pendiente |
| FX-005 | Usuario con PII | Probar sanitización | Datos evidentemente ficticios | Pendiente |

### Preparación del ambiente

- Ambiente: Local / CI / Staging / Alpha / Beta privada.
- Configuración/flags necesarias: [lista].
- Dependencias simuladas: [mock de IA, reloj falso, base temporal, etc.].
- Datos que se limpian después: [lista].
- Responsable de preparar: [rol].

---

## 5. Casos de prueba

Usar una fila por caso. Mantener cada caso pequeño y comprobable.

| ID | Nombre | Tipo | Preparación | Acción | Resultado esperado | Evidencia | Estado |
|---|---|---|---|---|---|---|---|
| T-[DOMINIO]-001 | [nombre claro] | Unitaria / Integración / E2E | [estado inicial] | [qué hace el test] | [resultado comprobable] | [output, log, captura] | Pendiente |
| T-[DOMINIO]-002 | [nombre claro] | Unitaria / Integración / E2E | [estado inicial] | [qué hace el test] | [resultado comprobable] | [output, log, captura] | Pendiente |

### Formato recomendado para casos críticos

```md
### T-GAME-001 — Una operación activa no permite cambiar reglas

- Tipo: Unitaria + integración.
- Riesgo cubierto: R-006 / RB-003.
- Dado: una transacción o ciclo en estado `ACTIVA` con configuración congelada.
- Cuando: un rol autorizado intenta cambiar una regla relevante.
- Entonces: el sistema rechaza el cambio, no modifica el hash y registra un audit event.
- Evidencia: test verde + evento de auditoría esperado.
- Estado: PENDIENTE / PASA / FALLA.
```

---

## 6. Casos obligatorios por riesgo

Marcar solo los que aplican al ámbito; si no aplica, explicar por qué.

### Reglas de juego

- [ ] Una transición válida funciona.
- [ ] Una transición inválida se rechaza.
- [ ] Una operación activa no permite cambiar configuración relevante.
- [ ] Una transacción o ciclo no se activa sin resultado o activo crítico reservado cuando corresponde.
- [ ] Un intento repetido no se duplica.
- [ ] Dos intentos concurrentes no crean dos ganadores.
- [ ] Un empate usa el criterio publicado.
- [ ] Una transacción o ciclo cerrada/cancelada no acepta intentos.

### IA

- [ ] La IA recibe solo contexto permitido.
- [ ] La IA no recibe datos personales no anonimizados, secretos ni llaves de validación.
- [ ] Output inválido de IA se bloquea o se convierte en fallo recuperable.
- [ ] Timeout de IA no consume injustamente el intento.
- [ ] Reintento seguro no crea resultado duplicado.
- [ ] Fallback comunica el problema sin inventar éxito.
- [ ] La IA no puede declarar ni registrar ganador.
- [ ] La salida no muestra prompt sensible, chain-of-thought ni defensa interna.

### Privacidad y permisos

- [ ] Un DTO público no incluye PII o campos internos.
- [ ] Un usuario no puede ver datos privados de otro usuario.
- [ ] Un rol no autorizado no puede pausar operaciones, alterar configuraciones ni editar reglas.
- [ ] Consentimiento/eligibilidad se valida cuando el flujo lo requiere.
- [ ] Logs y errores no muestran secretos ni PII innecesaria.

### Operación

- [ ] Una pausa conserva estado y deja audit log.
- [ ] Feature flag desactiva una función sin corromper datos.
- [ ] Backup puede restaurarse en ambiente seguro.
- [ ] Rollback vuelve a una versión conocida sin perder integridad.
- [ ] Una alerta se activa ante invariante rota, si ya existe observabilidad.

---

## 7. Resultado de ejecución

### Resumen

| Fecha | Ambiente | Casos ejecutados | Pasan | Fallan | Bloqueados | Responsable |
|---|---|---:|---:|---:|---:|---|
| YYYY-MM-DD | Local / CI / Staging | 0 | 0 | 0 | 0 | [rol] |

### Fallos encontrados

| ID de test | Qué falló | Impacto | Causa probable | Acción inmediata | Dueño | Estado |
|---|---|---|---|---|---|---|
| T-XXX-001 | [fallo] | Bajo / Medio / Alto / Crítico | [hipótesis, no inventar] | [acción] | [rol] | Abierto |

### Regresiones

| ID | Comportamiento que volvió a fallar | Origen | Prueba añadida o reforzada | Estado |
|---|---|---|---|---|
| REG-001 | [comportamiento] | [cambio/incidente] | [test] | Abierta / Cerrada |

---

## 8. Criterio de salida

Este ámbito puede marcarse como probado solo cuando:

```text
[ ] Los casos críticos definidos existen.
[ ] Los casos críticos pasan en el ambiente requerido.
[ ] No hay fallos críticos o altos sin resolver/documentar.
[ ] Los casos de error, borde y permiso relevantes fueron cubiertos.
[ ] Los datos de prueba son sintéticos y seguros.
[ ] Se guardó evidencia reproducible.
[ ] La documentación y trazabilidad se actualizaron.
[ ] Se creó regresión para incidentes o bugs importantes.
```

### Resultado final

```text
[ ] APROBADO PARA AVANZAR
[ ] APROBADO CON ACCIONES MENORES
[ ] BLOQUEADO
[ ] REQUIERE NUEVA DECISIÓN/ADR
```

### Siguiente paso único

[Ejemplo: “Corregir T-IA-003 para que el timeout deje el intento en `FALLIDO_RECUPERABLE` y volver a ejecutar el grupo IA”.]

---

## 9. Actualizaciones documentales

```text
[ ] Actualicé `bitacora.md` con ejecución y resultado.
[ ] Actualicé `inteligencia.md` si se confirmó un hecho, aprendizaje, riesgo o error.
[ ] Actualicé `matriz-trazabilidad.md` con test, métrica o runbook relacionado.
[ ] Actualicé `arquitectura.md` si cambió contrato, dato, estado o integración.
[ ] Actualicé `registro-riesgos.md` si apareció un riesgo o cambió su impacto.
[ ] Creé/actualicé ADR si se tomó una decisión estructural.
[ ] Creé/actualicé runbook si el fallo necesita respuesta operativa repetible.
```

---

## 10. Historial de cambios

| Fecha | Cambio | Responsable |
|---|---|---|
| YYYY-MM-DD | Creación del plan de pruebas | [rol] |
