# Hardening

## Ansible inventory file

```yaml
all:
    children:
        linux:
            hosts:
                companyrouter:
                    ansible_host: localhost
                    ansible_port: 2222
                web:
                    ansible_host: 172.30.64.10
                database:
                    ansible_host: 172.30.0.15
                dns:
                    ansible_host: 172.30.0.4
            vars:
                ansible_user: vagrant
                ansible_ssh_private_key_file: "/home/ansible/.ssh/id_rsa"
                ansible_ssh_common_args: "-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
                ansible_python_interpreter: auto_silent
```

1. Run an ad-hoc ansible command to check if the date of all machines are configured the same. Are you able to use the same Windows module for Linux machines and vice versa?

    ```bash
    ansible -i inventory.yml -m command -a "date" linux
    ```

2. Create a playbook (or ad-hoc command) that pulls all /etc/passwd files from all Linux machines locally to the ansible controller node for every machine seperately.

    ```bash
    ansible-playbook -i inventory.yml pull-passwd.yml
    ```

3. Create a playbook (or ad-hoc command) that creates the user "walt" with password Friday13th! on all Linux machines.

    ```bash
    ansible-playbook -i inventory.yml create-user.yml
    ```

4. Create a playbook (or ad-hoc command) that pulls all users that are allowed to log in on all Linux machines.

    ```bash
    ansible-playbook -i inventory.yml list-allowed-users.yml
    ```

5. Create a playbook (or ad-hoc command) that calculates the hash (md5sum for example) of a binary (for example the ss binary).

    ```bash
    ansible-playbook -i inventory.yml calculate-hash.yml
    ```

6. Create a playbook (or ad-hoc command) that copies a file (for example a txt file) from the ansible controller machine to all Linux machines.

    ```bash
    ansible-playbook -i inventory.yml copy-file.yml
    ```
