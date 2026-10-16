#!/usr/bin/env bash
#
# wazuh-agent-status.sh
# Objetivo: listar los agentes registrados en el manager y su estado de conexion.
# Permisos: requiere acceso al binario wazuh-control o a la API de Wazuh.
# No modifica ni elimina agentes. No contiene credenciales:
#   si se usa la API, exportar antes WAZUH_API_USER / WAZUH_API_PASS
#   como variables de entorno, nunca hardcodeadas aqui.

set -euo pipefail

echo "=== Agentes registrados (via wazuh-control) ==="
sudo /var/ossec/bin/agent_control -l || true

echo
echo "Para consultar via API REST (requiere credenciales propias, no incluidas):"
echo '  curl -k -u "$WAZUH_API_USER:$WAZUH_API_PASS" https://localhost:55000/agents'
