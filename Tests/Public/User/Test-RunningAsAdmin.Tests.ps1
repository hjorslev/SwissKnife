Describe 'Test-RunningAsAdmin' {
    It 'It finds that current session is elevated' {
        Test-RunningAsAdmin | Should -BeExactly $true
    }
}