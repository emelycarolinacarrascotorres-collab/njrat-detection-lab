<#
.SINOPSIS
    Verifica el aislamiento de red del laboratorio y conexiones TCP activas.
.DESCRIPCION
    Script de solo lectura. No modifica configuración de red.
    Permisos: usuario estándar.
.PARAMETER PeerIP
    IP de la otra máquina del laboratorio (víctima o atacante) a verificar.
.PARAMETER C2Port
    Puerto sospechoso a filtrar en netstat (opcional, por defecto 1177).
#>
param(
    [string]$PeerIP = "",
    [int]$C2Port = 1177
)

Write-Host "=== Configuración de red ===" -ForegroundColor Cyan
ipconfig /all

Write-Host "`n=== Verificación de aislamiento: sin salida a internet ===" -ForegroundColor Cyan
ping 8.8.8.8 -n 4

if ($PeerIP -ne "") {
    Write-Host "`n=== Verificación de conectividad interna hacia $PeerIP ===" -ForegroundColor Cyan
    ping $PeerIP -n 4
}

Write-Host "`n=== Conexiones TCP activas (puerto $C2Port) ===" -ForegroundColor Cyan
netstat -ano | findstr ":$C2Port"

Write-Host "`n=== Todas las conexiones TCP establecidas ===" -ForegroundColor Cyan
netstat -ano | findstr "ESTABLISHED"
