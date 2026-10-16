# 14. Referencias técnicas

- Microsoft Learn — *4688(S): A new process has been created.*
  https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4688
  Referencia oficial del evento de auditoría usado como marco teórico en
  [09-evento-4688.md](09-evento-4688.md).

- Microsoft Sysinternals — *Sysmon.*
  https://learn.microsoft.com/en-us/sysinternals/downloads/sysmon
  Documentación oficial de la herramienta cuyos eventos alimentan las
  reglas de Wazuh descritas en este repositorio.

- Microsoft Sysinternals — *TCPView, Process Explorer, Autoruns.*
  https://learn.microsoft.com/en-us/sysinternals/downloads/
  Documentación oficial de las tres herramientas usadas en
  [07-sysinternals.md](07-sysinternals.md).

- Wazuh — *Documentation.*
  https://documentation.wazuh.com/
  Referencia oficial de arquitectura (manager, indexer, dashboard, agente)
  usada en [08-wazuh-y-siem.md](08-wazuh-y-siem.md).

- VMware — *Networking documentation (host-only networks).*
  https://docs.vmware.com/
  Referencia para la configuración de red solo-anfitrión usada en el
  laboratorio.

- MITRE ATT&CK — técnicas relacionadas con el comportamiento observado:
  - T1547.001 — *Boot or Logon Autostart Execution: Registry Run Keys / Startup Folder*
    https://attack.mitre.org/techniques/T1547/001/
  - T1071 — *Application Layer Protocol* (comunicación C2)
    https://attack.mitre.org/techniques/T1071/

> Nota: estas referencias se incluyen por su relevancia temática directa
> con los comportamientos documentados (persistencia vía Run key,
> comunicación C2). No se afirma haber consultado cada página línea por
> línea durante la redacción de este repositorio más allá de lo citado.
