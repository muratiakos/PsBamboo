<#
.SYNOPSIS
    Gets all projects or describes a single Bamboo Project.
.DESCRIPTION
    If -ProjectKey is specified it describes only that project.
.PARAMETER ProjectKey
    Optional - Key for the Bamboo Project to be described
.EXAMPLE
    Get-BambooProject
.EXAMPLE
    Get-BambooProject -ProjectKey 'PRJ'
#>
function Get-BambooProject {
    [CmdletBinding()]
    param(
        [Parameter()]
        [ValidatePattern('\w+')]
        [string]$ProjectKey
    )

    $resource = 'project'
    if ($ProjectKey) {
        $resource = "project/$ProjectKey"
    }

    Invoke-BambooRestMethod -Resource $resource |
    Expand-BambooResource -ResourceName 'project' |
    Add_ObjectType -TypeName 'PsBamboo.Project'
}
