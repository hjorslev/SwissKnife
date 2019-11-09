function Get-OfficeUpdateChannel {
    <#
    .SYNOPSIS
    Get the current Office Update Channel for Microsoft Office 365.

    .DESCRIPTION
    Get the current Office Update Channel for Microsoft Office 365.

    .EXAMPLE
    Get-OfficeUpdateChannel

    .NOTES
    Author: Frederik Hjorslev Poulsen

    .LINK
    https://hjorslev.github.io/SwissKnife/Get-OfficeUpdateChannel.html
    #>

    [CmdletBinding()]
    param (
    )

    begin {
        $RegistryItem = 'HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration'
        $ItemProperty = 'CDNBaseUrl'
    }

    process {
        if (-not (Get-ItemProperty -Path $RegistryItem -Name $ItemProperty -ErrorAction SilentlyContinue)) {
            Write-Error -Message 'No Office Update Channel were found' -Category ObjectNotFound
        } elseif ((Get-ItemProperty -Path $RegistryItem -Name $ItemProperty).CDNBaseUrl.Where{ $_ -eq 'http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60' }) {
            [PSCustomObject]@{
                Monthly = 'http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60'
            }
        } elseif ((Get-ItemProperty -Path $RegistryItem -Name $ItemProperty).CDNBaseUrl.Where{ $_ -eq 'http://officecdn.microsoft.com/pr/64256afe-f5d9-4f86-8936-8840a6a4f5be' }) {
            [PSCustomObject]@{
                MonthlyTargeted = 'http://officecdn.microsoft.com/pr/64256afe-f5d9-4f86-8936-8840a6a4f5be'
            }
        } elseif ((Get-ItemProperty -Path $RegistryItem -Name $ItemProperty).CDNBaseUrl.Where{ $_ -eq 'http://officecdn.microsoft.com/pr/7ffbc6bf-bc32-4f92-8982-f9dd17fd3114' }) {
            [PSCustomObject]@{
                SemiAnnual = 'http://officecdn.microsoft.com/pr/7ffbc6bf-bc32-4f92-8982-f9dd17fd3114'
            }
        } elseif ((Get-ItemProperty -Path $RegistryItem -Name $ItemProperty).CDNBaseUrl.Where{ $_ -eq 'http://officecdn.microsoft.com/pr/b8f9b850-328d-4355-9145-c59439a0c4cf' }) {
            [PSCustomObject]@{
                SemiAnnualTargeted = 'http://officecdn.microsoft.com/pr/b8f9b850-328d-4355-9145-c59439a0c4cf'
            }
        }
    } # Process
} # Cmdlet