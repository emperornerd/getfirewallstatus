$filename="firewallstate.txt"
$computers=get-content .\workstations.txt

if (Test-Path $FileName) {
  Remove-Item $FileName
}

foreach ($computer in $computers)
{
echo $computer >> firewallstate.txt
psexec \\$computer Netsh Advfirewall show allprofiles | findstr State >> .\firewallstate.txt
} 

# Turn firewall on: psexec \\[computername] netsh advfirewall set domainprofile state on
# Turn firewall off: psexec \\[computername] netsh advfirewall set domainprofile state off