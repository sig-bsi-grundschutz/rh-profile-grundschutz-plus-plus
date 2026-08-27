---
x-trestle-global:
  profile:
    title: Grundschutz++ für Red Hat Enterprise Linux Host
---

# KONF.2.1.1 - \[Konfiguration von Systemen\] Versionierung der Systemkonfiguration

## Control Statement

Konfiguration für IT-Systeme SOLLTE eine Versionierung vorheriger Konfigurationen verankern.

## Control guidance

Die Versionierung bezeichnet hier die strukturierte Nachvollziehbarkeit von Änderungen an Konfigurationen, also das Speichern, Dokumentieren und bei Bedarf Wiederherstellen älterer Zustände eines IT-Systems. Sie unterscheidet sich von einem einfachen Backup dadurch, dass nicht nur eine Kopie vorliegt, sondern explizit eine fortlaufende Historie mit Vergleichen, Rücksetzpunkten (rollback points) und optional Kommentaren geführt wird. Der Zweck liegt darin, dass eine ungewollte oder fehlerhafte Anpassung an einer Konfiguration im Betrieb schnell erkannt und – wenn erforderlich – präzise auf einen definierten, funktionsfähigen Zustand zurückgesetzt werden kann. Ohne eine solche Versionierung könnte eine fehlerhafte Änderung unbemerkt bleiben oder nur schwer rückgängig gemacht werden. Praktisch umgesetzt kann dies z. B. durch den Einsatz von Konfigurationsmanagement-Tools erfolgen, die automatisch Änderungen versionieren und mit Prüfsummen sichern. Alternativ kann eine Institution auch Konfigurationsdateien regelmäßig in ein Versionsverwaltungssystem wie Git einspielen. Zusätzlich kann es hilfreich sein, Konfigurationsänderungen über standardisierte Änderungsprozesse einzupflegen, sodass jede Anpassung nachvollziehbar protokolliert wird. Eine weitere Möglichkeit kann die Einrichtung von Skripten sein, die Konfigurationsstände automatisch aus Geräten exportieren und revisionssicher ablegen. Zur Umsetzung können Anwendungen zur Geheimnisverwaltung, oft als Secrets-Manager oder Vault bezeichnet, eingesetzt werden. Solche Anwendungen speichern alle Geheimnisse zentral und hochverschlüsselt und stellen sie erst bei Bedarf zur Laufzeit über eine authentifizierte und gesicherte Schnittstelle (API) zur Verfügung. Eine weitere, weit verbreitete Praxis ist die Auslagerung von Secrets aus den Konfigurationsdateien in Umgebungsvariablen (Environment Variables) des ausführenden Systems, wodurch eine strikte Trennung von Code und Konfiguration erreicht wird. Alternativ kann auch die Konfigurationsdatei selbst oder zumindest die Abschnitte, die Geheimnisse enthalten, verschlüsselt werden, wobei dies erfordert, dass der zur Entschlüsselung notwendige Schlüssel seinerseits sicher an die Applikation übergeben wird.

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
