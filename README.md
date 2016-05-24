PsBamboo PowerShell module
==========================
[![Build status](https://ci.appveyor.com/api/projects/status/etxmi7i4qc8qtloe?svg=true)](https://ci.appveyor.com/project/muratiakos/psbamboo)

PsBamboo is a PowerShell module that provides a wrapper for [Bamboo][bamboo]
[REST API][bambooapi] to allow easy and fast authenticated access to
[Bamboo CI][bamboo] in a scriptable and automatable manner.

The module handles both authenticated and anonymous methods, it supports paged
reading and manipulation of the following [Bamboo][bamboo] resources:
`Project`, `Plan`, `PlanBranch`, `Build`, `Artifact`, `Server`, `CurrentUser`

In addition to several already implemented functions, it also provides
generic Cmdlets to access any not yet covered [Bamboo REST API][bambooapi]
resources too.

## Installation
PsBamboo is available via [PsGet][psget] or via [PowerShell Gallery ][psgallery],
so you can simply install it with the following command:
```powershell
Install-Module PsBamboo
```
Of course you can download and install the module manually too from
[Downloads][download]

## Usage
```powershell
Import-Module PsBamboo
```

## Examples
Try and execute the sample scripts in the [Examples folder][examples] against your local Bamboo
server to see all the Cmdlets in action or call `help` on any of the PsBamboo cmdlets.

### Server and Authentication
```powershell
# Set the target Bamboo Server
Set-BambooServer -Url 'http://localhost:8085'

# Set login credentials for further cmdlets
Set-BambooAuthentication -Credential (Get-Credential)

# Get the current authenticated user details
Get-BambooCurrentUser
```

### Build cmdlets
```powershell
# List all the latest build results
Get-BambooBuild

# Get the latest or all build results for a specific Plan
Get-BambooBuild -PlanKey 'PRJKEY-PLANKEY'
Get-BambooBuild -PlanKey 'PRJKEY-PLANKEY' -All

# Start a new build or resume a pause build
Start-BambooBuild -PlanKey 'PRJKEY-PLANKEY'
Resume-BambooBuild -BuildKey 'PRJKEY-PLANKEY-2'

#Execute all manual stages for a build
Start-BambooBuild  -PlanKey 'PRJKEY-PLANKEY' -ExecuteAllStages
```

### Project cmdlets
```powershell
# List all projects
Get-BambooProject

# Detail a specific Project defined by the -ProjectKey
Get-BambooProject -ProjectKey 'PRJKEY'
```

### Plan cmdlets
```powershell
# List all Bamboo Plans
Get-BambooPlan

# List all Bamboo Plans for a specific Project
Get-BambooPlan -ProjectKey 'PRJKEY'

# Get details for a specific Plan
Get-BambooPlan -PlanKey 'PRJKEY-PLANKEY'

# Disable/Enable a specific Plan
Disable-BambooPlan -PlanKey 'PRJKEY-PLANKEY'
Enable-BambooPlan -PlanKey 'PRJKEY-PLANKEY'

# Clone/Copy a BambooPlan to a new Plan
Copy-BambooPlan -PlanKey 'PRJKEY-PLANKEY' -NewPlanKey 'PRJKEY-NEWPLAN'
```


### Plan-Branch cmdlets
```powershell
# Create a new PlanBranch to a VCS-branch
$BranchName='pester'
Add-BambooPlanBranch -PlanKey 'PRJKEY-PLANKEY' -BranchName $BranchName -VcsBranch 'feature/pester'

# Enable/Disable PlanBranches
Enable-BambooPlanBranch -PlanKey 'PRJKEY-PLANKEY' -BranchName $BranchName
Disable-BambooPlanBranch -PlanKey 'PRJKEY-PLANKEY' -BranchName $BranchName
```

Note: Plan-branches are technically child-plans for regular plans in Bamboo,
which means most of the Plan cmdlets can be used for PlanBranches too, by passing their PlanKey.

## Documentation
Cmdlets and functions for PsBamboo have their own help PowerShell help, which
you can read with `help <cmdlet-name>`.

## Versioning
PsBamboo aims to adhere to [Semantic Versioning 2.0.0][semver].

## Issues
In case of any issues, raise an [issue ticket][issues] in this repository and/or
feel free to contribute to this project if you have a possible fix for it.

## Development

* Source hosted at [GitHub][repo]
* Report issues/questions/feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested with
[Pester][pester].
Ideally create a topic branch for every separate change you make. For
example:

1. Fork the [repo][repo]
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Make sure `Invoke-Pester` tests are passing with all your changes
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

## Authors
Created and maintained by [Akos Murati][muratiakos] (<akos@murati.hu>).

## License
Apache License, Version 2.0 (see [LICENSE][LICENSE])

[repo]: https://github.com/murati-hu/PsBamboo
[issues]: https://github.com/murati-hu/PsBamboo/issues
[examples]: Examples/
[bamboo]: https://www.atlassian.com/software/bamboo
[bambooapi]: https://developer.atlassian.com/bamboodev/rest-apis
[muratiakos]: http://murati.hu
[license]: LICENSE
[semver]: http://semver.org/
[psget]: http://psget.net/
[pester]: https://github.com/pester/Pester
[psgallery]: https://www.powershellgallery.com/packages/PsBamboo/
[download]: https://github.com/murati-hu/PsBamboo/archive/master.zip
