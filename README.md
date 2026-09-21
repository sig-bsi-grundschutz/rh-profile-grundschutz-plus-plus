## compliance-trestle-profile

compliance-trestle repository for agile authoring of profile

Prerequisite: [profile template](https://github.com/IBM/compliance-trestle-template-profile) has been used to create repo for [agile authoring](https://github.com/IBM/compliance-trestle-agile-authoring).

- [view profile markdown](#view-profile-markdown)
- [update profile](#update-profile)
- [CI automation](#ci-automation)

-----

##### CI automation

Scripts under `scripts/automation/` run from GitHub Actions on push. Shared helpers are reused; branch decides the entrypoint.

```mermaid
flowchart TB
  subgraph develop["push → develop · dev-push.yml"]
    direction TB
    d_inst["install_trestle.sh"]
    d_upd["check_and_update_all.sh"]
    d_regen["regenerate_profiles.sh"]
    d_asm["assemble_profiles.sh"]
    d_push["push.sh"]
    d_inst --> d_upd
    d_upd -->|"profiles/**/*.json changed"| d_regen
    d_upd -->|"md_profiles/**/*.md changed"| d_asm
    d_upd --> d_push
  end

  subgraph main["push → main · main-push.yml"]
    direction TB
    m_inst["install_trestle.sh"]
    m_rel["release.sh"]
    m_psr["semantic-release version"]
    m_regen["regenerate_profiles.sh<br/>if md_profiles empty"]
    m_asm["assemble_profiles.sh"]
    m_push["push.sh<br/>+ move v* tag when VERSION_TAG set"]
    m_chk["check_profile.sh"]
    m_down["update_downstream.sh<br/>PR → component-definition develop"]
    m_merge["direct-merge-action<br/>main → develop"]
    m_inst --> m_rel
    m_rel --> m_psr
    m_rel --> m_regen --> m_asm
    m_rel --> m_asm
    m_rel --> m_push
    m_push --> m_chk
    m_chk -->|"profile present"| m_down
    m_push --> m_merge
  end
```

| Script | develop | main |
| --- | --- | --- |
| `install_trestle.sh` | yes | yes |
| `check_and_update_all.sh` | entry | — |
| `release.sh` | — | entry |
| `regenerate_profiles.sh` | if JSON changed | if `md_profiles` empty |
| `assemble_profiles.sh` | if Markdown changed | always when content present |
| `push.sh` | Autoupdate commit | Autoupdate + optional tag move |
| `check_profile.sh` / `update_downstream.sh` | — | after release |

-----

##### view profile markdown

Navigate to the `md_profiles` folder, then descend to the control of interest.

<details>
<summary>visual</summary>
<img src="drawio/ss.view-markdown.png" width="500" height="600">
</details>

-----

##### update profile

<img src="drawio/update-profile.drawio.png">

Steps to modify the profile repository with an updated profile are given below:

###### 1. navigate to develop branch location of profile in repo.

<details>
<summary>visual</summary>
<img src="drawio/ss.update-profile.drawio.png" width="500" height="600">
</details>

###### 2. copy updated profile to repo.

<details>
<summary>visual</summary>
<img src="drawio/ss.copy-profile.drawio.png" width="500" height="600">
</details>

###### 3. compare & pull request

<details>
<summary>visual</summary>
<img src="drawio/ss.compare-and-pull-request.drawio.png" width="500" height="600">
</details>


###### 4. create pull request

<details>
<summary>visual</summary>
<img src="drawio/ss.create-pull-request.drawio.png" width="500" height="600">
</details>


###### 5. merge pull request

<details>
<summary>visual</summary>
<img src="drawio/ss.merge-pull-request.drawio.png" width="500" height="600">
</details>

###### 6. confirm merge

<details>
<summary>visual</summary>
<img src="drawio/ss.confirm-merge.drawio.png" width="500" height="600">
</details>

-----

##### references

- [documentation: agile authoring](https://github.com/IBM/compliance-trestle-agile-authoring#compliance-trestle-agile-authoring)

______________________________________________________________________

We are a Cloud Native Computing Foundation sandbox project.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://www.cncf.io/wp-content/uploads/2022/07/cncf-white-logo.svg">
  <img src="https://www.cncf.io/wp-content/uploads/2022/07/cncf-color-bg.svg" width=300 />
</picture>

The Linux Foundation® (TLF) has registered trademarks and uses trademarks. For a list of TLF trademarks, see [Trademark Usage](https://www.linuxfoundation.org/legal/trademark-usage).

*OSCAL Compass is an independent open source project. It is not affiliated with, endorsed by, or sponsored by the National Institute of Standards and Technology (NIST) or any other government agency.*

*OSCAL Compass was originally contributed by IBM.*
