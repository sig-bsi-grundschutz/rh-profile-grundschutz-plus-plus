---
x-trestle-global:
  profile:
    title: Grundschutz++ für Red Hat Enterprise Linux Host
---

# KONF.4.1.1 - \[Vertrauenswürdige Basisdienste\] Weiterleitung von Anmeldeinformationen

## Control Statement

Konfiguration für IT-Systeme SOLLTE die Weiterleitung mehrfach verwendbarer Anmeldeinformationen deaktivieren.

## Control guidance

„Weiterleitung mehrfach verwendbarer Anmeldeinformationen“ (auch als Credential Forwarding oder Credential Delegation bezeichnet) meint Mechanismen, bei denen Anmeldeinformationen oder daraus abgeleitete Authentisierungsinformationen an ein weiteres System übertragen oder diesem zur weiteren Authentisierung zur Verfügung gestellt werden. Dadurch können auf dem Zielsystem Informationen oder Authentisierungsfähigkeiten verfügbar werden, die bei einer Kompromittierung für weitere Zugriffe missbraucht werden könnten. Die Einschränkung der Weiterleitung kann das Risiko reduzieren, dass Angreifende nach der Kompromittierung eines Systems Anmeldeinformationen oder daraus abgeleitete Authentisierungsinformationen für laterale Bewegungen verwenden. Insbesondere bei privilegierten Zugangskonten kann dadurch vermieden werden, dass wiederverwendbare Anmeldeinformationen auf weniger vertrauenswürdigen Systemen verfügbar werden. Für Remotezugriffe können Verfahren eingesetzt werden, bei denen die Anmeldeinformationen nicht an das Zielsystem übertragen werden. Beispiele unter Windows sind Remote Credential Guard oder Restricted Admin für Remotedesktopverbindungen. Bei SSH-Verbindungen kann auf die Weiterleitung des lokalen SSH-Authentisierungsagenten verzichtet werden. Wird Agent Forwarding nicht benötigt, kann dessen Verwendung client- und serverseitig eingeschränkt werden.

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
