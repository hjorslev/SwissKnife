Describe 'Get-WAYFMetadata' {
    It 'Gets results from WAYF' {
        { Get-WAYFMetadata } | Should -Not -Throw
    }

    It 'Finds schacHomeOrganization smk.dk' {
        (Get-WAYFMetadata).schacHomeOrganization.Where{ $_ -eq 'cbs.dk' } | Should -BeExactly 'cbs.dk'
    }
}