# Visión y Alcance — Vibe System

> **Estado:** ACTIVO  
> **Tipo:** especificación maestra de visión, propósito y fronteras  
> **Fuente de verdad:** Sí, para los objetivos, alcance y límites de Vibe System  
> **Responsable:** Luigi  
> **Clasificación:** INTERNA  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  

---

## 0. Definición en una frase

**Vibe System** es un meta-sistema operativo y marco de arquitectura documental que transforma la programación asistida por inteligencia artificial (*vibe coding*) en un proceso de ingeniería disciplinado, determinista, libre de alucinaciones y sin deuda técnica invisible.

---

## 1. El problema que resuelve

El desarrollo asistido por modelos de lenguaje grande (LLMs) presenta ventajas de velocidad extraordinarias, pero introduce cuatro modos de falla estructurales cuando no se aplica un marco riguroso:

1. **Amnesia y saturación de contexto:** Conforme el proyecto crece, la ventana de contexto del LLM se degrada (*lost in the middle*). La IA olvida decisiones previas, contradice reglas anteriores e inventa soluciones incompatibles.
2. **Alucinaciones en cascada:** Una suposición errónea no verificada en un archivo de configuración o tipo de datos se propaga a controladores, componentes e interfaces, forzando refactorizaciones costosas.
3. **Desincronización permanente:** El código evoluciona más rápido que las especificaciones. En pocas sesiones, nadie (ni el humano ni la IA) sabe a ciencia cierta qué hace el sistema, por qué se hizo así o si cambiar una función romperá el resto de la aplicación.
4. **Acoplamiento vicioso de metodología y producto:** Mezclar la definición de *cómo trabajar* con las especificaciones de *qué producto se está construyendo* contamina las reglas operativas y bloquea la reusabilidad en futuros proyectos.

---

## 2. Propuesta de valor

Vibe System desacopla radicalmente el proceso de ingeniería en capas predecibles:

- **Gobierno Humano Único (Luigi):** La IA propone, asiste, investiga y redacta código; el humano es el único árbitro con autoridad para aceptar cambios de alcance, arquitectura y entregas.
- **Tríada de Memoria Viva:** Tres archivos obligatorios (`agent.md`, `inteligencia.md`, `bitacora.md`) mantienen el contexto condensado, las reglas de engagement y el historial inmediato sin saturar la memoria del modelo.
- **Techo Modular de ~600 Líneas:** Archivos atómicos y especializados que caben íntegramente en las ventanas de atención óptima de cualquier LLM avanzado.
- **Gates de Paso Innegociables:** Ninguna tarea se inicia sin *Definition of Ready (DoR)* y ninguna se aprueba sin *Definition of Done (DoD)* y validación de pruebas deterministas.
- **Cero Deuda Oculta:** Cada línea de código responde a una tarea identificada (`T-xxx`), vinculada a un requisito (`REQ-xxx`) con criterio de verificación documentado.

---

## 3. Niveles de adopción del sistema

Vibe System se adapta al tamaño y criticidad del proyecto mediante tres perfiles:

| Módulo / Carpeta | Perfil Micro (MVP rápido) | Perfil Estándar (Recomendado) | Perfil Empresarial / Misión Crítica |
|---|---|---|---|
| `fuentes-principales/` (Tríada) | Obligatorio | Obligatorio | Obligatorio |
| `00-control/` (DoR, DoD, Estados) | Obligatorio | Obligatorio | Obligatorio |
| `01-requisitos/` | Resumen único | Modular por capacidad | Exhaustivo con especificación formal |
| `02-decisiones/` (ADRs) | Opcional | Obligatorio para decisiones clave | Obligatorio con proceso de aprobación |
| `03-arquitectura/` | Opcional | Obligatorio | Obligatorio con diagramas C4 |
| `10-tests/` | Opcional | Obligatorio | Obligatorio (TDD / Cobertura > 80%) |
| `11-auditorias/` | Opcional | Al cerrar hitos mayores | Auditorías periódicas obligatorias |
| `12-runbooks/` | Opcional | Para despliegue crítico | Obligatorio (operación, incidentes, rollback) |

---

## 4. Límites no negociables (Non-Goals)

Para preservar la pureza y efectividad de Vibe System, se definen explícitamente las siguientes fronteras:

- **No es un producto comercial final:** Vibe System es el estándar metodológico, no un SaaS, ni un CRM, ni un juego.
- **No depende de un lenguaje o framework:** Es neutral a la tecnología; funciona de forma idéntica en TypeScript/React, Python, Go, Rust o arquitecturas móviles.
- **No sustituye el juicio humano:** Ningún agente de IA puede autoaprobarse cambios de alcance, saltarse un gate o modificar la jerarquía de decisiones sin el consentimiento expreso de Luigi.
- **No es un bot autónomo descontrolado:** La IA no ejecuta acciones externas irreversibles (despliegues a producción, eliminación de bases de datos, compras) sin verificación previa paso a paso.
