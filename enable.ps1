$RegistryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System"
$RegistryName = "DisableRegistryTools"

if (Test-Path $RegistryPath) {
    Remove-ItemProperty -Path $RegistryPath -Name $RegistryName -ErrorAction SilentlyContinue

    $RegistryKey = Get-Item $RegistryPath
    if ($RegistryKey.GetValueNames().Count -eq 0 -and $RegistryKey.GetSubKeyNames().Count -eq 0) {
        Remove-Item -Path $RegistryPath -Force
    }
}

$ParentRegistryPath = "HKCU:\Software\Policies\Microsoft\MMC"
$GUID = "{8FC0B734-A0E1-11D1-A7D3-0000F87571E3}"
$RegistryPath = Join-Path -Path $ParentRegistryPath -ChildPath $GUID
$RegistryName = "Restrict_Run"

if (Test-Path $RegistryPath) {
    Remove-ItemProperty -Path $RegistryPath -Name $RegistryName -ErrorAction SilentlyContinue

    $RegistryKey = Get-Item $RegistryPath
    if ($RegistryKey.GetValueNames().Count -eq 0 -and $RegistryKey.GetSubKeyNames().Count -eq 0) {
        Remove-Item -Path $RegistryPath -Force
    }
}

if (Test-Path $ParentRegistryPath) {
    $RegistryKey = Get-Item $ParentRegistryPath
    if ($RegistryKey.GetValueNames().Count -eq 0 -and $RegistryKey.GetSubKeyNames().Count -eq 0) {
        Remove-Item -Path $ParentRegistryPath -Force
    }
}
