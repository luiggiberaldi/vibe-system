# ADR-002 — Tríada de Memoria Viva y Autoridad Humana Única

> **Estado:** ACEPTADA  
> **Fecha:** 2026-09-11  
> **Responsable:** Luigi  
> **Decisores:** Luigi  
> **Clasificación:** ESTRUCTURAL / GOBIERNO  
> **Versión:** 1.0.0  

---

## 1. Contexto y Problema

El desarrollo iterativo con agentes de Inteligencia Artificial sufre comúnmente de dos fallos en extremos opuestos:
1. **Pérdida de memoria entre turnos:** La ventana de chat se satura, se reinicia o se cambia de modelo, obligando al usuario a volver a explicar el contexto, reglas y estado del proyecto.
2. **Autonomía destructiva (alucinación de decisiones):** Dejar que la IA tome decisiones de arquitectura, cambie reglas de negocio o aplique refactorizaciones mayores sin supervisión termina desvirtuando el propósito del proyecto.

---

## 2. Decisión Tomada

Se decide implementar una **arquitectura de memoria viva tripartita** y el **principio de autoridad humana única**:

1. **La Tríada de Memoria (`fuentes-principales/`):**
   - [`agent.md`](file:///c:/Users/luigg/Desktop/documentos%20de%20facil%20creacion/sistema%20de%20proyectos/fuentes-principales/agent.md): Contrato inmutable de comportamiento y límites para la IA.
   - [`inteligencia.md`](file:///c:/Users/luigg/Desktop/documentos%20de%20facil%20creacion/sistema%20de%20proyectos/fuentes-principales/inteligencia.md): Memoria semántica curada (estado actual, hechos verificados `F-xxx`, decisiones `D-xxx` y bloqueos).
   - [`bitacora.md`](file:///c:/Users/luigg/Desktop/documentos%20de%20facil%20creacion/sistema%20de%20proyectos/fuentes-principales/bitacora.md): Historial cronológico corto de sesiones de trabajo (qué se hizo, evidencia y siguiente paso).

2. **Autoridad Humana Única (Single Human Authority):**
   - **Luigi es la única autoridad decisoria:** La IA actúa como copiloto técnico, investigadora, redactora y asistente de pruebas; nunca aprueba por sí sola cambios de alcance, nuevos requisitos o excepciones de seguridad.
   - Toda entrega de la IA debe responder a las 4 preguntas de control obligatorias.

---

## 3. Alternativas Evaluadas

- **Memoria basada en Vector DB / RAG complejo:** Añade complejidad de infraestructura, costo computacional y opacidad sobre qué datos está recuperando el modelo.
- **Dejar todo en un único prompt gigantesco:** Desborda el límite de atención del modelo y diluye las instrucciones críticas.
- **Tríada en texto plano Markdown (Elegida):** Simple, transparente, editable directamente por Luigi y legible por cualquier LLM.

---

## 4. Consecuencias

### Positivas
- Cualquier IA puede conectarse a un proyecto nuevo y entender su estado exacto en 30 segundos leyendo `bitacora.md` e `inteligencia.md`.
- El humano retiene el control absoluto del rumbo del producto, impidiendo desviaciones no autorizadas.
- Se elimina el retrabajo de tener que re-explicar el contexto en cada sesión.

### Negativas / Compromisos aceptados
- Toda sesión de trabajo relevante exige actualizar `bitacora.md` al cierre, lo cual requiere constancia metodológica.
