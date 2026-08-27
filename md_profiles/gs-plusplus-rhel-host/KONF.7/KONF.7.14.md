---
x-trestle-global:
  profile:
    title: Grundschutz++ für Red Hat Enterprise Linux Host
---

# KONF.7.14 - \[Schutz vor Schadcode\] Code-Signierung im Betriebssystemkern

## Control Statement

Konfiguration für IT-Systeme SOLLTE die Signaturprüfung für nachladbaren Code im Kernelmodus aktivieren.

## Control guidance

Nachladbarer Code im Kernelmodus verfügt typischerweise über weitreichende Berechtigungen und kann bei einer Kompromittierung erhebliche Auswirkungen auf das gesamte IT-System haben. Eine Signaturprüfung kann dazu beitragen, das Laden von nicht oder nicht vertrauenswürdig signiertem Code im Kernelmodus zu verhindern. Beispiele sind die erzwungene Signaturprüfung von Kernelmodulen unter Linux oder die Signaturprüfung von Kernelmodus-Treibern unter Windows. Die Schutzwirkung der Signaturprüfung hängt von den verwendeten Vertrauensankern ab. Hierbei kann insbesondere berücksichtigt werden, welche Signaturschlüssel beziehungsweise Herausgeber als vertrauenswürdig eingestuft werden. Eine gültige Signatur allein erlaubt keine Aussage über die Sicherheit oder Qualität des signierten Codes.

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
