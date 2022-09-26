NET USER Guest /active
NET SHARE Financial=C:\Financial /grant:"BUILTIN\Administrators,FULL" /grant:"Everyone,FULL"
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Sharing /v FinancialShareName /t REG_SZ  /d "Financial" /f 
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Shares /v Financial /t REG_MULTI_SZ /d "CATimeout=0 CSCFlags=2048 MaxUses=4294967295 PATH=C:\Financial Permissions=0 Remark= ShareName=Financial Type=0" /f 

$aclfromusers = Get-Acl C:\users
set-acl -AclObject $aclfromusers C:\Financial


$h = @("dc", "@", "DomainDnsZones", "ForestDnsZones")
foreach($i in $h) { Remove-DnsServerResourceRecord -ZoneName insecure.cyb -RecordData "10.0.2.15" -RRType "A" -Name $i -Force }
