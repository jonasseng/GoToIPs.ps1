$servers = get-content "C:\Dev\src\Powershell\URLs.txt" 
foreach ($server in $servers) {
trap [System.Management.Automation.MethodInvocationException]{
    write-host ("ERROR: " + $_) -Foregroundcolor Red; Continue}
Write-Host -NoNewline $server " resolves to "
[System.Net.Dns]::GetHostAddresses($server).IPAddressToString;
}
Read-Host -Prompt "Press Enter to exit"