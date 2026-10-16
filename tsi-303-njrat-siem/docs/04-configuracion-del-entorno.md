# 04. Configuración del entorno

## Propósito

Verificar que el laboratorio está correctamente aislado antes de introducir
el RAT: la víctima y el atacante deben verse entre sí en la red virtual,
pero ninguna debe tener salida a internet ni a la red de la institución.

## Fundamento técnico

Ejecutar un RAT en una red con salida a internet (aunque sea accidental)
expone a terceros reales y constituye un delito bajo la Ley 53-07. Verificar
el aislamiento no es un paso opcional: es la condición que hace legal y
segura el resto de la práctica.

## Entorno

- Hipervisor: VMware Workstation.
- Red: adaptador host-only (solo-anfitrión), sin NAT ni bridge hacia la red física.
- VM víctima: Windows 10 Education SP0 x64, `10.6.97.137`.
- VM atacante: Windows 10, `10.6.97.139`.

## Procedimiento y comandos

Desde PowerShell, en cada máquina:

```powershell
ipconfig /all
ping 8.8.8.8
ping <IP-de-la-otra-maquina>
```

Ver script equivalente en
[`commands/windows/network-investigation.ps1`](../commands/windows/network-investigation.ps1).

## Evidencia

| Verificación | Resultado | Evidencia |
|---|---|---|
| IP de la víctima | `10.6.97.137` | [network-isolation/01](../evidence/network-isolation/01-ipconfig-victima.png) |
| Víctima sin salida a internet | `ping 8.8.8.8` → 4/4 perdidos | [network-isolation/02](../evidence/network-isolation/02-ping-aislamiento-victima.png) |
| Víctima ve al atacante | `ping 10.6.97.139` → 0/4 perdidos, TTL=128 | [network-isolation/02](../evidence/network-isolation/02-ping-aislamiento-victima.png) |
| IP del atacante | `10.6.97.139` | [network-isolation/03](../evidence/network-isolation/03-ipconfig-atacante.png) |
| Atacante sin salida a internet | `ping 8.8.8.8` → 4/4 perdidos | [network-isolation/04](../evidence/network-isolation/04-ping-aislamiento-atacante.png) |
| Atacante ve a la víctima | `ping 10.6.97.137` → 0/4 perdidos, TTL=128 | [network-isolation/04](../evidence/network-isolation/04-ping-aislamiento-atacante.png) |

## Resultado esperado vs. resultado real

**Esperado:** 0% de conectividad externa, 100% de conectividad interna.
**Real:** coincide exactamente en ambas máquinas.

## Interpretación

El laboratorio cumple la condición de aislamiento exigida por el enunciado:
no hay ruta hacia internet desde ninguna de las dos VM, y ambas se
comunican libremente entre sí por la red host-only, lo que permite montar
la infección de forma segura.

## Limitaciones

No se verificó el aislamiento a nivel de hipervisor (reglas de firewall de
VMware, configuración del DHCP del adaptador host-only) más allá del
resultado observado con `ping`; se asume correcto por el resultado, no se
auditó la configuración del adaptador virtual en sí.

## Estado: completado
