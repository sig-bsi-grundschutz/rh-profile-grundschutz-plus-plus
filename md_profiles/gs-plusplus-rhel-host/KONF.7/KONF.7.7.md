---
x-trestle-set-params:
    # This section contains the parameters that are part of this control.
  # Each parameter has properties. Only the profile-values and display-name properties are editable.
  # The other properties are informational.
  #
  # The values property for a parameter represents values inherited from the OSCAL catalog.
  # To override the catalog settings, use bullets under profile-values as shown below:
  #
  #   profile-values:
  #     - value 1
  #     - value 2
  #
  # If the "- <REPLACE_ME>" placeholder appears under profile-values, it is the same as if
  # the profile-values property were left empty.
  #
  # Some parameters may show an aggregates property which lists other parameters. This means
  # the parameter value is made up of the values from the other parameters. For parameters
  # that aggregate, profile-values is not applicable.
  #
  # Property param-value-origin is meant for putting the origin from where that parameter comes from.
  # In order to be changed in the current profile, profile-param-value-origin property will be displayed with
  # the placeholder "<REPLACE_ME>" for you to be replaced. If a parameter already has a param-value-origin
  # coming from an inherited profile, do no change this value, instead use profile-param-value-origin as follows:
  #
  #    param-value-origin: DO NOT REPLACE - this is the original value
  #    profile-param-value-origin: <REPLACE_ME> - replace the new value required HERE
  #
  konf.7.7-prm1:
    alt-identifier: a4602448-2196-4f8e-8d5a-7a33ab5d5286
    profile-values:
      - <REPLACE_ME>
    profile-param-value-origin: <REPLACE_ME>
x-trestle-global:
  profile:
    title: Grundschutz++ für Red Hat Enterprise Linux Host
---

# KONF.7.7 - \[Schutz vor Schadcode\] Regelmäßiger Funktionstest

## Control Statement

Konfiguration für IT-Systeme KANN die Funktionsfähigkeit des Schadcodeschutzes {{ insert: param, konf.7.7-prm1 }} überprüfen.

## Control guidance

Die Funktionsfähigkeit des Schadcodeschutzes beschreibt den operativen Zustand der eingesetzten Schutzmechanismen (engl. Malware Protection, oft auch Antivirus oder Endpoint Detection and Response, kurz EDR), der über die reine Installation der Software hinausgeht. Sie umfasst die korrekte Ausführung der Schutzdienste, die Aktualität der Erkennungssignaturen und Verhaltensregeln sowie die Fähigkeit, auf Bedrohungen aktiv zu reagieren und diese zu protokollieren. Eine regelmäßige Überprüfung dieser Funktionsfähigkeit kann die Institution vor unbemerkten Sicherheitslücken schützen. Ein deaktivierter oder fehlerhafter Schutzmechanismus könnte beispielsweise dazu führen, dass Ransomware unbemerkt Daten verschlüsselt oder ein Trojaner Anmeldeinformationen abgreift, obwohl eine Schutzsoftware installiert ist. Durch die proaktive Verifikation kann hingegen sichergestellt werden, dass diese wesentliche Verteidigungslinie durchgehend intakt ist und auf Angriffsversuche reagieren kann. Zur konkreten Umsetzung kann die Institution auf verschiedene, sich ergänzende Maßnahmen zurückgreifen. Eine zentrale Verwaltungskonsole der eingesetzten Schutzlösung kann genutzt werden, um den Status aller angebundenen Systeme automatisiert zu überwachen und Alarme auszulösen, wenn Systeme sich nicht mehr melden, veraltete Signaturen aufweisen oder Dienste beendet wurden. Ergänzend kann die tatsächliche Erkennungsleistung proaktiv durch den Einsatz einer standardisierten Testdatei wie dem EICAR-Teststring verifiziert werden; dieser kann automatisiert auf den Systemen platziert werden, um zu prüfen, ob der Schadcodeschutz wie erwartet anschlägt und eine Meldung generiert. Auf Systemen ohne zentrale Anbindung kann die Funktionsfähigkeit mittels Skripten überprüft werden, die lokal den Dienststatus und das Alter der Signaturdateien auslesen und in einer überwachten Logdatei dokumentieren.

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
