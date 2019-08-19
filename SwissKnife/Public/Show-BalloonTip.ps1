function Show-BalloonTip {
    <#
    .SYNOPSIS
    Display a Balloon Tip.

    .DESCRIPTION
    Displays a Balloon Tip in the notification center.

    .PARAMETER Title
    The title of the Balloon Tip.

    .PARAMETER Text
    The text / message in the Balloon Tip.

    .PARAMETER Icon
    The type of balloon tip icon to display. Valid types are:

    None: The balloon tip contain no symbols.

    Information: The balloon tip contains a symbol consisting of a lowercase letter i in a circle.

    Warning: The balloon tip contains a symbol consisting of an exclamation point in a triangle with a yellow background.

    Error: The balloon tip contains a symbol consisting of white X in a circle with a red background.

    .EXAMPLE
    Show-BalloonTip -Title 'New mail' -Text "You've got a new mail from Bill Gates." -Icon Info

    .NOTES
    Author: Frederik Hjorslev Poulsen

    Original script: https://gallery.technet.microsoft.com/scriptcenter/Show-BalloonTip-Show-a-1a932c95
    #>

    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        $Title,

        [Parameter(Mandatory = $true)]
        $Text,

        [ValidateSet('None', 'Info', 'Warning', 'Error')]
        $Icon = 'Info'
    )

    process {
        Add-Type -AssemblyName System.Windows.Forms

        if ($null -eq $Script:Balloon) {
            $Script:Balloon = New-Object System.Windows.Forms.NotifyIcon
        }

        $Path = Get-Process -Id $PID | Select-Object -ExpandProperty Path
        $Balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($Path)
        $Balloon.BalloonTipIcon = $Icon
        $Balloon.BalloonTipText = $Text
        $Balloon.BalloonTipTitle = $Title
        $Balloon.Visible = $true

        $Balloon.ShowBalloonTip(30000)
    }
}