#!/usr/bin/env bash

# Don't disconnect the NAT interface from the ISP router, or you can't reach the internet!

for vm in \
    "companyrouter" \
    "dns" \
    "web" \
    "database" \
    "employee" \
    "homerouter" \
    "remote-employee"
do
    echo "Disabling NAT for ${vm}"
    VBoxManage controlvm "${vm}" setlinkstate1 off
done
