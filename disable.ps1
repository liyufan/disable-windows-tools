$RegistryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System"
$RegistryName = "DisableRegistryTools"

if (-not (Test-Path -Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force
}
Set-ItemProperty -Path $RegistryPath -Name $RegistryName -Type DWord -Value 1

$ParentRegistryPath = "HKCU:\Software\Policies\Microsoft\MMC"
$GUID = "{8FC0B734-A0E1-11D1-A7D3-0000F87571E3}"
$RegistryPath = Join-Path -Path $ParentRegistryPath -ChildPath $GUID
$RegistryName = "Restrict_Run"

if (-not (Test-Path -Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force
}
Set-ItemProperty -Path $RegistryPath -Name $RegistryName -Type DWord -Value 1
