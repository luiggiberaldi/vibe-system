# ADR-003 — Límite Cuantitativo de ~600 Líneas por Archivo

> **Estado:** ACEPTADA  
> **Fecha:** 2026-09-11  
> **Responsable:** Luigi  
> **Decisores:** Luigi  
> **Clasificación:** TÉCNICA / RENDIMIENTO IA  
> **Versión:** 1.0.0  

---

## 1. Contexto y Problema

Las investigaciones empíricas en modelos de lenguaje grande (efecto *Lost in the Middle*, Liu et al.) demuestran que la precisión de recuperación y razonamiento de un LLM se degrada sensiblemente cuando:
1. El archivo que se le proporciona supera un volumen crítico de tokens.
2. Los fragmentos relevantes de información se encuentran enterrados en la mitad de documentos muy extensos.
3. Se solicita a la IA editar o reescribir un archivo de más de 1.000 líneas: la IA suele truncar el código, omitir funciones preexistentes o cometer errores tipográficos por fatiga de contexto.

---

## 2. Decisión Tomada

Se establece como norma cuantitativa de Vibe System el **parámetro PAR-01**:
- **Techo nominal:** Máximo **600 líneas** por archivo operativo (especificaciones, pruebas o código fuente).
- **Umbral de advertencia preventiva:** **500 líneas**. Al alcanzar esta cifra, se debe evaluar la partición en módulos más pequeños coordinados por un índice maestro.
- **Tolerancia máxima excepcional:** **650 líneas**, admitida únicamente para tablas o glosarios consolidados que no requieran edición frecuente.

Si un módulo de código o documento crece más allá de 600 líneas, es mandatorio desglosarlo en componentes atómicos.

---

## 3. Alternativas Evaluadas

- **Sin límite de líneas (Archivos monolíticos):** Resulta en archivos de 2.000 a 4.000 líneas donde la IA gasta miles de tokens por turno, comete alucinaciones de sintaxis y arruina bloques de código existentes.
- **Límite micro (100 líneas):** Provoca sobre-fragmentación excesiva de archivos y demasiada fricción de navegación.
- **Límite de ~600 líneas (Elegido):** Balance óptimo entre completitud de un componente y precisión matemática de los LLMs actuales.

---

## 4. Consecuencias

### Positivas
- Las ediciones de la IA son quirúrgicas, rápidas y fiables, con casi cero incidencia de truncamiento.
- El consumo de tokens por llamada se reduce significativamente.
- Fomenta de forma natural una arquitectura de software limpia, modular y altamente cohesiva.

### Negativas / Compromisos aceptados
- Requiere vigilar la longitud de los archivos y realizar refactorizaciones preventivas antes de rebasar el umbral.
