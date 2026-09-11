# Ciclo de Vida de Proyecto — Vibe System

> **Estado:** ACTIVO  
> **Tipo:** especificación de ciclo de vida, etapas y criterios de transición  
> **Fuente de verdad:** Sí, para las etapas de maduración de cualquier proyecto  
> **Responsable:** Luigi  
> **Clasificación:** INTERNA  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  

---

## 0. Propósito

Este documento describe las **etapas evolutivas de un proyecto** gobernado por Vibe System, desde su concepción inicial hasta su operación continua o entrega final. Define las compuertas (*gates*) obligatorias para transitar de una etapa a la siguiente.

---

## 1. Las 5 Etapas del Ciclo de Vida

```
Etapa 0: Fundación ➔ Etapa 1: Arquitectura ➔ Etapa 2: Construcción ➔ Etapa 3: Hardening ➔ Etapa 4: Entrega
```

### Etapa 0: Fundación e Inicialización
- **Objetivo:** Disponer del entorno de trabajo estructurado y de los canales de memoria activos.
- **Entregables:**
  - Estructura canónica de carpetas clonada del Starter Kit.
  - `fuentes-principales/agent.md` activo.
  - `fuentes-principales/inteligencia.md` con el objetivo del proyecto y límites iniciales.
  - `fuentes-principales/bitacora.md` con la primera entrada de sesión.
  - `00-control/convenciones.md` configurado con nombres e IDs del proyecto.
- **Gate de Salida:** Repositorio creado, Git inicializado, control documental validado.

### Etapa 1: Especificación y Arquitectura
- **Objetivo:** Dejar resueltas todas las decisiones de diseño antes de programar.
- **Entregables:**
  - Visión y alcance del producto en `01-requisitos/`.
  - Requisitos funcionales identificados (`REQ-xxx`).
  - Plano arquitectónico en `03-arquitectura/` (componentes, datos, integraciones).
  - ADRs iniciales aceptados en `02-decisiones/` (stack, base de datos, hosting).
  - Registro de riesgos inicial en `09-riesgos/registro-riesgos.md`.
- **Gate de Salida:** Luigi aprueba formalmente la arquitectura y el roadmap de hitos.

### Etapa 2: Construcción Iterativa por Hitos
- **Objetivo:** Implementación incremental de funcionalidades mediante microciclos DoR ➔ Código ➔ Pruebas ➔ DoD.
- **Entregables:**
  - Código fuente modular (< 600 líneas por archivo).
  - Pruebas automatizadas en `10-tests/` (unitarias, integración).
  - Actualización continua de `fuentes-principales/bitacora.md` por cada sesión.
  - Actualización continua de hechos y decisiones en `fuentes-principales/inteligencia.md`.
- **Gate de Salida:** Cumplimiento del 100% de criterios de aceptación del hito y paso del pre-commit gate.

### Etapa 3: Hardening, Auditoría y Seguridad
- **Objetivo:** Verificar exhaustivamente la resiliencia, seguridad y calidad antes de abrir a usuarios reales.
- **Entregables:**
  - Auditoría de seguridad y políticas de privacidad en `05-seguridad/`.
  - Informe de auditoría formal en `11-auditorias/auditoria-[hito].md`.
  - Manuales operativos y de incidentes en `12-runbooks/`.
  - Validación de backups, pausas y procedimientos de recuperación.
- **Gate de Salida:** Auditoría en estado APROBADA sin vulnerabilidades críticas o altas abiertas.

### Etapa 4: Entrega, Despliegue y Operación
- **Objetivo:** Puesta en producción y entrega al cliente o usuarios finales.
- **Entregables:**
  - Release notes y changelog en `14-entregas/`.
  - Tag de versión en Git (`vX.Y.Z`).
  - Runbooks de despliegue y soporte ejecutados y validados.
  - Acta de entrega final aprobada por Luigi.
- **Gate de Salida:** Sistema en producción con observabilidad activa y sin incidentes de bloqueo.
