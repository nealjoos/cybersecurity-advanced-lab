
# Don't disconnect the NAT interface from the ISP router, or you can't reach the internet!
# Verify the vboxmanage path below, when needed

$vms = @("dns", "web", "companyrouter","dns","database","red","homerouter","employee")

ForEach($vm in $vms) {
    echo "Disabling NAT for $vm"
    & "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" controlvm $vm setlinkstate1 off
}