if (-not(Test-Path -Path 'C:\\Users\\cherr\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\user.ahk' -PathType Leaf)) {
    New-Item -ItemType SymbolicLink -Path 'C:\\Users\\cherr\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\user.ahk' -Target "$env:CONFIG_TARGET\\windows\\user.ahk"
}

if (-not(Test-Path -Path 'C:\\Users\\cherr\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\startup.bat' -PathType Leaf)) {
    New-Item -ItemType SymbolicLink -Path 'C:\\Users\\cherr\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\startup.bat' -Target "$env:CONFIG_TARGET\\windows\\startup.bat"
}

# if (-not(Test-Path -Path 'C:\\Users\\cherr\\AppData\\Roaming\\espanso\\match\\base.yml' -PathType Leaf)) {
    # New-Item -ItemType SymbolicLink -Path 'C:\\Users\\cherr\\AppData\\Roaming\\espanso\\match\\base.yml' -Target "$env:CONFIG_TARGET\\windows\\espanso.yml"
# }

if (-not(Test-Path -Path 'C:\\Users\\cherr\\OneDrive\\Documents\\PowerShell\\Microsoft.PowerShell_profile.ps1' -PathType Leaf)) {
    New-Item -ItemType SymbolicLink -Path 'C:\\Users\\cherr\\OneDrive\\Documents\\PowerShell\\Microsoft.PowerShell_profile.ps1' -Target "$env:CONFIG_TARGET\\windows\\profile.ps1"
}
