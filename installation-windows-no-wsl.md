# Installation on Windows without WSL

If you decide not to use WSL, you will have to use a virtual machine to install ansible, bring over this repository and perform all actions on this machine. We suggest to use the companyrouter.

You should have done `vagrant up` to download all machines, and removed all nat interfaces using the PowerShell script. 

1. If needed: manually check the "cable connected" option of the nat interface of the companyrouter temporarily so the machine has internet access again.

2. Install git and ansible `sudo dnf update && sudo dnf install -y git ansible-core sshpass`

3. Afterwards install `ansible-galaxy collection install ansible.posix` and `ansible-galaxy collection install community.general`

4. Download this repository to the virtual machine using git: `git clone https://github.com/HoGentTIN/cybersecurity-advanced-lab-template.git`.

5. `ansible fake_internet --inventory ansible/inventory.yml --module-name ping` should work.

6. `sudo ansible`

7. `ansible-playbook --inventory ansible/inventory.yml ansible/playbook.yml` should work.

8. Do not forget to disable the "cable connected" option on the nat interface again.


