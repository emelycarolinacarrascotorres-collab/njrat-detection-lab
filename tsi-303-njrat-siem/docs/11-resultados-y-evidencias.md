# 11. Resultados y evidencias

## Resumen de lo comprobado

| # | Resultado | Confirmado por | Evidencia |
|---|---|---|---|
| 1 | Aislamiento de red del laboratorio | `ping` en ambas VM | `evidence/network-isolation/` |
| 2 | Conexión C2 establecida en puerto 1177 | Panel njRAT, TCPView, netstat | `evidence/rat-panel/01`, `evidence/sysinternals/01-02` |
| 3 | Mínimo 3 capacidades del RAT demostradas | Panel njRAT | `evidence/rat-panel/02-06` |
| 4 | Proceso del troyano identificado | Process Explorer | `evidence/sysinternals/03` |
| 5 | Persistencia localizada y confirmada por 2 métodos | Autoruns, `reg query` | `evidence/persistence/01-02` |
| 6 | SIEM operativo (manager/indexer/dashboard), IP `10.6.97.138` | `systemctl status`, URL del dashboard | `evidence/wazuh/01-03`, `evidence/architecture/01` |
| 7 | Alerta de ejecución sin firma en el SIEM | Dashboard Wazuh (rule.id 100100) | `evidence/wazuh/04` |
| 8 | Alerta de conexión C2 en el SIEM | Dashboard Wazuh (rule.id 100102) | `evidence/wazuh/05` |
| 9 | Auditoría de creación de procesos activa en la víctima | `auditpol /get` — "Creación del proceso": Aciertos | `evidence/windows-auditing/01` |

## Lo que no se pudo verificar con el material disponible

| Punto | Estado |
|---|---|
| Alerta específica sobre el cambio en la clave `Run` dentro del SIEM | No perseguida en esta entrega |
| Contenido del XML de las reglas personalizadas 100100/100102 | PENDIENTE DE VERIFICACIÓN |
| Configuración exacta (.xml) de Sysmon instalada | PENDIENTE DE VERIFICACIÓN |
| Otras vías de persistencia (tareas programadas, servicios) | No exploradas |

Ver la matriz completa con estados en
[`reports/evidence-matrix.md`](../reports/evidence-matrix.md).
