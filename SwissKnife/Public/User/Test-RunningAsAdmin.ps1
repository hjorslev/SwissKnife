function Test-RunningAsAdmin {
    <#
    .SYNOPSIS
    Test if session is executed as an admin.

    .DESCRIPTION
    Test if session is executed as an admin. Will return a boolean of true/false.

    .EXAMPLE
    Test-RunningAsAdmin

    False

    .NOTES
    Author: Frederik Hjorslev Poulsen

    Modified: 09/01-2020
    #>

    [CmdletBinding()]
    [OutputType('System.Boolean')]
    Param ()

    process {
        (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    } # Process
} # Cmdlet