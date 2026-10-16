# Comandos de comprobación defensiva

Scripts y comandos usados o recomendados para reproducir la investigación
defensiva de este laboratorio. Son de **solo lectura/diagnóstico**: no
modifican configuración del sistema ni descargan contenido externo.

## Windows (PowerShell, salvo que se indique CMD)

| Script | Objetivo | Permisos |
|---|---|---|
| [`windows/system-information.ps1`](windows/system-information.ps1) | Identificar el sistema (SO, hostname, usuario) | Usuario estándar |
| [`windows/network-investigation.ps1`](windows/network-investigation.ps1) | Adaptadores, conectividad, conexiones TCP activas | Usuario estándar |
| [`windows/process-investigation.ps1`](windows/process-investigation.ps1) | Procesos por PID, ruta del ejecutable, firma digital | Usuario estándar (firma digital puede requerir admin en algunos casos) |
| [`windows/persistence-audit.ps1`](windows/persistence-audit.ps1) | Claves Run/RunOnce y tareas programadas | Usuario estándar |
| [`windows/security-events.ps1`](windows/security-events.ps1) | Estado de auditoría y consulta de eventos 4688 | **Administrador** |

### Ejecución

```powershell
# Desde PowerShell, en la carpeta commands/windows:
.\system-information.ps1
```

Si PowerShell bloquea la ejecución de scripts locales:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

(afecta solo la sesión actual, no cambia la política del sistema).

## Linux (Ubuntu Server — servidor Wazuh)

| Script | Objetivo | Permisos |
|---|---|---|
| [`linux/wazuh-health-check.sh`](linux/wazuh-health-check.sh) | Estado de manager/indexer/dashboard y conectividad de red | `sudo` para `systemctl status` |
| [`linux/wazuh-agent-status.sh`](linux/wazuh-agent-status.sh) | Lista de agentes registrados y su estado | Requiere `wazuh-control` / API de Wazuh |

### Ejecución

```bash
chmod +x linux/wazuh-health-check.sh
./linux/wazuh-health-check.sh
```

## Precauciones generales

- Ningún script de este repositorio contiene credenciales, tokens ni
  claves. Si se usa `wazuh-agent-status.sh` contra la API, el usuario
  debe suministrar sus propias credenciales de forma interactiva o por
  variable de entorno — nunca hardcodeadas.
- Los scripts no instalan, descargan ni ejecutan software adicional.
- `security-events.ps1` requiere privilegios de administrador porque
  consulta el log de Seguridad de Windows; no modifica la política de
  auditoría, solo la consulta.
