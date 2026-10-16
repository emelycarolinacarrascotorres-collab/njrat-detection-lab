# 02. Objetivos y alcance

## Objetivo general

Comprender, desde una perspectiva defensiva, cómo investigar una posible
infección, reconocer comportamientos sospechosos, identificar mecanismos de
persistencia, observar conexiones de red y utilizar un SIEM para recopilar
y analizar eventos.

## Objetivos específicos

1. Configurar un laboratorio de dos máquinas virtuales en red solo-anfitrión
   y verificar su aislamiento (sin salida a internet, con conectividad
   interna entre VMs). **Estado: completado.**
2. Establecer una conexión C2 con njRAT y demostrar al menos tres
   capacidades del RAT sobre la víctima. **Estado: completado.**
3. Identificar el mecanismo de persistencia dejado por el troyano.
   **Estado: completado — clave `Run`.**
4. Detectar la conexión C2 con TCPView y el proceso responsable con Process
   Explorer. **Estado: completado.**
5. Confirmar la persistencia de forma independiente con Autoruns y con
   consulta directa al registro (`reg query`). **Estado: completado.**
6. Desplegar un SIEM (Wazuh) y correlacionar los eventos de ejecución,
   persistencia y red de la infección. **Estado: completado — alertas
   100100 y 100102 observadas en el dashboard.**
7. Explicar la cadena de ataque (entrega, ejecución, persistencia, C2,
   acciones) y la contramedida de cada eslabón. **Estado: ver
   [13-conclusiones.md](13-conclusiones.md).**

## Fuera de alcance

- Análisis estático o dinámico del binario `Server.exe` (desensamblado,
  sandbox dedicado, extracción de configuración del RAT).
- Vector de entrega real (el binario se transfirió manualmente entre VMs,
  no se simuló phishing ni descarga drive-by).
- Hardening o remediación real del equipo víctima tras la práctica (se
  recomienda restaurar el snapshot limpio en lugar de limpiar en caliente).
- Configuración detallada línea por línea del archivo `ossec.conf` del
  agente Wazuh (se documenta el resultado funcional, no cada parámetro).

## Limitaciones generales

- Todo lo reportado en este repositorio proviene de capturas de pantalla
  tomadas durante la ejecución real del laboratorio; donde no hay captura
  que lo respalde, se marca `PENDIENTE DE VERIFICACIÓN` en lugar de
  asumirse.
- La hora del sistema operativo Windows de la víctima (reloj del RAT,
  `26/10/15`) no coincide con el formato de fecha usado en PowerShell y en
  Wazuh; se documenta como inconsistencia de reloj/formato, no como error
  de los hechos (ver [12-problemas-y-soluciones.md](12-problemas-y-soluciones.md)).
