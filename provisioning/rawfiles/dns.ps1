Add-DnsServerResourceRecordA -ZoneName insecure.cyb -Name "router" -AllowUpdateAny -IPv4Address 172.30.42.1 -TimeToLive 01:00:00
Add-DnsServerResourceRecordA -ZoneName insecure.cyb -Name "database" -AllowUpdateAny -IPv4Address 172.30.42.3 -TimeToLive 01:00:00 


Add-DnsServerResourceRecordA -ZoneName insecure.cyb -Name "web" -AllowUpdateAny -IPv4Address 172.30.42.2 -TimeToLive 01:00:00 
Add-DnsServerResourceRecordA -ZoneName insecure.cyb -Name "www" -AllowUpdateAny -IPv4Address 172.30.42.2 -TimeToLive 01:00:00 

Add-DnsServerResourceRecord -TXT -ZoneName insecure.cyb -Name "fixme" -DescriptiveText "Have a look at zone transfer attacks, this dns entry should be private" -TimeToLive 01:00:00

## TODO manual through win10 client -> server manager -> DNS --> allow zone transfer
