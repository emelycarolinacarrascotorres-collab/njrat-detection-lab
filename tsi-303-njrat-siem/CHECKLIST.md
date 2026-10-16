# Checklist de pendientes y validaciones

## Validaciones realizadas antes de entregar este repositorio

- [x] Estructura de carpetas creada completa.
- [x] Todos los documentos de `docs/` tienen contenido real (ninguno vacío).
- [x] Las 20 capturas de pantalla proporcionadas están copiadas y
      renombradas de forma descriptiva dentro de `evidence/`.
- [x] Cada captura referenciada en `docs/` y en `evidence/README.md`
      existe físicamente en el repositorio.
- [x] Los enlaces relativos entre documentos usan rutas `../` correctas
      desde `docs/` hacia `evidence/`, `reports/`, `commands/`.
- [x] Los scripts de PowerShell y Bash no contienen credenciales ni
      acciones destructivas; se revisaron manualmente línea por línea.
- [x] No se incluyó el binario `Server.exe` ni ninguna muestra ejecutable
      del RAT.
- [x] Datos no confirmados por evidencia (configuración exacta de Sysmon,
      XML de reglas personalizadas) se marcaron explícitamente como
      `PENDIENTE DE VERIFICACIÓN`. La IP del servidor Wazuh y el estado de
      `auditpol` sí quedaron confirmados por captura.

## Pendientes para el autor antes de publicar

- [ ] Decidir si el repositorio se publica como **privado** (recomendado,
      dado que contiene evidencia de uso real de un RAT) o público.
- [ ] Si se publica público: difuminar o recortar el usuario `emely` y el
      hostname `DESKTOP-KGAS8P5` visibles en varias capturas.
- [ ] Completar, si se desea, las evidencias aún pendientes listadas en
      `reports/evidence-matrix.md` (configuración de Sysmon, XML de las
      reglas personalizadas).
- [ ] Reemplazar `<url-de-tu-repo>` en el `README.md` por la URL real una
      vez creado el repositorio remoto.
- [ ] Verificar que el nombre de usuario de GitHub y el nombre del
      repositorio no expongan la matrícula si se prefiere mantenerla
      privada.

## No verificable con el material disponible

- Contenido del archivo de configuración de Sysmon.
- XML de las reglas personalizadas 100100 / 100102 en Wazuh.
- Alerta específica del cambio en la clave `Run` dentro del SIEM (no perseguida en esta entrega).
