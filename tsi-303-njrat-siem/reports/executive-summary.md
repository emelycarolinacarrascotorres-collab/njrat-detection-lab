# Resumen ejecutivo

## Objetivo del laboratorio

Montar una infección por njRAT en un entorno Windows 10 aislado y
detectarla usando Sysinternals (TCPView, Process Explorer, Autoruns) y un
SIEM (Wazuh), para luego explicar la cadena de ataque y sus contramedidas.

## Hallazgos principales

1. **El laboratorio quedó correctamente aislado**: ambas VM (víctima
   `10.6.97.137`, atacante `10.6.97.139`) carecen de salida a internet y
   se comunican únicamente entre sí por red host-only.
2. **La infección se estableció y fue observable de extremo a extremo**:
   conexión C2 en el puerto 1177, al menos tres capacidades del RAT
   demostradas, y persistencia confirmada en `HKCU\...\Run`.
3. **La misma infección fue detectable con herramientas defensivas
   estándar**: TCPView y `netstat` localizaron la conexión C2; Process
   Explorer identificó el proceso sin firma; Autoruns y `reg query`
   confirmaron, por dos vías independientes, la persistencia.
4. **El SIEM (Wazuh) correlacionó automáticamente los mismos indicadores**:
   alerta de nivel 12 para la ejecución sin firma (rule.id 100100) y
   alerta de nivel 13 para la conexión C2 (rule.id 100102), con 83 eventos
   agregados relacionados en una ventana de 24 horas.

## Brechas identificadas

- No se documentó la configuración exacta de Sysmon (archivo XML) ni el
  contenido de las reglas personalizadas de Wazuh (`local_rules.xml`).
- No se exploraron mecanismos de persistencia adicionales a la clave `Run`.
- No se evaluó el primer eslabón de la cadena de ataque (entrega del binario).

## Conclusión

La práctica cumple sus objetivos centrales: demuestra que una infección
básica de RAT, aunque difícil de notar a simple vista para un usuario
común, deja un rastro consistente y detectable en al menos tres capas
independientes (proceso, red, persistencia), y que ese rastro es
igualmente visible tanto con herramientas locales como con un SIEM
centralizado. Ver matriz de evidencia detallada en
[`evidence-matrix.md`](evidence-matrix.md).
