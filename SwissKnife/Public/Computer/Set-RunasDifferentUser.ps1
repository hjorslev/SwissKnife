function Set-RunasDifferentUser {
    <#
    .SYNOPSIS
    Activate the option of running an application as a different user in the start menu in Windows 10.

    .DESCRIPTION
    The run as a different user option is disabled in the start menu in Windows 10. This script add a registry key allowing the user to run an application as a different user from the start menu.

    .PARAMETER Status
    Choose the status of Run as a different user: activate or deactivate.

    .EXAMPLE
    Set-RunasDifferentUser

    .NOTES
    Author: Frederik Hjorslev Poulsen

    In order for the change to take effect, the computer must be restarted. You'll be prompted to do this after the registry key has been added.
    #>

    [CmdletBinding(SupportsShouldProcess = $true,
        ConfirmImpact = 'High'
    )]
    param
    (
        [Parameter(Mandatory = $true
        )]
        [ValidateSet("Activate", "Deactivate")]
        [string]$Status
    )

    begin {
        # Checking if the user is running Windows 7. This scripts scope is Windows 10 since Run as a Different user works fine in Windows 7.
        if (Get-CimInstance -ClassName Win32_OperatingSystem | Where-Object -FilterScript { $_.Caption -notlike "*Windows 10*" }) {
            throw "You are not running Windows 10."
        }

        $RegKeyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer"
        $RegKey = "ShowRunasDifferentuserinStart"

        # Creating the Explorer registry key if it doesn't exist.
        if (-not (Get-Item -Path $RegKeyPath -ErrorAction SilentlyContinue)) {
            Write-Verbose -Message "Creating registry key: $($RegKeyPath)"
            New-Item -Path $RegKeyPath
            # Standard is deactivated.
            New-ItemProperty -Path $RegKeyPath -Name $RegKey -PropertyType DWord -Value '0'
        }
    }

    process {
        # Activates Run as Different user in the start menu.
        if ($Status -eq "Activate") {
            # Prompting the user if the script should continue or not.
            if ($PSCmdlet.ShouldProcess($RegKeyPath)) {
                Write-Verbose -Message "Setting $($RegKey) with value 1."
                Set-ItemProperty -Path $RegKeyPath -Name $RegKey -Value "1"
            }
        }

        # Deactivates Run as Different user in the start menu.
        if ($Status -eq "Deactivate") {
            # Prompting the user if the script should continue or not.
            if ($PSCmdlet.ShouldProcess($RegKeyPath)) {
                Write-Verbose -Message "Setting $($RegKey) with value 0."
                Set-ItemProperty -Path $RegKeyPath -Name $RegKey -Value '0'
            }
        }
    } # Process

    end {
        # Prompts the user to restart the computer for the changes to take effect.
        # If $Status is eq $null no changes has been requested and no restart is needed.
        if (-not ($null -eq $Status)) {
            Write-Verbose -Message 'Computer must be restarted for changes to take effect.'
        }
    } # End
} # Cmdlet