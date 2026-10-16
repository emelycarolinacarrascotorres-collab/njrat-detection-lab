# 12. Problemas y soluciones

## Inconsistencia de reloj / formato de fecha

**Problema:** el log de actividad mostrado en el panel de njRAT usa el
formato `26/10/15` (posiblemente `AA/MM/DD` o un reloj desincronizado de
la VM víctima), mientras que PowerShell y Wazuh reportan fechas en formato
`2026-10-15`. Esto puede generar confusión al correlacionar manualmente
eventos entre el panel del RAT y el dashboard del SIEM.

**Cómo se investigó:** se comparó el timestamp de creación de la conexión
en TCPView (`15/10/2026 21:17:48`) contra el de la alerta 100102 en Wazuh
(`Oct 15, 2026 @ 21:18:06`) — la diferencia de ~18 segundos es coherente
con el tiempo de procesamiento normal del pipeline de ingesta, lo que
confirma que ambos eventos corresponden al mismo hecho real pese a la
diferencia de formato visual entre herramientas.

**Recomendación:** sincronizar el reloj de todas las VM contra una misma
fuente NTP antes de iniciar la práctica, para evitar depender de
correlación manual.

## Agent ID distinto al asumido inicialmente

**Problema:** un borrador de planificación de este proyecto asumía
`agent.id: 003` con hostname `Windows10-emely`. Las capturas reales del
dashboard muestran `agent.id: 004` con hostname `DESKTOP-KGAS8P5`.

**Solución aplicada:** se corrigió toda la documentación para usar los
valores reales observados en pantalla, descartando el dato asumido.

## IP del servidor Wazuh — inicialmente sin capturar, luego resuelta

**Problema:** en una primera versión de este repositorio, ninguna captura
disponible mostraba explícitamente la dirección IP del Ubuntu Server que
aloja Wazuh.

**Solución aplicada:** se incorporó una captura de la barra de direcciones
del navegador al acceder al dashboard (`https://10.6.97.138/...`),
confirmando la IP `10.6.97.138`. Ver
[03-arquitectura-del-laboratorio.md](03-arquitectura-del-laboratorio.md).
