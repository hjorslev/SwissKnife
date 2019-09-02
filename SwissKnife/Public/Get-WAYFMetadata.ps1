function Get-WAYFMetadata {
    <#
    .SYNOPSIS
    List WAYF metadata.

    .DESCRIPTION
    Long description

    .EXAMPLE
    JSON summary of IdPs showing their schacHomeOrganization values.

    .NOTES
    Author: Frederik Hjorslev Poulsen
    #>

    [CmdletBinding()]
    param (
    )

    begin {
        $Metadata = @()
    }

    process {
        Invoke-RestMethod -Uri 'https://metadata.wayf.dk/idps.js' | Get-ObjectMember | ForEach-Object {
            $Metadata += $_.Value
        }
    }

    end {
        Write-Output -InputObject $Metadata | Select-Object -Property schacHomeOrganization, da, en | Sort-Object -Property schacHomeOrganization -Unique
    }
}