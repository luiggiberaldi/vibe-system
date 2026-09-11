# Anexos de la Bitácora — Vibe System

> **Estado:** ACTIVO  
> **Propósito:** archivo histórico de entradas rotadas desde `../bitacora.md`  
> **Regla de rotación:** conforme a ADR-004 (clase *registro anexo*, append-only sin techo duro)  
> **Responsable:** Luigi · **Clasificación:** INTERNA · **Creado:** 2026-09-11

## Regla de rotación

1. `../bitacora.md` conserva una **ventana activa** con las entradas recientes y un índice de anexos; no tiene techo duro, pero cuando la lectura de la sesión actual se vuelva difícil (referencia orientativa: ~400 líneas), se rotan las entradas más antiguas aquí.
2. Las entradas se mueven **sin editar su contenido** (append-only): se copian tal cual y se retiran del archivo activo.
3. Cada anexo cubre un período: `bitacora-2026-H2.md`, `bitacora-2027-H1.md`, etc.
4. El archivo activo mantiene la sección "Lectura rápida del estado actual" siempre vigente; los anexos no se actualizan.

## Índice de anexos

| Anexo | Período | Entradas |
|---|---|---|
| (vacío — aún no hay rotaciones) | — | — |
