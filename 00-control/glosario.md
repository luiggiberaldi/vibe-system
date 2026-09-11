# Glosario Operativo — Vibe System (Índice)

> **Estado:** ACTIVO  
> **Tipo:** índice del glosario por módulos  
> **Fuente de verdad:** Sí, para el mapa de términos; las definiciones viven en los módulos  
> **Responsable:** Luigi  
> **Clasificación:** INTERNA  
> **Versión:** 2.0.0  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  
> **Relacionado con:** AUD-VS-001 (hallazgo AUD-001), ADR-004, `00-control/plan-de-fixeo-documental.md` (T-DOC-010, T-DOC-011)

---

## 0. Propósito

El glosario monolítico v1.0.0 (1.524 líneas) se dividió por dominios conforme a ADR-004 (clase **Referencia**: dividir por dominios con documento índice). En la partición se purgó el vocabulario heredado del proyecto de aplicación extraído (Parte A: secciones 3 a 24 del glosario original), hallazgo AUD-001 de AUD-VS-001.

## 1. Módulos del glosario

| Módulo | Archivo | Contenido |
|---|---|---|
| 1. Metodología y conceptos base | [`glosario-metodologia.md`](glosario-metodologia.md) | Agente asistente de IA (§2) y convenciones de lectura del glosario |
| 2. IA, seguridad y calidad | [`glosario-ia-seguridad.md`](glosario-ia-seguridad.md) | Estados y arquitectura (§35–49), IA, guardrails y defensas (§50–66) |
| 3. Operación, privacidad y proceso | [`glosario-operacion.md`](glosario-operacion.md) | Privacidad y operación (§67–85), documentación y proceso (§86–103), términos bloqueados o deprecados (§104–111), mantenimiento (§112) |

## 2. Reglas de uso

1. Buscar primero en el módulo correspondiente según la tabla anterior; si el dominio es ambiguo, buscar en los tres.
2. Los términos nuevos se agregan al módulo de su dominio, cumpliendo el checklist de mantenimiento (módulo 3, §112).
3. Los términos numerados conservan su número original del glosario v1.0.0 como referencia histórica; los números de las secciones purgadas (3–24) quedan reservados y no se reutilizan (regla de IDs permanentes).
4. Si una definición cambia de significado, se marca la anterior como deprecada en el módulo correspondiente y se registra el motivo.

## 3. Historial de cambios

| Fecha | Cambio | Responsable |
|---|---|---|
| 2026-09-11 | Reescritura como índice; partición en 3 módulos y purga del vocabulario del proyecto de aplicación (T-DOC-010, T-DOC-011) | Buffy (agente IA) |
