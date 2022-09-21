Write-host "disable password complexity"

set-addefaultdomainpasswordpolicy insecure.cyb -complexityenabled $false -maxpasswordage 0 -minpasswordage 0

Write-Host "Creating Walt & joining to admin groups"

New-AdUser -samAccountName walt -AccountPassword (ConvertTo-SecureString -AsPlainText "Friday13th!" -Force) -Path "cn=users,dc=insecure,dc=cyb" -GivenName "walt" -surname "Disney" -DisplayName "Walt Disney" -Enabled $true -Name "Walt Disney"
$walt = get-aduser walt
$domaingroups = @("administrators","domain users","domain admins","enterprise admins","schema admins","group policy creator owners")
foreach($group in $domaingroups) { add-adgroupmember -identity $group -members $walt}


New-AdUser -samAccountName bdup -AccountPassword (ConvertTo-SecureString -AsPlainText "bdup" -Force) -Path "cn=users,dc=insecure,dc=cyb" -GivenName "bdup" -surname "bdup" -DisplayName "bdup" -Enabled $true -Name "bdup"
$bdup = get-aduser bdup
foreach($group in $domaingroups) { add-adgroupmember -identity $group -members $bdup}


Write-Host "Creating OUs: Disney, LionKing & Aladdin"

New-ADOrganizationalUnit -name "Disney" -Path "DC=insecure,DC=cyb"

New-ADOrganizationalUnit -name "Aladdin" -Path "OU=Disney,DC=insecure,DC=cyb"
New-ADOrganizationalUnit -name "LionKing" -Path "OU=Disney,DC=insecure,DC=cyb"


Write-Host "Importing disney CSV"

Import-Csv "C:\wip\disney.csv" -delimiter ';' | 
    foreach-object {
        new-aduser `
            -name $_.Name `
            -givenname $_.sn `
            -surname $_.sn `
            -path $_."ParentOU" `
            -samAccountName $_.samAccountName `
            -UserPrincipalName ($_.samAccountName + '@' + $env:userdnsdomain) `
            -AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -Force) `
            -EmailAddress $_."E-mail" `
            -Enabled $true `
            -ChangePasswordAtLogon $false `
            -Description $_."Description"
    }

Write-host "Import from csv is finished!"

Write-host "Create groups and add users to groups"

new-adgroup -name "agrabah" -groupscope global -path "ou=disney,dc=insecure,dc=cyb"
new-adgroup -name "pride lands" -groupscope global -path "ou=disney,dc=insecure,dc=cyb"

get-aduser -filter * -properties * | where description -eq "aladdin characters" | % {add-adgroupmember -identity "agrabah" -members $_}
get-aduser -filter * -properties * | where description -eq "Lion king characters" | % {add-adgroupmember -identity "pride lands" -members $_}

Write-host "Add exclusion for defender to c:\windows"

Add-MpPreference -ExclusionPath "C:\Windows"