# 01. Introducción

## Motivación

Entender una amenaza solo desde el punto de vista del atacante deja la mitad
del aprendizaje incompleto. Esta práctica obliga a completar el ciclo:
primero se monta y observa una infección real por un troyano de acceso
remoto (RAT) en un entorno aislado, y después se investiga esa misma
infección con las herramientas y el criterio de un analista defensivo.

## Qué es njRAT

njRAT (también conocido como Bladabindi) es un troyano de acceso remoto
(RAT) de origen conocido, ampliamente documentado en reportes de
inteligencia de amenazas, que permite control remoto de un equipo
comprometido: exploración de archivos, captura de pantalla, keylogging,
robo de credenciales y ejecución remota, entre otras capacidades.
Para esta práctica se usó la versión **v0.7d Golden Edition**, confirmada
en el panel de control del atacante (ver
[evidence/rat-panel/01-njrat-panel-victima-conectada.png](../evidence/rat-panel/01-njrat-panel-victima-conectada.png)).

## Por qué importa para seguridad defensiva

njRAT es relevante para la formación en seguridad no por su sofisticación
técnica —su código es público y ampliamente estudiado—, sino porque sus
patrones de comportamiento (persistencia vía clave `Run`, conexión saliente
constante a un puerto no estándar, ejecución desde carpetas temporales sin
firma digital) son representativos de una familia amplia de malware
básico-intermedio que un analista de SOC debe poder reconocer sin depender
de firmas de antivirus.

## Estructura de este documento

Este repositorio sigue el orden natural de la práctica: preparación del
entorno, infección observada, investigación con Sysinternals, detección con
SIEM y cierre con la cadena de ataque y sus contramedidas. Cada fase se
documenta con la misma plantilla (propósito, procedimiento, evidencia,
resultado, interpretación, limitaciones y estado) para que sea auditable.
