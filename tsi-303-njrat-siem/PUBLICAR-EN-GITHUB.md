# Instrucciones para publicar este proyecto en GitHub

## 1. Revisar el contenido antes de publicar

Lee [`CHECKLIST.md`](CHECKLIST.md) completo, especialmente los puntos
sobre privacidad (usuario y hostname visibles en las capturas).

## 2. Crear el repositorio en GitHub

1. Entra a https://github.com/new
2. Nombre sugerido: `tsi-303-njrat-siem`
3. Visibilidad: **Private** (recomendado) o Public si ya revisaste la
   privacidad de las capturas.
4. No inicialices con README, licencia ni .gitignore (ya existen aquí).

## 3. Subir el contenido

Desde la carpeta extraída del ZIP:

```bash
cd tsi-303-njrat-siem
git init
git add .
git commit -m "Documentación completa: laboratorio njRAT y detección con SIEM"
git branch -M main
git remote add origin https://github.com/<tu-usuario>/tsi-303-njrat-siem.git
git push -u origin main
```

## 4. Después de publicar

- Actualiza el placeholder `<url-de-tu-repo>` en `README.md` con la URL real.
- Si el repositorio es privado y necesitas compartirlo con el profesor,
  añádelo como colaborador desde Settings → Collaborators, en lugar de
  hacerlo público.

Este repositorio **no se publica automáticamente**: estos pasos requieren
que tú los ejecutes y confirmes.
