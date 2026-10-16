# 05. Metodología

## Plantilla usada por fase

Cada fase de la práctica se documenta respondiendo:

- **Propósito:** qué se pretendía investigar.
- **Fundamento técnico:** por qué importa desde seguridad.
- **Entorno:** máquina y herramientas usadas.
- **Procedimiento:** qué se hizo realmente.
- **Comandos:** con su explicación.
- **Evidencia:** captura o registro que respalda lo dicho.
- **Resultado esperado** vs. **resultado real**.
- **Interpretación:** qué significa el resultado.
- **Limitaciones:** qué no puede concluirse con la evidencia disponible.
- **Estado:** completado, parcial, pendiente o no realizado.

## Fases de la práctica

| Fase | Documento | Estado |
|---|---|---|
| 1. Preparación y aislamiento del entorno | [04-configuracion-del-entorno.md](04-configuracion-del-entorno.md) | Completado |
| 2. Infección observada (lado atacante) | [06-investigacion-defensiva.md](06-investigacion-defensiva.md) | Completado |
| 3.1 Investigación con Sysinternals | [07-sysinternals.md](07-sysinternals.md) | Completado |
| 3.2 Detección con SIEM (Wazuh) | [08-wazuh-y-siem.md](08-wazuh-y-siem.md) | Completado |
| 4. Conclusión defensiva | [13-conclusiones.md](13-conclusiones.md) | Completado |

## Orden de trabajo real

El orden documentado en este repositorio sigue el orden cronológico de las
capturas de pantalla: primero se verificó el aislamiento de red en ambas
VM, después se estableció la conexión C2 y se exploraron las capacidades
del RAT, luego se investigó con Sysinternals desde la víctima, y por
último se verificó la ingesta y las alertas en Wazuh.
