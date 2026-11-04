$GroupPolicy = "HKCU:\Software\Policies\Microsoft\MMC\{8FC0B734-A0E1-11D1-A7D3-0000F87571E3}"
New-Item -Path $GroupPolicy -Force
New-ItemProperty -Path $GroupPolicy -Name "Restrict_Run" -PropertyType DWord -Value 1

$System = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System"
New-Item -Path $System
New-ItemProperty -Path $System -Name "DisableRegistryTools" -PropertyType DWord -Value 1
