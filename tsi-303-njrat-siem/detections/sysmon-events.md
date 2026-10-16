# Eventos Sysmon relevantes

| Sysmon Event ID | Nombre | Uso en esta práctica |
|---|---|---|
| 1 | Process Creation | Base de la alerta Wazuh `rule.id 100100` (ejecutable sin firma desde ruta sospechosa) |
| 3 | Network Connection | Base de la alerta Wazuh `rule.id 100102` (conexión saliente al puerto 1177) |
| 13 | Registry value set | Relevante para detectar el cambio en la clave `Run`; no confirmado con una alerta específica en el material disponible (ver limitación en `docs/08-wazuh-y-siem.md`) |

## Evidencia de que Sysmon estaba presente en la víctima

La carpeta `Sysmon` aparece listada en el escritorio de la víctima junto a
las demás herramientas de Sysinternals:
[`evidence/rat-panel/04-explorador-remoto-herramientas.png`](../evidence/rat-panel/04-explorador-remoto-herramientas.png).

No se dispone de captura del archivo de configuración XML usado para
instalarlo, por lo que no se puede confirmar qué nivel de detalle exacto
capturaba (p. ej. si incluía hashing de binarios).
