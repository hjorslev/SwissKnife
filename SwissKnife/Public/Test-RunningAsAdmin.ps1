function Test-RunningAsAdmin {
    <#
    .SYNOPSIS
    Test if session is executed as an admin.

    .DESCRIPTION
    Test if session is executed as an admin. Will return af boolean of true/false.

    .EXAMPLE
    Test-RunningAsAdmin

    False

    .NOTES
    Author: Frederik Hjorslev Poulsen
    #>

    [CmdletBinding()]
    Param ()

    process {
        (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    } # Process
} # Cmdlet