# Índice de evidencias

Todas las imágenes son capturas de pantalla reales tomadas durante la
ejecución del laboratorio el **15 de octubre de 2026**. No se incluyen
imágenes ilustrativas ni generadas artificialmente.

## evidence/network-isolation/

| Archivo | Equipo | Herramienta | Qué demuestra | Documentado en |
|---|---|---|---|---|
| 01-ipconfig-victima.png | Víctima | PowerShell (`ipconfig /all`) | IP 10.6.97.137 | docs/04 |
| 02-ping-aislamiento-victima.png | Víctima | PowerShell (`ping`) | Sin salida a internet, sí ve al atacante | docs/04 |
| 03-ipconfig-atacante.png | Atacante | PowerShell (`ipconfig /all`) | IP 10.6.97.139 | docs/04 |
| 04-ping-aislamiento-atacante.png | Atacante | PowerShell (`ping`) | Sin salida a internet, sí ve a la víctima | docs/04 |

## evidence/rat-panel/

| Archivo | Equipo | Herramienta | Qué demuestra | Documentado en |
|---|---|---|---|---|
| 01-njrat-panel-victima-conectada.png | Atacante | Panel njRAT v0.7d | Víctima conectada, hostname/usuario/SO/AV | docs/06 |
| 02-njrat-menu-capacidades.png | Atacante | Panel njRAT | Menú de capacidades disponibles | docs/06 |
| 03-explorador-remoto-vacio.png | Atacante→Víctima | Explorador remoto del RAT | Navegación del sistema de archivos | docs/06 |
| 04-explorador-remoto-herramientas.png | Atacante→Víctima | Explorador remoto del RAT | Herramientas de Sysinternals depositadas | docs/06 |
| 05-panel-conexiones-tcp.png | Atacante | Panel njRAT — pestaña Conexiones | Conexión TCP vista desde el panel | docs/06 |
| 06-log-actividad-victima.png | Atacante→Víctima | Log del RAT | Línea de tiempo de acciones en la víctima | docs/06 |

## evidence/sysinternals/

| Archivo | Equipo | Herramienta | Qué demuestra | Documentado en |
|---|---|---|---|---|
| 01-tcpview-server-exe-establecido.png | Víctima | TCPView | Conexión ESTABLISHED al C2 | docs/07 |
| 02-netstat-conexion-c2.png | Víctima | PowerShell (`netstat -ano`) | Confirmación por línea de comandos | docs/07 |
| 03-process-explorer-server-exe.png | Víctima | Process Explorer | Árbol de procesos, Server.exe sin Company Name | docs/07 |

## evidence/persistence/

| Archivo | Equipo | Herramienta | Qué demuestra | Documentado en |
|---|---|---|---|---|
| 01-autoruns-entrada-server.png | Víctima | Autoruns (pestaña Logon) | Entrada "Server" sin verificar en clave Run | docs/10 |
| 02-reg-query-run-key.png | Víctima | PowerShell (`reg query`) | Confirmación independiente de la misma entrada | docs/10 |

## evidence/wazuh/

| Archivo | Equipo | Herramienta | Qué demuestra | Documentado en |
|---|---|---|---|---|
| 01-wazuh-manager-status.png | Ubuntu Server | `systemctl status wazuh-manager` | Manager activo | docs/08 |
| 02-wazuh-indexer-status.png | Ubuntu Server | `systemctl status wazuh-indexer` | Indexer activo | docs/08 |
| 03-wazuh-dashboard-status.png | Ubuntu Server | `systemctl status wazuh-dashboard` | Dashboard activo | docs/08 |
| 04-alerta-ejecutable-sin-firma.png | Dashboard Wazuh | Discover/Alerts | Alerta rule.id 100100 (ejecución) | docs/08 |
| 05-alerta-conexion-c2-dashboard.png | Dashboard Wazuh | Discover/Alerts | Alerta rule.id 100102 (conexión C2), 83 hits agregados | docs/08 |

## evidence/architecture/

| Archivo | Equipo | Herramienta | Qué demuestra | Documentado en |
|---|---|---|---|---|
| 01-wazuh-dashboard-url-ip.png | Navegador (acceso al dashboard) | Barra de direcciones | IP del servidor Wazuh: 10.6.97.138 | docs/03 |

## evidence/windows-auditing/

| Archivo | Equipo | Herramienta | Qué demuestra | Documentado en |
|---|---|---|---|---|
| 01-auditpol-creacion-proceso.png | Víctima | PowerShell (`auditpol /get`) | Auditoría de "Creación del proceso" habilitada (Aciertos) | docs/09 |

## evidence/sysmon/

**Vacía.** No se capturó la configuración (`.xml`) de Sysmon instalada en
la víctima; solo se confirmó su presencia indirectamente
([`rat-panel/04`](rat-panel/04-explorador-remoto-herramientas.png)).

Ver [`reports/evidence-matrix.md`](../reports/evidence-matrix.md).

## Aviso de privacidad

Las capturas incluyen el nombre de usuario (`emely`) y el hostname
(`DESKTOP-KGAS8P5`) de la máquina víctima de forma visible. Si este
repositorio se publica fuera de un entorno privado/académico, se
recomienda difuminar esos valores o mantener el repositorio como privado.
