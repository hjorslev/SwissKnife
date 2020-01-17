function Add-RequiredModule {
    <#
    .SYNOPSIS
    Add a module from the PowerShell Gallery to RequiredModules in a PowerShell
    manifest.

    .DESCRIPTION
    Add a module to RequiredModules in a PowerShell manifest. Add-RequiredModule
    uses Find-Module to find the module name, current version and GUID of a module
    and adds it to the RequiredModules section in the PowerShell manifest.

    .PARAMETER Path
    Path to PowerShell manifest file.

    .PARAMETER ModuleName
    Module name as it appears in the PowerShell Gallery.

    .PARAMETER VersionType
    Specify a specific version to load using RequiredVersion rather than ModuleVersion.
    When ModuleVersion is used it will load the newest version available with a
    minimum of the version specified.

    .EXAMPLE
    Add-RequiredModule -Path .\SwissKnife\SwissKnife.psd1 -ModuleName Configuration

    Adds the following hashtable to RequiredModules in SwissKnife.psd1:

    `@{
        GUID          = 'e56e5bec-4d97-4dfd-b138-abbaa14464a6'
        ModuleName    = 'Configuration'
        ModuleVersion = '1.3.1'
    }`

    .NOTES
    Author: Frederik Hjorslev Poulsen
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [string[]]$ModuleName,

        [Parameter(Mandatory = $false)]
        [ValidateSet('ModuleVersion', 'RequiredVersion')]
        [string]$VersionType = 'ModuleVersion'
    )

    begin {
        $RequiredModules = @((Import-PowerShellDataFile -Path $Path).RequiredModules)
    }

    process {
        $RequiredModules += Find-Module -Name $ModuleName | Select-Object -Property @{ Name = 'ModuleName'; Expression = { $_.Name } }, @{ Name = $VersionType; Expression = { $_.Version } }, @{ Name = 'GUID'; Expression = { $_.AdditionalMetadata.GUID } } | ConvertTo-HashTable
        Update-Metadata -Path $Path -PropertyName RequiredModules -Value $($RequiredModules | Sort-Object -Property @{Expression = { $_.ModuleName } })
    } # Process
} # Cmdlet