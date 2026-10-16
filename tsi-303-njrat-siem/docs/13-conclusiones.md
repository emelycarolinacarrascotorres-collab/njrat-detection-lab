# 13. Conclusiones — cadena de ataque y contramedidas

## La cadena de ataque del RAT, eslabón por eslabón

| Eslabón | ¿Se detectó en este laboratorio? | Evidencia | Contramedida que habría cortado la infección en este punto |
|---|---|---|---|
| **1. Entrega** | No evaluado — el binario se transfirió manualmente entre VMs, no se simuló un vector real | — | Filtrado de adjuntos/descargas, listas de bloqueo de hashes conocidos, sandboxing de correo |
| **2. Ejecución** | Sí — ejecución de `Server.exe` sin firma digital desde `%TEMP%` | Alerta Wazuh 100100; Process Explorer | Políticas de ejecución (AppLocker/WDAC) que bloqueen binarios sin firma en rutas de usuario; EDR con detección de comportamiento |
| **3. Persistencia** | Sí — clave `HKCU\...\Run` apuntando a `%TEMP%\Server.exe` | Autoruns, `reg query` | Monitoreo de cambios en claves `Run`/`RunOnce` (Sysmon Event ID 13) con alerta inmediata; restricción de escritura en `%TEMP%` |
| **4. Comando y control (C2)** | Sí — conexión saliente constante a `10.6.97.139:1177` | TCPView, netstat, Wazuh rule.id 100102 | Firewall de salida con lista blanca de destinos/puertos conocidos; inspección de tráfico saliente hacia puertos no estándar |
| **5. Acciones sobre el objetivo** | Sí — explorador de archivos remoto, gestión de archivos, capacidades de keylogger/credenciales disponibles en el panel (no todas ejercidas) | Panel njRAT, capacidades listadas | Segmentación de red, privilegios mínimos del usuario, DLP para exfiltración de datos sensibles |

## Aprendizajes clave

1. **Ningún indicador aislado es suficiente.** Ni la ausencia de firma, ni
   el puerto no estándar, ni la ruta en `%TEMP%` prueban por sí solos una
   infección — es la convergencia de los tres, vista desde tres
   herramientas distintas (TCPView, Process Explorer, Autoruns), lo que
   da confianza.
2. **El SIEM no reemplaza la investigación local, la escala.** Todo lo que
   se vio manualmente en la víctima con Sysinternals fue reproducible como
   alerta automática en Wazuh — ese es justamente el valor de un SIEM: no
   depende de que un analista esté mirando la máquina exacta en el
   momento exacto.
3. **Persistencia básica es fácil de detectar, difícil de prevenir con
   controles por defecto.** La clave `Run` en `HKCU` no requiere
   privilegios de administrador, por lo que el control efectivo está en
   restringir qué puede ejecutarse desde `%TEMP%`, no en proteger el
   registro.

## Limitaciones generales de la práctica

- No se evaluó el eslabón de entrega con un vector realista.
- No se documentó la configuración exacta de Sysmon ni el XML de las
  reglas personalizadas de Wazuh.
- No se investigaron vías de persistencia adicionales a la clave `Run`.

## Trabajo futuro

- Repetir el laboratorio con Sysmon configurado explícitamente con una
  configuración pública conocida (p. ej. la de SwiftOnSecurity) y
  documentar el archivo de configuración usado.
- Añadir un vector de entrega simulado (archivo adjunto en un correo de
  prueba dentro del laboratorio aislado) para completar el primer eslabón.
- Exportar y versionar el XML real de las reglas personalizadas de Wazuh
  (100100, 100102) en `detections/wazuh-searches.md`.
