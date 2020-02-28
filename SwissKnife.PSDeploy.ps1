Deploy $env:BHProjectName {
    By AppVeyorModule {
        FromSource $env:BHProjectName
        To AppVeyor
        WithOptions @{
            Version = (Test-ModuleManifest -Path $env:BHPSModuleManifest).Version
        }
    }
}