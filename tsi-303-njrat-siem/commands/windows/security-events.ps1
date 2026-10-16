<#
.SINOPSIS
    Verifica la auditoría de creación de procesos y consulta eventos 4688.
.DESCRIPCION
    Script de solo lectura. No modifica la política de auditoría.
    Permisos: ADMINISTRADOR (requerido para leer el log de Seguridad).
.PARAMETER MaxEvents
    Número máximo de eventos 4688 a mostrar (por defecto 10).
#>
param(
    [int]$MaxEvents = 10
)

Write-Host "=== Estado de la auditoría de creación de procesos ===" -ForegroundColor Cyan
auditpol /get /subcategory:"Process Creation"

Write-Host "`n=== Últimos eventos 4688 (creación de proceso) ===" -ForegroundColor Cyan
try {
    Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4688} -MaxEvents $MaxEvents |
        Select-Object TimeCreated, Id, Message | Format-List
} catch {
    Write-Host "No se encontraron eventos 4688 o se requieren privilegios de administrador." -ForegroundColor Yellow
}
