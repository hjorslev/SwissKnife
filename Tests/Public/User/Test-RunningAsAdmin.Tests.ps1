Describe 'Test-RunningAsAdmin' {
    if ((Test-RunningAsAdmin) -eq $true) {
        It 'Finds that current session is elevated' {
            Test-RunningAsAdmin | Should -BeExactly $true
        }
    } elseif ((Test-RunningAsAdmin) -eq $false) {
        It 'Finds that current session is NOT elevated' {
            Test-RunningAsAdmin | Should -BeExactly $false
        }
    }
}