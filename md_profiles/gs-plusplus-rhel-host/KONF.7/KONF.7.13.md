---
x-trestle-global:
  profile:
    title: Grundschutz++ für Red Hat Enterprise Linux Host
---

# KONF.7.13 - \[Schutz vor Schadcode\] Einschränkung von Systemaufrufen

## Control Statement

Konfiguration für IT-Systeme KANN Systemaufrufe pro Anwendung einschränken.

## Control guidance

Ein Systemaufruf (engl. system call) ist dabei die Methode, mit der eine Anwendung Zugriff auf die Ressourcen des Betriebssystems anfordert, z.B. um eine Datei zu öffnen, in das Netzwerk zu kommunizieren oder einen neuen Prozess zu starten. Diese feingranulare Einschränkung wird in der Branche auch als Capability-based Security oder Seccomp (Secure Computing Mode) bezeichnet. Der Zweck dieser Vorschrift ist die gezielte Reduzierung der Angriffsfläche, indem selbst eine vertrauenswürdige, aber kompromittierte Anwendung daran gehindert wird, schädliche Aktionen auszuführen. Ein Angreifer könnte beispielsweise die Prozess-ID (PID) einer Anwendung kapern und versuchen, über deren Kontext privilegierte Systemaufrufe durchzuführen, um sich im Netzwerk auszubreiten oder sensible Daten zu löschen. Die Einschränkung dieser Aufrufe kann die Folgen eines erfolgreichen Angriffs erheblich mildern und so die Ausbreitung von Malware oder die Manipulation von Systemprozessen verhindern.

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
