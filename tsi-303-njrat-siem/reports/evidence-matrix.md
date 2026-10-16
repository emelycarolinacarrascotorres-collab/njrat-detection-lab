# Matriz de evidencias

| Requisito | Evidencia disponible | Resultado verificado | Estado | Pendiente |
|---|---|---|---|---|
| Aislamiento de red (sin salida a internet) | `evidence/network-isolation/02`, `04` | 100% pérdida a 8.8.8.8 en víctima y atacante | COMPLETADO | — |
| Conectividad interna entre VM | `evidence/network-isolation/02`, `04` | 0% pérdida, TTL=128 entre `.137` y `.139` | COMPLETADO | — |
| Generación del servidor njRAT y puerto documentado | `evidence/rat-panel/01` | Puerto 1177 confirmado en panel | COMPLETADO | — |
| Mínimo 3 capacidades del RAT demostradas | `evidence/rat-panel/02-06` | Explorador remoto, gestión de archivos, verificación de conexión | COMPLETADO | Webcam/micrófono/keylogger no ejercidos (no requeridos) |
| Persistencia localizada | `evidence/persistence/01-02` | Clave `HKCU\...\Run`, valor `Server` → `%TEMP%\Server.exe` | COMPLETADO | Otras vías (tareas, servicios) no exploradas |
| TCPView — conexión C2 | `evidence/sysinternals/01-02` | TCP `.137:50205 → .139:1177 ESTABLISHED`, PID 4912 | COMPLETADO | — |
| Process Explorer — árbol y propiedades | `evidence/sysinternals/03` | `Server.exe` sin Company Name, sin firma | COMPLETADO | No se consultó hash/VirusTotal |
| Autoruns — entrada de persistencia | `evidence/persistence/01` | Entrada "Server" (Not Verified) | COMPLETADO | — |
| SIEM instalado y apuntando a la víctima | `evidence/wazuh/01-03`, `evidence/architecture/01` | 3 servicios activos; agente `004` registrado; IP del servidor `10.6.97.138` | COMPLETADO | — |
| Evento de creación de proceso en el SIEM | `evidence/wazuh/04` | Alerta rule.id 100100, nivel 12 | COMPLETADO | Basado en Sysmon, no en 4688 nativo confirmado por captura |
| Cambio en clave Run visible en el SIEM | — | — | NO REALIZADO | No se persiguió esta evidencia para esta entrega |
| Conexión saliente al C2 en el SIEM | `evidence/wazuh/05` | Alerta rule.id 100102, nivel 13; 83 hits agregados | COMPLETADO | — |
| Explicación de la regla/búsqueda usada | `detections/wazuh-searches.md` | Filtros de Discover documentados | COMPLETADO | XML de `local_rules.xml` no disponible |
| Cadena de ataque y contramedidas (5 eslabones) | `docs/13-conclusiones.md` | Tabla completa con los 5 eslabones | COMPLETADO | Eslabón "Entrega" no evaluado (fuera de alcance) |
| Auditoría nativa de Windows (4688) | `evidence/windows-auditing/01` | `auditpol` — "Creación del proceso": Aciertos habilitado | COMPLETADO | — |
| Configuración de Sysmon | `evidence/rat-panel/04` (solo presencia de carpeta) | Herramienta presente en el escritorio | PARCIAL | Archivo de configuración XML no documentado |

## Leyenda de estados

- **COMPLETADO** — evidencia directa disponible y consistente con lo afirmado.
- **PARCIAL** — hay evidencia indirecta o incompleta.
- **PENDIENTE** — se identificó la necesidad pero no hay evidencia capturada.
- **NO REALIZADO** — explícitamente fuera del alcance de esta práctica.
- **NO VERIFICABLE** — no se puede confirmar ni descartar con el material disponible.
