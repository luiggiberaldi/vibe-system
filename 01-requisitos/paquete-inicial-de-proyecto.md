# Paquete Inicial de Proyecto — Vibe System Starter Kit

> **Estado:** ACTIVO  
> **Tipo:** guía de empaquetado y arranque acelerado de proyectos  
> **Fuente de verdad:** Sí, para la inicialización de nuevos proyectos  
> **Responsable:** Luigi  
> **Clasificación:** INTERNA  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  

---

## 0. Propósito

Este documento especifica los archivos y carpetas que conforman el **Starter Kit oficial de Vibe System**. Define qué debe copiarse para arrancar un proyecto nuevo desde cero y el checklist de configuración inicial para estar operando en menos de 10 minutos con orden absoluto.

> **Vías de incorporación:** este paquete cubre la **Vía A (proyecto desde cero)**. Para adoptar un proyecto **no creado por el sistema** (Vía B), el orden obligatorio es: auditoría E2E del código ([template-auditoria-codigo-heredado](../11-auditorias/template-auditoria-codigo-heredado.md)) → plan de adecuación ([template-plan-adecuacion](template-plan-adecuacion.md)) → Etapa 0-B. Ver [ciclo-de-vida-de-proyecto.md](ciclo-de-vida-de-proyecto.md) §0-bis.

---

## 1. Contenido del Starter Kit

Al crear un nuevo proyecto (cliente, personal o producto), se copia la siguiente estructura base:

```text
[raiz-del-proyecto]/
├── README.md                              (Guía de bienvenida del proyecto)
├── fuentes-principales/
│   ├── agent.md                           (Reglas para la IA del proyecto)
│   ├── inteligencia.md                    (Memoria activa e índice operativo)
│   └── bitacora.md                        (Historial cronológico de sesiones)
├── 00-control/
│   ├── convenciones.md                    (Nombres, IDs, rutas y reglas de Git)
│   ├── definition-of-ready.md             (Gate previo a codificar)
│   ├── definition-of-done.md              (Gate para cerrar tareas)
│   ├── estados-del-trabajo.md             (Estados normativos del flujo)
│   ├── glosario.md                        (Vocabulario común)
│   ├── pre-commit-gate-checklist.md       (Filtro antes de guardar cambios)
│   ├── template-cambio-de-alcance.md      (Plantilla RFC de cambios)
│   └── template-issue.md                  (Plantilla de incidencias)
├── 01-requisitos/                         (Especificaciones del producto)
├── 02-decisiones/
│   └── ADR-000-template.md               (Plantilla de decisiones arquitectónicas)
├── 03-arquitectura/                       (Planos técnicos del producto)
├── 04-ia/                                 (Prompts y adaptadores si aplican)
├── 05-ux/                                 (Flujos, interacción y diseño de pantallas)
├── 06-calidad/                            (Matrices de validación)
├── 07-operacion/
│   └── verify-gates.sh                   (Suite de gates heredada del core, parametrizada al proyecto)
├── 08-legal-y-confianza/                  (Términos y privacidad)
├── 09-riesgos/                            (Registro de riesgos del proyecto)
├── 10-tests/
│   ├── template-tests.md                 (Plantilla de planes de prueba de producto)
│   ├── template-plan-pruebas.md          (Plantilla del plan de pruebas de gates, heredada del core)
│   └── plan-pruebas.md                   (Plan de pruebas del proyecto, relleno en el Paso 6)
├── 11-auditorias/
│   └── template-auditoria.md             (Plantilla de informe de auditoría)
├── 12-runbooks/
│   └── template-runbook.md               (Plantilla de procedimientos)
├── 13-investigacion/
│   └── borradores/                        (Notas de ideación y research)
└── 14-entregas/                           (Releases y changelogs)
```

---

## 2. Checklist de Puesta en Marcha (Setup en 10 Minutos)

Para inicializar un proyecto nuevo, Luigi o la IA ejecutan los siguientes 6 pasos. **Vía rápida recomendada (Paso 0):** un solo comando hace los pasos 1, 2, 5 y 6 automáticamente:

```bash
bash <core>/07-operacion/init-vibe-project.sh <nombre-proyecto> [prefijo] [destino]
# Ejemplo: bash init-vibe-project.sh mi-tienda TIED
```

El script crea el árbol de 16 carpetas (con anclas), siembra tríada y control compactos parametrizados, instala `verify-gates.sh` y el workflow de CI, hace el commit fundacional y valida los gates en verde. Los pasos manuales quedan como alternativa o para personalizar:

- [ ] **Paso 1: Copia de estructura**  
  Copiar el árbol de carpetas y archivos base en el nuevo directorio de trabajo.
- [ ] **Paso 2: Configurar `00-control/convenciones.md`**  
  Rellenar el nombre del proyecto, repositorio remoto, responsable humano (Luigi) y prefijo de identificadores.
- [ ] **Paso 3: Inicializar `fuentes-principales/inteligencia.md`**  
  Escribir el resumen de 2 párrafos indicando qué se va a construir, cuál es el resultado esperado de la fase inicial y qué límites críticos aplican.
- [ ] **Paso 4: Abrir la primera entrada en `fuentes-principales/bitacora.md`**  
  Registrar la sesión fundacional con el formato estándar: objetivo, hecho, decisiones iniciales y siguiente paso.
- [ ] **Paso 5: Git Init y Primer Commit**  
  Ejecutar `git init`, agregar un `.gitignore` apropiado (con `.env` bloqueado) y realizar el commit inicial de infraestructura documental.
- [ ] **Paso 6: Configurar y validar la suite de gates**  
  Editar los parámetros de `07-operacion/verify-gates.sh` (nombre del proyecto y prefijo de IDs), copiar `10-tests/template-plan-pruebas.md` como `10-tests/plan-pruebas.md`, ejecutar `bash 07-operacion/verify-gates.sh` y registrar la primera corrida verde (EXIT=0) en dicho plan. Este gate queda como obligatorio pre-push del proyecto.
