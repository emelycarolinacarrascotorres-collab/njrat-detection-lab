<#
.SINOPSIS
    Investiga un proceso por su PID: ruta, firma digital y propiedad.
.DESCRIPCION
    Script de solo lectura. No modifica ni detiene procesos.
    Permisos: usuario estándar (consultar firma no requiere admin).
.PARAMETER ProcessId
    PID del proceso a investigar (ej. obtenido de netstat).
#>
param(
    [Parameter(Mandatory=$true)]
    [int]$ProcessId
)

Write-Host "=== Información del proceso PID $ProcessId ===" -ForegroundColor Cyan
Get-Process -Id $ProcessId | Select-Object Id, ProcessName, Path, Company, StartTime | Format-List

Write-Host "=== Firma digital del ejecutable ===" -ForegroundColor Cyan
$proc = Get-Process -Id $ProcessId -ErrorAction SilentlyContinue
if ($proc -and $proc.Path) {
    Get-AuthenticodeSignature -FilePath $proc.Path | Select-Object Status, SignerCertificate
} else {
    Write-Host "No se pudo obtener la ruta del proceso (puede requerir permisos elevados)." -ForegroundColor Yellow
}
