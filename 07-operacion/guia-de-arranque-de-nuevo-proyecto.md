# Guía de Arranque de Nuevo Proyecto — Vibe System Setup

> **Estado:** ACTIVO  
> **Tipo:** manual operativo paso a paso para inicialización de proyectos  
> **Fuente de verdad:** Sí, para el procedimiento de arranque rápido  
> **Responsable:** Luigi  
> **Clasificación:** INTERNA  
> **Versión:** 1.0.0  
> **Creado:** 2026-09-11  
> **Última actualización:** 2026-09-11  

---

## 0. Propósito

Este runbook operativo permite a Luigi o a un equipo inicializar un **nuevo proyecto de software en menos de 5 minutos**, heredando toda la disciplina, memoria viva, plantillas y gobernanza de Vibe System sin fricción técnica.

---

## 1. Procedimiento de Inicialización Paso a Paso

### Paso 1: Crear el Directorio del Proyecto
En la terminal (PowerShell o Bash), define el nombre del nuevo proyecto y crea su carpeta:

```powershell
$PROJECT_NAME = "mi-nuevo-proyecto"
$DESTINATION = "c:\Users\luigg\Desktop\$PROJECT_NAME"
mkdir $DESTINATION
cd $DESTINATION
```

### Paso 2: Clonar el Starter Kit de Vibe System
Copia las carpetas base desde el repositorio maestro `sistema de proyectos`:

```powershell
$VIBE_CORE = "c:\Users\luigg\Desktop\documentos de facil creacion\sistema de proyectos"

# Copiar carpetas estructurales y plantillas
Copy-Item -Path "$VIBE_CORE\00-control" -Destination "$DESTINATION\00-control" -Recurse
Copy-Item -Path "$VIBE_CORE\fuentes-principales" -Destination "$DESTINATION\fuentes-principales" -Recurse
Copy-Item -Path "$VIBE_CORE\02-decisiones" -Destination "$DESTINATION\02-decisiones" -Recurse
Copy-Item -Path "$VIBE_CORE\10-tests" -Destination "$DESTINATION\10-tests" -Recurse
Copy-Item -Path "$VIBE_CORE\11-auditorias" -Destination "$DESTINATION\11-auditorias" -Recurse
Copy-Item -Path "$VIBE_CORE\12-runbooks" -Destination "$DESTINATION\12-runbooks" -Recurse
New-Item -ItemType Directory -Path "$DESTINATION\07-operacion" -Force | Out-Null
Copy-Item -Path "$VIBE_CORE\07-operacion\template-verify-gates.sh" -Destination "$DESTINATION\07-operacion\verify-gates.sh"

# Crear carpetas funcionales vacías
mkdir "$DESTINATION\01-requisitos"
mkdir "$DESTINATION\03-arquitectura"
mkdir "$DESTINATION\04-ia"
mkdir "$DESTINATION\05-ux"
mkdir "$DESTINATION\06-calidad"
mkdir "$DESTINATION\08-legal-y-confianza"
mkdir "$DESTINATION\09-riesgos"
mkdir "$DESTINATION\13-investigacion\borradores"
mkdir "$DESTINATION\14-entregas"
```

### Paso 3: Inicializar Git y Protección de Secretos
Crea el archivo `.gitignore` fundamental antes del primer commit:

```powershell
Set-Content -Path "$DESTINATION\.gitignore" -Value @"
# Dependencias
node_modules/
dist/
build/
.venv/
__pycache__/

# Variables de entorno y secretos (INNEGOCIABLE)
.env
.env.local
.env.*.local
*.pem
*.key
credentials.json

# Logs y temporales
*.log
.DS_Store
Thumbs.db
"@

git init
```

### Paso 4: Configuración Personalizada en 3 Minutos
Abre el proyecto en tu editor y edita únicamente 3 archivos:

1. **`00-control/convenciones.md`:**  
   Actualiza el nombre del proyecto, autor (Luigi) y prefijo de tareas (`T-PROJ-xxx`).
2. **`fuentes-principales/inteligencia.md`:**  
   Reemplaza el resumen ejecutivo con el objetivo concreto del nuevo producto y sus límites iniciales.
3. **`fuentes-principales/bitacora.md`:**  
   Registra la entrada inaugural: `YYYY-MM-DD — Inicialización de proyecto con Vibe System`.
4. **`07-operacion/verify-gates.sh`:**  
   Configura los 2 parámetros del bloque inicial: `PROYECTO` (nombre corto) y `PREFIJO` (prefijo de IDs, p. ej. `PROJ` para `T-PROJ-xxx`).

### Paso 5: Primer Commit Fundacional
Verifica que no haya secretos expuestos y realiza el commit inaugural:

```powershell
git add .
git commit -m "chore: inicialización de repositorio y control documental bajo Vibe System v1.0.0"
```

### Paso 6: Validación Determinista (Gate Obligatorio)
Ejecuta la suite de gates heredada del core y copia la plantilla del plan de pruebas:

```powershell
bash 07-operacion/verify-gates.sh
Copy-Item -Path "$DESTINATION\10-tests\template-plan-pruebas.md" -Destination "$DESTINATION\10-tests\plan-pruebas.md"
```

- Resultado esperado: **EXIT=0** con 10/10 gates `[PASS]`. Si algún gate falla, corrige antes de continuar.
- Registra la primera corrida en `10-tests/plan-pruebas.md` (sección 7). Este gate queda como **obligatorio pre-push** del proyecto.

---

## 2. Validación de Puesta en Marcha

Antes de pedirle a la IA que comience la Fase 1, confirma este checklist:

- [ ] Las 16 carpetas canónicas existen.
- [ ] La tríada (`agent.md`, `inteligencia.md`, `bitacora.md`) está activa en `fuentes-principales/`.
- [ ] `.gitignore` bloquea explícitamente cualquier variante de archivo `.env`.
- [ ] Git está inicializado con la rama principal en estado limpio.
- [ ] `bash 07-operacion/verify-gates.sh` termina en verde (EXIT=0) con los parámetros del proyecto configurados.
