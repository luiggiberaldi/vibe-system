# Origen y Génesis de Vibe System

> **Estado:** ARCHIVADO / HISTÓRICO  
> **Tipo:** investigación y notas de concepción  
> **Fuente de verdad:** No; documento de referencia histórica  
> **Responsable:** Luigi  
> **Versión:** 1.0.0  
> **Fecha:** 2026-09-11  

---

## 0. Contexto de Nacimiento

Durante los primeros experimentos de desarrollo asistido por modelos de lenguaje (LLMs), surgió un patrón recurrente de fallos:
1. **Pérdida de contexto:** Las IAs olvidan decisiones tomadas en turnos anteriores debido a la limitación y degradación de la ventana de contexto.
2. **Alucinaciones en cascada:** Una asunción no verificada en un archivo genera errores que se propagan al resto del código.
3. **Desincronización:** El código avanza a un ritmo más rápido que la documentación, haciendo imposible auditar qué se hizo, por qué se hizo y si rompió algo preexistente.
4. **Acoplamiento de proyectos:** Intentar documentar una metodología reusable al mismo tiempo que se construye un producto específico conduce inevitablemente a la contaminación de parámetros.

---

## 1. La Separación Fundamental

En septiembre de 2026, Luigi identificó la necesidad imperativa de escindir la metodología de cualquier caso de uso particular:
- **Vibe System (sistema de proyectos):** Es el meta-sistema operativo, el conjunto de reglas, flujos, parámetros y plantillas que rigen CÓMO se construye software asistido por IA de forma determinista y sin deuda técnica.
- **Proyectos de Aplicación:** Son los desarrollos individuales (aplicaciones cliente, prototipos, juegos) que consumen e implementan Vibe System como estándar operativo.

---

## 2. Principios Fundacionales Destilados

De las sesiones de ideación surgieron los pilares inquebrantables de Vibe System:
1. **Gobierno Humano Único:** Luigi es el único decisor. La IA es copiloto, estructuradora y redactora técnica, no juez ni árbitro.
2. **Tríada de Memoria Viva:** Todo proyecto debe contar con tres archivos centrales sincronizados: gent.md (reglas para la IA), inteligencia.md (memoria curada y contexto condensado) y itacora.md (historial cronológico de sesiones).
3. **Regla de las 600 Líneas:** Archivos modulares y atómicos para que la IA nunca pierda precisión al leer o modificar código y especificaciones.
4. **Gates de Calidad Estrictos:** Ninguna tarea se inicia sin cumplir la *Definition of Ready (DoR)* y ninguna tarea se cierra sin cumplir la *Definition of Done (DoD)*.
5. **Determinismo sobre Opinión:** Toda validación de negocio, seguridad y cálculo debe residir en código y pruebas deterministas, nunca en la interpretación probabilística de un LLM.
