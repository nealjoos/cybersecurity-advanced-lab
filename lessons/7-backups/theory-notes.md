# Backups

1.  What different "rules" exist when talking about a backup strategy?

        - 3-2-1 rule: 3 copies of your data, 2 different media, 1 offsite
        - 3-2-1-1-0 rule: 3 copies of your data, 2 different media, 1 offsite, 1 offline, 0 errors
        - 4-3-2 rule: 4 copies of your data, 3 different locations, 2 offsite

2.  What is the difference between a full vs an incremental backup? Give for both advantages and downsides.

        - Full backup: A full backup is a complete copy of all your data. It is the most comprehensive backup type, but it is also the most time-consuming and resource-intensive.
        - Incremental backup: An incremental backup only copies the data that has changed since the last backup. It is faster and requires less storage space than a full backup, but it is more complex to restore.

3.  Why do some people state that "synchronisation with a cloud service (OneDrive, Dropbox, Google Drive) is not a synonym for backups"?

        Synchronization with a cloud service is not a synonym for backups because it does not provide versioning or protection against accidental deletion or corruption. If a file is deleted or corrupted on your local device, it will also be deleted or corrupted on the cloud service. It does also not protect against ransomware attacks.

4.  When using a cloud storage to store backups, like OneDrive, you can assume they provide backups and maybe have a backup strategy in place. Why do cyber security experts state it is still not enough to only store critical data on (this) one place? In other words why is putting 100% trust on a cloud provider a (potential) bad idea?

        Putting 100% trust on a cloud provider is a bad idea because cloud providers can experience outages, data loss, or security breaches. If your critical data is stored in only one place, you are at risk of losing it if the cloud provider has an issue. It is always recommended to have multiple copies of your data in different locations to ensure its safety and availability.
