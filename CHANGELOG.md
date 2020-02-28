# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/)
and this project adheres to [Semantic Versioning](https://semver.org/).

## [0.1.1] - Unreleased

### Added

- Get-OfficeUpdateChannel
  - Get the current Office Update Channel for Microsoft Office 365.
- Set-OfficeUpdateChannel
  - Configure the Update Channel for Microsoft Office.
- Add-RequiredModule
  - Add a module to RequiredModules in a PowerShell manifest. Add-RequiredModule
uses Find-Module to find the module name, current version and GUID of a module
and adds it to the RequiredModules section in the PowerShell manifest.
- SwissKnife module dependencies
  - Configuration
  - ImportExcel
  - PSScriptTools
- Pester Tests
  - Test-RunningAsAdmin

## [0.1.0] - 08/11-2019

Initial module version.

### Added

- Cmdlets
  - Get-ObjectMember
  - Get-WAYFMetadata
  - Set-RunasDifferentUser
  - Test-RunningAsAdmin
  - Use-Module
