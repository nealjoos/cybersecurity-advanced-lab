# Overview of all Security issues put in this insecure.cyb

## DNS (DC) allows zone transfer on insecure.cyb

- Disable zone transfer

## User bdup exists on multiple systems with password bdup

- Remove Local user on employee1 with sudo privileges

## Insecure website that allows command injection

- Java systemd service runs as root instead of low priv user

## www.insecure.cyb uses http instead of https

- Listen on port 443 with self signed certs 

## Word readable share on \\dc\Financial that allows anonymous login

- Change share settings and maybe NTFS settings as well

## Windows client has a task scheduled to send sensitive information to somewhere (right now -> router)


## Employee1 has a cron job that calls back to somewhere (right now -> router) that allows a listener on the router to spawn a reverse shell


## Database (mysql) has an insecure configuration

- Brute force attacks are possible 
- Root password is insecure (password)
- bdup user exists with password bdup

