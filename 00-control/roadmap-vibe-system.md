# Roadmap — Vibe System Core

> **Estado:** ACTIVO  
> **Tipo:** hoja de ruta estratégica y evolución del framework  
> **Fuente de verdad:** Sí, para los hitos de madurez de Vibe System  
> **Responsable:** Luigi  
> **Clasificación:** INTERNA  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  

---

## 0. Propósito

Este documento establece el plan de ruta (**roadmap**) para el desarrollo, validación y consolidación de **Vibe System** como estándar metodológico de desarrollo con IA para Luigi.

---

## 1. Tabla Resumen de Hitos

| Hito | Nombre del Hito | Objetivo Principal | Estado | Gate de Salida |
|---|---|---|---|---|
| **H0** | Cimentación y Desacoplamiento | Purga de proyectos externos y especificación maestra | **CERRADO (100%)** | Documentación fundacional completa, certificada y auditada |
| **H1** | Validación en Proyecto Piloto | Aplicación práctica de Vibe System en un proyecto piloto real | **HABILITADO** | Primer proyecto implementador operando con Vibe System |
| **H2** | Refinamiento y Optimización | Ajuste de fricciones operativas y plantillas avanzadas | PLANIFICADO | Cero fricciones detectadas en 2 proyectos consecutivos |
| **H3** | Automatización y Scaffolding | Herramientas CLI y scripts de validación de gates | PLANIFICADO | CLI operativo para `vibe init` y `vibe check` |

---

## 2. Detalle de Hitos

### Hito H0 — Cimentación y Desacoplamiento (Completado y Certificado)
- [x] Extraer todo el contenido y archivos externos hacia su propio repositorio independiente.
- [x] Preservar la integridad de los artefactos del proyecto piloto (11 archivos íntegros).
- [x] Limpiar `00-control/` (convenciones, DoR, DoD, estados, glosario, pre-commit).
- [x] Reescribir `fuentes-principales/` (`agent.md`, `inteligencia.md`, `bitacora.md`) para Vibe System.
- [x] Crear especificaciones maestras en `01-requisitos/` (Visión, Flujo, Parámetros, Actualización, Ciclo, Starter Kit).
- [x] Formalizar ADR-001, ADR-002 y ADR-003 en `02-decisiones/`.
- [x] Crear especificación de `03-arquitectura/arquitectura-documental-vibe-system.md`.
- [x] Crear módulo de IA en `04-ia/` (`system-prompt-vibe-coder.md` y `protocolo-anti-alucinaciones.md`).
- [x] Crear manual de arranque operativo en `07-operacion/guia-de-arranque-de-nuevo-proyecto.md`.
- [x] Crear matriz de riesgos del framework en `09-riesgos/registro-riesgos-vibe-system.md`.
- [x] Ejecutar auditoría automatizada y aprobar `11-auditorias/auditoria-H0-fundacion-vibe-system.md`.
- [x] Publicar notas de lanzamiento oficial en `14-entregas/RELEASE-NOTES-v1.0.0.md`.

### Hito H1 — Validación en Proyecto Piloto
- [ ] Instanciar formalmente el Starter Kit de Vibe System en el proyecto piloto.
- [ ] Ejecutar el ciclo de 5 fases para el desarrollo de la beta gratuita de un proyecto de aplicación externo.
- [ ] Registrar tiempos de respuesta, fricciones con LLMs y precisión de contexto.
- [ ] Validar la eficacia de los gates de DoR y pre-commit en un flujo de código real.

### Hito H2 — Refinamiento y Optimización de Plantillas
- [ ] Refinar las plantillas de `10-tests/` y `12-runbooks/` basadas en la experiencia de H1.
- [ ] Crear plantillas para diagramas C4 en `03-arquitectura/`.
- [ ] Incorporar guías para diferentes stacks tecnológicos (Next.js, Vite/React, Supabase, FastAPI).

### Hito H3 — Automatización y Scaffolding (Vibe Tooling)
- [ ] Desarrollar script de inicialización automática (`vibe init [nombre-proyecto]`).
- [ ] Desarrollar linter de pre-commit para verificar archivos > 600 líneas y secretos expuestos.
- [ ] Generación automática del índice en `fuentes-principales/inteligencia.md`.
