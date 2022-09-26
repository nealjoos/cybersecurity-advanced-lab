write-host "Configure dns a records"

Add-DnsServerResourceRecordA -ZoneName insecure.cyb -Name "router" -AllowUpdateAny -IPv4Address 172.30.42.62 -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -ZoneName insecure.cyb -Name "router" -AllowUpdateAny -IPv4Address 172.30.128.126 -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -ZoneName insecure.cyb -Name "router" -AllowUpdateAny -IPv4Address 192.168.56.254 -TimeToLive 01:00:00

Add-DnsServerResourceRecordA -ZoneName insecure.cyb -Name "database" -AllowUpdateAny -IPv4Address 172.30.42.3 -TimeToLive 01:00:00 


Add-DnsServerResourceRecordA -ZoneName insecure.cyb -Name "web" -AllowUpdateAny -IPv4Address 172.30.42.2 -TimeToLive 01:00:00 
Add-DnsServerResourceRecordA -ZoneName insecure.cyb -Name "www" -AllowUpdateAny -IPv4Address 172.30.42.2 -TimeToLive 01:00:00 

Add-DnsServerResourceRecord -TXT -ZoneName insecure.cyb -Name "fixme" -DescriptiveText "Have a look at zone transfer attacks, this dns entry should be private" -TimeToLive 01:00:00

## TODO manual through win10 client -> server manager -> DNS --> allow zone transfer
## AND REMOVE all host only ip addresses to dns

#write-host "configure static routes"
# done in ansible
## ROUTE: route /p add 172.30.128.0 mask 255.255.255.192 172.30.42.1 if <nr>
## New-NetRoute -DestinationPrefix "172.30.128.0/25" -InterfaceIndex <nr> -NextHop 172.30.42.1



write-host "create share task"
$share_Sta = New-ScheduledTaskAction -Execute "powershell -windowstyle hidden C:\wip\sharednstask.ps1"
$share_Stt = New-ScheduledTaskTrigger -AtStartup
Register-ScheduledTask FinancialShareAndDNS -Action $share_Sta -Trigger $share_Stt