---
x-trestle-global:
  profile:
    title: Grundschutz++ für Red Hat Enterprise Linux Host
---

# KONF.14.1.1 - \[Verteilte Anwendungen\] Obligatorische Verschlüsselung

## Control Statement

Konfiguration für Anwendungen SOLLTE unverschlüsselte und anfällige Verbindungen über Netze deaktivieren.

## Control guidance

Obligatorische Verschlüsselung bedeutet, dass die Anwendung ausschließlich nach dem Stand der Technik verschlüsselt kommuniziert. Unverschlüsselte oder mit bekannten Methoden angreifbare Verbindungsanfragen werden dagegen abgelehnt. Die Verwendung obligatorischer Verschlüsselung im Internet ist aktuell sehr uneinheitlich: Viele E-Mail-Server z.B. verschlüsseln im Auslieferungszustand nur opportunistisch - also nur wenn der Verbindungsaufbau so funktioniert. Das macht Verbindungen anfällig für Downgrade-Angriffe. Diese lassen sich verhindern, indem unverschlüsselte Verbindungen vollständig deaktiviert werden. Andererseits kann es dadurch auch zu Verbindungsproblemen mit Servern kommen, die überhaupt keine Verschlüsselung mit aktuellen Protokollen unterstützen. Für aktuelle Verschlüsselungsverfahren siehe BSI TR-02102.

# Editable Content

<!-- Make additions and edits below -->
<!-- The above represents the contents of the control as received by the profile, prior to additions. -->
<!-- If the profile makes additions to the control, they will appear below. -->
<!-- The above markdown may not be edited but you may edit the content below, and/or introduce new additions to be made by the profile. -->
<!-- If there is a yaml header at the top, parameter values may be edited. Use --set-parameters to incorporate the changes during assembly. -->
<!-- The content here will then replace what is in the profile for this control, after running profile-assemble. -->
<!-- The current profile has no added parts for this control, but you may add new ones here. -->
<!-- Each addition must have a heading either of the form ## Control my_addition_name -->
<!-- or ## Part a. (where the a. refers to one of the control statement labels.) -->
<!-- "## Control" parts are new parts added after the statement part. -->
<!-- "## Part" parts are new parts added into the top-level statement part with that label. -->
<!-- Subparts may be added with nested hash levels of the form ### My Subpart Name -->
<!-- underneath the parent ## Control or ## Part being added -->
<!-- See https://oscal-compass.github.io/compliance-trestle/tutorials/ssp_profile_catalog_authoring/ssp_profile_catalog_authoring for guidance. -->
