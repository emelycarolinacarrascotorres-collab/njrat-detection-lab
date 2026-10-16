<#
.SINOPSIS
    Recolecta información básica de identificación del sistema.
.DESCRIPCION
    Script de solo lectura. No modifica configuración.
    Permisos: usuario estándar.
#>

Write-Host "=== Información del sistema ===" -ForegroundColor Cyan
Get-ComputerInfo | Select-Object WindowsProductName, OsHardwareAbstractionLayer, CsName | Format-List

Write-Host "=== Usuario actual ===" -ForegroundColor Cyan
whoami

Write-Host "=== Fecha y hora del sistema ===" -ForegroundColor Cyan
Get-Date -Format "dddd, dd 'de' MMMM 'de' yyyy HH:mm:ss"
