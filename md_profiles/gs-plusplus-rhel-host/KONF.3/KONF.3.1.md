---
x-trestle-global:
  profile:
    title: Red Hat Enterprise Linux 9 — Grundschutz++ (Host-Umfang, kuratiert)
---

# KONF.3.1 - \[Physischer Schutz\] Kryptographischer Hardwarespeicher

## Control Statement

Konfiguration für IT-Systeme SOLLTE einen kryptographischen Hardwarespeicher aktivieren.

## Control guidance

Ein kryptographischer Hardwarespeicher bezeichnet in diesem Kontext eine gesicherte, hardwarebasierte Komponente, die kryptographische Schlüssel oder andere besonders sensible Geheimnisse in einer isolierten und manipulationsgeschützten Umgebung verwahrt. Der Einsatz solcher Speicher kann das Risiko deutlich reduzieren, dass kryptographische Schlüssel bei einem Softwareangriff kompromittiert werden, und kann gleichzeitig die Integrität sicherheitskritischer Prozesse wie Verschlüsselung, Signatur oder Authentifizierung erhöhen. Als Standards können hierzu etwa eine Trusted Execution Environment (TEE), Secure Elements (SE) or Dedicated Security Components (DSC) infrage kommen. Vgl. ISO/IEC 11889 (TPM 2.0), ISO/IEC 19790 / FIPS 140-3 oder ETSI EN 303 645 (für IoT).

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
