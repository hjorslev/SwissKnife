#requires -runAsAdministrator
function Set-OfficeUpdateChannel {
    <#
    .SYNOPSIS
    Configure the Update Channel for Microsoft Office 365.

    .DESCRIPTION
    Configure the Update Channel for Microsoft Office. Allows the user to choose
    how often they want to receive updates for Microsoft Office 365.

    .PARAMETER Channel
    Set the Update Channel. Learn more about the different values:
    https://docs.microsoft.com/en-us/deployoffice/overview-of-update-channels-for-office-365-proplus

    .PARAMETER Force
    The Force parameter allows the user to skip the "Should Continue" box.

    .EXAMPLE
    Set-OfficeUpdateChannel -Channel Monthly

    .NOTES
    Author: Frederik Hjorslev Poulsen

    .LINK
    https://hjorslev.github.io/SwissKnife/Set-OfficeUpdateChannel.html
    #>

    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '', Justification='Is implemented but not accepted by PSSA.')]
    [CmdletBinding(SupportsShouldProcess = $true,
        ConfirmImpact = 'Medium'
    )]
    param (
        [ValidateSet('Monthly', 'MonthlyTargeted', 'SemiAnnual', 'SemiAnnualTargeted')]
        [Parameter(Mandatory = $true)]
        [string]$Channel,

        [switch]$Force
    )

    begin {
        $RegistryItem = 'HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration'
        $ItemProperty = 'CDNBaseUrl'
        if (-not (Get-ItemProperty -Path $RegistryItem -Name $ItemProperty -ErrorAction SilentlyContinue)) {
            New-ItemProperty -Path $RegistryItem -Name $ItemProperty
        }
    }

    process {
        if ($Force -or $PSCmdlet.ShouldContinue("Do you want to set the Office Update Channel to $($Channel)?", 'Update Office Channel')) {
            # Remove some properties and item: https://docs.microsoft.com/en-us/office365/troubleshoot/administration/switch-channel-for-office-365
            if (Get-ItemProperty -Path $RegistryItem -Name 'UpdateUrl' -ErrorAction SilentlyContinue) {
                Remove-ItemProperty -Path $RegistryItem -Name 'UpdateUrl'
            }
            if (Get-ItemProperty -Path $RegistryItem -Name 'UpdateToVersion' -ErrorAction SilentlyContinue) {
                Remove-ItemProperty -Path $RegistryItem -Name 'UpdateToVersion'
            }
            if (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Updates' -Name 'UpdateToVersion' -ErrorAction SilentlyContinue) {
                Remove-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Updates' -Name 'UpdateToVersion'
            }
            if (Get-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Office\16.0\Common\OfficeUpdate' -ErrorAction SilentlyContinue) {
                Remove-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Office\16.0\Common\OfficeUpdate'
            }

            switch ($Channel) {
                Monthly {
                    $CDNBaseUrl = 'http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60'
                    Set-ItemProperty -Path $RegistryItem -Name $ItemProperty -Value $CDNBaseUrl
                    Write-Verbose -Message "Setting Update Channel to Monthly."
                }
                MonthlyTargeted {
                    $CDNBaseUrl = 'http://officecdn.microsoft.com/pr/64256afe-f5d9-4f86-8936-8840a6a4f5be'
                    Set-ItemProperty -Path $RegistryItem -Name $ItemProperty -Value $CDNBaseUrl
                    Write-Verbose -Message "Setting Update Channel to Monthly Targeted."
                }
                SemiAnnual {
                    $CDNBaseUrl = 'http://officecdn.microsoft.com/pr/7ffbc6bf-bc32-4f92-8982-f9dd17fd3114'
                    Set-ItemProperty -Path $RegistryItem -Name $ItemProperty -Value $CDNBaseUrl
                    Write-Verbose -Message "Setting Update Channel to Semi-Annual."
                }
                SemiAnnualTargeted {
                    $CDNBaseUrl = 'http://officecdn.microsoft.com/pr/b8f9b850-328d-4355-9145-c59439a0c4cf'
                    Set-ItemProperty -Path $RegistryItem -Name $ItemProperty -Value $CDNBaseUrl
                    Write-Verbose -Message "Setting Update Channel to Semi-Annual Targeted."
                }
                Default { <##> }
            } # Switch
        } # If
    } # Process
} # Cmdlet