#!/usr/bin/env bash
#
# wazuh-health-check.sh
# Objetivo: verificar el estado de los tres servicios principales de Wazuh.
# Permisos: sudo (requerido por systemctl status en algunas distros).
# No modifica configuracion, no reinicia servicios, no instala nada.

set -euo pipefail

echo "=== Estado de wazuh-manager ==="
sudo systemctl status wazuh-manager --no-pager || true

echo
echo "=== Estado de wazuh-indexer ==="
sudo systemctl status wazuh-indexer --no-pager || true

echo
echo "=== Estado de wazuh-dashboard ==="
sudo systemctl status wazuh-dashboard --no-pager || true

echo
echo "=== Direcciones IP del servidor (para documentar en evidence/architecture/) ==="
ip -4 addr show | grep inet || true
