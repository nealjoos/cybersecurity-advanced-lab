
# Don't disconnect the NAT interface from the ISP router, or you can't reach the internet!
# Verify the vboxmanage path below, when needed

$vms = @(
    "companyrouter",
    "dns",
    "web",
    "database",
    "employee",
    "homerouter",
    "remote_employee",
    "debug"    
)

ForEach($vm in $vms) {
    echo "Disabling NAT for $vm"
    & "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" controlvm $vm setlinkstate1 off
}