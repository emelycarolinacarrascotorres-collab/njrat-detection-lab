<#
.SINOPSIS
    Audita mecanismos comunes de persistencia: claves Run/RunOnce y tareas programadas.
.DESCRIPCION
    Script de solo lectura. No modifica el registro ni el programador de tareas.
    Permisos: usuario estándar (HKCU); se recomienda ejecutar también
    como administrador para cubrir HKLM.
#>

Write-Host "=== HKCU Run / RunOnce ===" -ForegroundColor Cyan
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" 2>$null
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" 2>$null

Write-Host "`n=== HKLM Run / RunOnce (requiere privilegios de lectura) ===" -ForegroundColor Cyan
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" 2>$null
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" 2>$null

Write-Host "`n=== Tareas programadas no estándar (fuera de \Microsoft\) ===" -ForegroundColor Cyan
Get-ScheduledTask | Where-Object { $_.TaskPath -notlike "\Microsoft\*" } |
    Select-Object TaskName, TaskPath, State
