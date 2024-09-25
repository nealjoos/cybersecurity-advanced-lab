
# Don't disconnect the NAT interface from the ISP router, or you can't reach the internet!
# Verify the vboxmanage path below, when needed
# If you need to change your execution policy, review the Windows Server lessons or take a look at the official documentation: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.4


$vms = @(
    "companyrouter",
    "dns",
    "web",
    "database",
    "employee",
    "homerouter",
    "remote-employee",
)

ForEach($vm in $vms) {
    echo "Disabling NAT for $vm"
    & "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" controlvm $vm setlinkstate1 off
}
