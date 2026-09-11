# Protocolo Anti-Alucinaciones — Vibe System

> **Estado:** ACTIVO  
> **Tipo:** guía de verificación determinista y mitigación de errores para agentes de IA  
> **Fuente de verdad:** Sí, para el estándar de confiabilidad en generación asistida  
> **Responsable:** Luigi  
> **Clasificación:** INTERNA  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  

---

## 0. Propósito

Este documento describe el **protocolo sistemático para prevenir, detectar y erradicar alucinaciones** en el desarrollo asistido por IA. Establece las disciplinas que tanto la IA como Luigi aplican antes de aceptar cualquier propuesta o línea de código.

---

## 1. Los 5 Modos de Alucinación Comunes y sus Antídotos

| Modo de Alucinación | Síntoma Típico | Antídoto Obligatorio en Vibe System |
|---|---|---|
| **1. Dependencia Fantasma** | La IA importa una librería o paquete que no está instalado en `package.json` o `requirements.txt`. | **Verificación previa:** La IA debe inspeccionar el archivo de manifiesto antes de proponer un `import`. |
| **2. Firma de API Inventada** | La IA asume que un método externo tiene ciertos parámetros o retorna cierta estructura sin verificarlo. | **Inspección de tipos / docs:** Verificar los tipos en `.d.ts`, esquemas OpenAPI o documentación oficial antes de redactar la llamada. |
| **3. Reinvención de Rueda** | La IA crea una función de utilidad que ya existe en el proyecto con otro nombre. | **Grep / Búsqueda previa:** Búsqueda previa en el repositorio para reusar código existente. |
| **4. Falso Positivo de Éxito** | La IA dice "El código está listo y probado" sin haber ejecutado ningún test. | **Evidencia objetiva:** Toda afirmación de éxito debe incluir el output del terminal o runner de pruebas. Sin log de ejecución, el estado es `EN_REVISION`. |
| **5. Dilución de Requisitos** | La IA "olvida" un caso de borde porque la conversación se alargó. | **DoR explícito:** Los criterios de aceptación están en la tarea (`T-xxx`), no en la memoria volátil del chat. |

---

## 2. Clasificación Obligatoria de Afirmaciones

Para evitar que las suposiciones se conviertan silenciosamente en código defectuoso, la IA debe etiquetar internamente o en sus explicaciones:

- `[HECHO VERIFICADO]`: Comprobado con lectura directa de archivo, prueba que pasa o comando ejecutado.
- `[SUPUESTO]`: Asunción razonable pero no comprobada aún con código o pruebas.
- `[PROPUESTA]`: Opción de diseño sugerida que requiere la aprobación formal de Luigi.
- `[DESCONOCIDO]`: Falta información; la IA debe detenerse y preguntar en vez de inventar.

---

## 3. Principio de Parada Segura (Stop & Ask)

Si durante la ejecución de una tarea la IA detecta que:
1. Un archivo no existe donde la documentación indicaba.
2. Dos documentos se contradicen.
3. El cambio requerido romperá una interfaz pública existente.
4. El archivo superará las 600 líneas de código.

**Regla de parada:** La IA **no debe asumir ni parchar silenciosamente**. Debe detener su turno, exponer el problema objetivamente a Luigi y presentar las opciones disponibles para su decisión.
