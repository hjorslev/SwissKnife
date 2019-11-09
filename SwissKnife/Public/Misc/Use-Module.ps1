function Use-Module {
    <#
    .SYNOPSIS
    Load a module.

    .DESCRIPTION
    Loads a module. Depending on whether the console is elevated or not the module
     will be installed globally on the machine or locally in the user's folder.

    .PARAMETER Name
    Specify the name of the module.

    .EXAMPLE
    Use-Module -Name Logging

    .NOTES
    Author: Frederik Hjorslev Poulsen

    .LINK
    https://hjorslev.github.io/SwissKnife/Use-Module.html
    #>

    [CmdletBinding()]
    param (
        [string]$Name
    )

    process {
        # If module is imported say that and do nothing.
        if (Get-Module -Name $Name) {
            Write-Warning -Message "Module $($Name) is already imported."
        } else {
            # If module is not imported, but available on disk then import.
            if (Get-Module -Name $Name -ListAvailable) {
                # Load module
                Write-Verbose -Message "Initializing $($Name)"
                Import-Module -Name $Name
                # Runs background job where module is updated if needed.
                Start-Job -Name "Update $($Name)" -ScriptBlock { Update-Module -Name $Name -Force } | Out-Null

            } else {
                # If module is not imported, not available on disk, but is in online gallery then install and import.
                if (Find-Module -Name $Name) {
                    # If prompt is elevated module making it available to all users else it's installed locally.
                    if (Test-RunningAsAdmin -eq $true) {
                        Write-Verbose -Message "Installing $($Name) globally, making it available for all users. Hang on."
                        Install-Module -Name $Name -Force
                        Import-Module -Name $Name
                    } else {
                        Write-Verbose -Message "Installing $($Name) locally, making it available for $($env:USERNAME). Hang on."
                        Install-Module -Name $Name -Force -Scope CurrentUser -AllowClobber
                        Import-Module -Name $Name
                    }
                } else {
                    # If module is not imported, not available and not in online gallery then abort.
                    Throw "Module $($Name) not imported, not available and not in online gallery, exiting."
                }
            }
        }
    } # Process
} # Cmdlet