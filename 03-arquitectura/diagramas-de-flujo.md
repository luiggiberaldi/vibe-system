# Diagramas de Flujo del Sistema — Vibe System

> **Estado:** ACTIVO  
> **Tipo:** especificación visual y planos de flujo de procesos  
> **Fuente de verdad:** Sí, para la representación gráfica de flujos y ciclos  
> **Responsable:** Luigi  
> **Clasificación:** INTERNA  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  

---

## 0. Propósito

Este documento reúne el **atlas visual oficial de Vibe System**, modelado íntegramente en Mermaid. Proporciona una referencia visual inmediata de cómo transitan los proyectos, cómo interactúa Luigi con los agentes de IA en el día a día y cómo fluye la memoria a través de las capas del sistema.

---

## 1. Diagrama de Macroflujo: Ciclo de Vida del Proyecto

Muestra la secuencia de maduración desde la concepción inicial de una idea hasta la entrega y empaquetado del software:

```mermaid
flowchart TD
    subgraph FASE1["1. Ideación & Descubrimiento"]
        A["Borrador / Entrevista inicial (13-investigacion/)"] --> B["Delimitación de Alcance y Exclusiones"]
        B --> C["Extracción de Hechos e Hipótesis a inteligencia.md"]
    end

    subgraph FASE2["2. Cimentación Documental"]
        C --> D["Clonar Starter Kit de Vibe System"]
        D --> E["Activar Tríada: agent.md, inteligencia.md, bitacora.md"]
        E --> F["Configurar convenciones.md y Plano de Arquitectura"]
        F --> G{"¿Luigi aprueba diseño inicial?"}
        G -- No --> F
    end

    subgraph FASE3["3. Desglose en Tareas y Gate DoR"]
        G -- Sí --> H["Desglosar trabajo en tareas atómicas (T-xxx)"]
        H --> I{"Gate DoR: ¿Cumple criterios de Ready?"}
        I -- No (Bloqueado) --> J["Refinar tarea / Completar requisitos"]
        J --> I
    end

    subgraph FASE4["4. Construcción Determinista"]
        I -- Sí (EN_PROGRESO) --> K["IA consulta agent.md y fuentes de verdad"]
        K --> L["Edición quirúrgica de código (< 600 líneas)"]
        L --> M["Redacción de pruebas automáticas (10-tests/)"]
    end

    subgraph FASE5["5. Validación DoD, Auditoría & Cierre"]
        M --> N{"Pre-Commit Gate: ¿Compila, pasan tests y 0 secretos?"}
        N -- Falló --> L
        N -- Pasó --> O{"Gate DoD: ¿Aprobado por Luigi?"}
        O -- No --> K
        O -- Sí (COMPLETADO) --> P["Asentar sesión en bitacora.md e inteligencia.md"]
        P --> Q["Empaquetar Release (14-entregas/)"]
    end
```

---

## 2. Diagrama de Microflujo: Protocolo de Sesión Diaria (Luigi ↔ IA)

Modela el protocolo de ejecución quirúrgica que la IA aplica en cada turno de trabajo para evitar alucinaciones y amnesia:

```mermaid
flowchart TD
    START(["Inicio de Sesión"]) --> READ1["1. IA lee última entrada de bitacora.md (recupera contexto temporal)"]
    READ1 --> READ2["2. IA revisa inteligencia.md (hechos F-xxx, decisiones D-xxx y bloqueos)"]
    READ2 --> SELECT["3. Selección de Tarea Atómica (T-xxx)"]
    
    SELECT --> CHECK_DOR{"¿Tarea cumple Definition of Ready?"}
    CHECK_DOR -- No --> FIX_DOR["Completar criterios de aceptación (Dado/Cuando/Entonces)"]
    FIX_DOR --> CHECK_DOR
    
    CHECK_DOR -- Sí --> CODE["4. IA ejecuta cambio mínimo necesario (< 600 líneas)"]
    CODE --> TEST["5. Ejecución de pruebas y validaciones en servidor"]
    
    TEST --> GATE_COMMIT{"Pre-Commit Gate Checklist"}
    GATE_COMMIT -- "Error / Secretos / Lint" --> CODE
    GATE_COMMIT -- "Aprobado" --> QUESTIONS["6. IA responde las 4 Preguntas de Control:
- ¿Qué cambió?
- ¿Por qué cambió?
- ¿Cómo sabemos que no rompió nada?
- ¿Qué documento se actualizó?"]
    
    QUESTIONS --> HUMAN_REVIEW{"¿Luigi aprueba la entrega?"}
    HUMAN_REVIEW -- "Ajustes" --> CODE
    HUMAN_REVIEW -- "Aprobado" --> LOG_BITACORA["7. Asentar entrada en bitacora.md y actualizar hechos en inteligencia.md"]
    LOG_BITACORA --> END(["Fin de Sesión / Tarea Cerrada"])
```

---

## 3. Diagrama de Flujo de Información entre Carpetas

Ilustra la circulación de contratos y evidencia para preservar la ventana de tokens:

```mermaid
flowchart LR
    subgraph MEMORIA["Capa 0: Memoria Viva (fuentes-principales/)"]
        direction TB
        AG["agent.md
(Reglas de engagement y límites IA)"]
        INT["inteligencia.md
(Contexto curado, hechos, decisiones)"]
        BIT["bitacora.md
(Diario cronológico de sesiones)"]
    end

    subgraph CONTROL["Capa 1: Control (00-control/)"]
        direction TB
        DOR["definition-of-ready.md"]
        DOD["definition-of-done.md"]
        GATE["pre-commit-gate-checklist.md"]
        EST["estados-del-trabajo.md"]
    end

    subgraph INGENIERIA["Capas Técnicas (01 a 09)"]
        direction TB
        REQ["01-requisitos/
(Visión y casos de uso)"]
        ADR["02-decisiones/
(ADRs inmutables)"]
        ARQ["03-arquitectura/
(Planos técnicos)"]
        RSK["09-riesgos/
(Matriz de mitigación)"]
    end

    subgraph VERIFICACION["Capa de Evidencia (10 a 14)"]
        direction TB
        TST["10-tests/
(Suites reproducibles)"]
        AUD["11-auditorias/
(Certificación formal)"]
        REL["14-entregas/
(Release Notes)"]
    end

    MEMORIA <--> CONTROL
    CONTROL --> INGENIERIA
    INGENIERIA --> VERIFICACION
    VERIFICACION --> MEMORIA
```

---

## 4. Diagrama de Transición de Estados del Trabajo

Representa la máquina de estados formal normada en PAR-04:

```mermaid
stateDiagram-v2
    [*] --> IDEA: Propuesta inicial
    IDEA --> ESPECIFICADO: Redacción de criterios
    ESPECIFICADO --> EN_PROGRESO: Pasa Gate DoR
    EN_PROGRESO --> EN_REVISION: Código + Tests listos
    EN_REVISION --> EN_PROGRESO: Corrección de fallos
    EN_REVISION --> COMPLETADO: Pasa Gate DoD y Aprobación
    
    EN_PROGRESO --> BLOQUEADO: Dependencia o riesgo
    BLOQUEADO --> EN_PROGRESO: Desbloqueo verificado
    
    IDEA --> DEPRECADO: Descarte explícito
    ESPECIFICADO --> DEPRECADO: Sustitución
    COMPLETADO --> [*]
```
