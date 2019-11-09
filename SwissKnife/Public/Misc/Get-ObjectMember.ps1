function Get-ObjectMember {
    <#
    .SYNOPSIS
    Helper to turn PSCustomObject into a list of key/value pairs

    .DESCRIPTION
    Helper to turn PSCustomObject into a list of key/value pairs

    .PARAMETER Object
    PSCustomObject

    .EXAMPLE
    Invoke-RestMethod -Uri 'https://metadata.wayf.dk/idps.js' | Get-ObjectMember | ForEach-Object {
        $_.Value
    }

    .NOTES
    Author: Tomalak

    .LINK
    https://stackoverflow.com/a/33521853
    #>

    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true,
            ValueFromPipeline=$true)]
        [PSCustomObject]$Object
    )
    $Object | Get-Member -MemberType NoteProperty | ForEach-Object {
        $Key = $_.Name
        [PSCustomObject]@{Key = $Key; Value = $Object."$Key" }
    }
}