# Evento Windows 4688 — Creación de proceso

| Campo | Detalle |
|---|---|
| Event ID | 4688 |
| Log | Security |
| Requiere | Política de auditoría "Audit Process Creation" habilitada |
| Qué reporta | Nombre del nuevo proceso, PID, proceso padre, (opcional) línea de comandos |

## Relevancia para esta práctica

El patrón esperado para la infección documentada es: creación de un
proceso llamado `Server.exe`, con proceso padre correspondiente al método
de ejecución usado por el atacante, ubicado en
`C:\Users\emely\AppData\Local\Temp\`.

## Estado de verificación

`PENDIENTE DE VERIFICACIÓN` — no se dispone de una captura de
`Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4688}` que muestre
específicamente la creación de `Server.exe` por su ID de evento nativo de
Windows. La detección confirmada en este repositorio proviene del
pipeline Sysmon → Wazuh (ver [sysmon-events.md](sysmon-events.md)), no
del log de Seguridad nativo.

## Comando de verificación

```powershell
auditpol /get /subcategory:"Process Creation"
Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4688} -MaxEvents 20 |
    Where-Object { $_.Message -like "*Server.exe*" }
```
