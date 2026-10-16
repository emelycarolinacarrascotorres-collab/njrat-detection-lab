# Reglas y búsquedas usadas en Wazuh

## Reglas personalizadas observadas

| rule.id | Nivel | Grupo | Descripción | Evento fuente |
|---|---|---|---|---|
| 100100 | 12 | sysmon | Ejecutable sin firma lanzado desde Desktop/Temp/Downloads (posible njRAT) | Sysmon Event ID 1 |
| 100102 | 13 | sysmon | Conexión saliente al puerto 1177 (C2 de njRAT) | Sysmon Event ID 3 |

> El XML exacto de `local_rules.xml` que define estas reglas no está
> incluido en el material disponible (`PENDIENTE DE VERIFICACIÓN`).

## Búsqueda usada para la vista agregada

Filtros aplicados en el dashboard (Discover):

```
manager.name: soc-emely
agent.id: 004
rule.groups: sysmon
```

Resultado: 83 eventos en la ventana `Oct 14, 2026 @ 21:34:42` a
`Oct 15, 2026 @ 21:34:42`, con concentración de actividad antes de la
medianoche (ventana de infección) y un evento aislado posterior (~21:18),
coherente con la alerta 100102.

Ver evidencia en
[`evidence/wazuh/05-alerta-conexion-c2-dashboard.png`](../evidence/wazuh/05-alerta-conexion-c2-dashboard.png).
