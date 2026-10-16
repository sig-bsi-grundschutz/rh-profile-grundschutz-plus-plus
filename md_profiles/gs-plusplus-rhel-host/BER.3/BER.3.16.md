---
x-trestle-global:
  profile:
    title: Grundschutz++ für Red Hat Enterprise Linux Host
---

# BER.3.16 - \[Zugangskonten\] Keine Gruppenkonten

## Control Statement

Berechtigung SOLLTE Gruppenkonten im Regelbetrieb untersagen.

## Control guidance

Ein Gruppenkonto (englisch shared account) bezeichnet hier ein Zugangskonto, das von mehreren natürlichen Personen gemeinsam genutzt wird und daher keiner einzelnen natürlichen Person eindeutig zugeordnet werden kann. Vom Regelbetrieb erfasst ist die gewöhnliche, wiederkehrende Nutzung im Tagesgeschäft, nicht jedoch ein eng begrenzter Ausnahmefall mit gesonderter Begründung und Absicherung, sowie nachvollziehbarer Zuordnung der Nutzung zu einer konkreten Person. Der Ausschluss von Gruppenkonten hat das Ziel die Nachvollziehbarkeit von Zugriffen und Änderungen zu verbessern und eine eindeutige Verantwortlichkeit für die Nutzung von Berechtigungen sicherzustellen. Die Verwendung von Gruppenkonten im Regelbetrieb könnten hingegen die Aufklärung von Sicherheitsvorfällen erschweren, die missbräuchliche Nutzung von Zugriffsrechten begünstigen oder nach dem Ausscheiden einzelner Nutzer unbemerkte Zugriffsmöglichkeiten bestehen lassen. Für technisch unvermeidbare Sonderfälle können stattdessen speziell gekennzeichneter Funktions- oder Dienstkonten (service accounts) verwendet werden. Im Unterschied zu Gruppenkonten sind Service Accounts nicht zur gemeinsamen interaktiven Nutzung durch mehrere Mitarbeiter gedacht. Sie können beispielsweise einen Datenbankdienst mit einer Anwendung verbinden, automatisierte Datensicherungen durchführen oder den Datenaustausch zwischen zwei Systemen ermöglichen. Um klar von Gruppenkonten abgegrenzt zu sein benötigt ein Dienstkonto eine klar nachvollziehbare Zweckbindung, die Sperrung interaktiver Anmeldungen, sowie eine regelmäßige Erneuerung von Authentisierungsmerkmalen.

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
