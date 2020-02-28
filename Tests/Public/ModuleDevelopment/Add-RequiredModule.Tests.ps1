Describe 'Add-RequiredModule' {
    # Create module manifest for testing.
    $ManifestPath = "$($TestDrive)\ModuleManifest.psd1"
    New-ModuleManifest -Path $ManifestPath -RequiredModules @(@{ GUID = '1043b347-925c-4b8b-9cd9-075bc9f9a153'; ModuleName = 'SteamPS'; ModuleVersion = '2.0.3' })

    It 'Adds a module (RequiredVersion) to a manifest' {
        { Add-RequiredModule -Path $ManifestPath -ModuleName 'Configuration' -VersionType RequiredVersion } | Should -Not -Throw
    }

    It 'Adds a module (ModuleVersion) to a manifest' {
        { Add-RequiredModule -Path $ManifestPath -ModuleName 'AzureAD' -VersionType ModuleVersion } | Should -Not -Throw
    }

    It 'Finds the ModuleName "AzureAD" from manifest' {
        (Import-PowerShellDataFile -Path $ManifestPath).RequiredModules.ModuleName[0] | Should -BeExactly 'AzureAD'
    }

    It 'Finds the ModuleName "Configuration" from manifest' {
        (Import-PowerShellDataFile -Path $ManifestPath).RequiredModules.ModuleName[1] | Should -BeExactly 'Configuration'
    }
}