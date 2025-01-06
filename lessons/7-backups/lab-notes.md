# Backups

**Password**: `vagrant`

Run Borg commands using

```bash
borg COMMAND ssh://database/~/backups
```

1. Create a folder on the web VM and store the files (e.g. ~/important-files). Use curl with the --location and --remote-name-all options. What do these options do? Why do you need them? Do you really need them? What happens without them?

    - The `--location` option is used to follow redirects. The `--remote-name-all` option is used to save the file with the same name as the remote file. You need these options to download the file from the remote server and save it with the same name. If you don't use these options, the file will be saved with a different name.

-   With which bash command can you see the size of the folder with the files on the webserver? How big is that folder? Tip: try with and without the --si option. Which corresponds with the output of borg? Where do you find this in the BorgBackup documentation?

    `du` command can be used to see the size of the folder with the files on the webserver. The size of the folder is 1676 kB. The output of `du` without the `--si` option corresponds with the output of borg. The `--si` option is used to display the sizes in human-readable format.

-   Now check the size of the backups folder on the database server.

        The size of the backups folder on the database server is 1780 kB.

-   What is the difference between Original size, Compressed size and Deduplicated size? Can you link this with the sizes you found for the folders on the web and db VM's? Make sure you comprehend this!

        -   Original size is the size of the data before compression and deduplication.
        -   Compressed size is the size of the data after compression.
        -   Deduplicated size is the final storage requirement after eliminating redundant data chunks across files and archives. Deduplication identifies identical chunks of data across all  files (or previous backups) and stores only one copy of each unique chunk.

-   What are chunks?

        Chunks are the smallest unit of data that BorgBackup can store. BorgBackup breaks down the data into chunks and stores them in the repository.

9.  It is necessary to periodically check the integrity of the borg repository. With which command can this be done? When should I use the --verify-data option? Tip: use --verbose to see more information.

        The integrity of the borg repository can be checked using the `borg check` command. The `--verify-data` option should be used when you want to verify the data integrity of the repository.

10. Restore the original files using the first backup on the database server (without the test.txt file) to the same place on web so it seems like nothing has happened. --strip-elements may come in handy here as borg uses absolute paths inside backups. You should see a similar output after restoring the backup:

        borg extract /path/to/repo::my-files

11. Automate the backups and set an appropriate retention policy. Look at the documentation to have a starting point. What is the retention policy here? Have you ever heard of the Grandfather-Father-Son policy? The automation should create a backup every 5 minutes. There are various ways to do this, but we prefer a systemd timer to execute the script on the time intervals.

        Retention policy is the policy that defines how long the backups should be kept. The Grandfather-Father-Son policy is a backup rotation scheme that keeps daily, weekly, and monthly backups.

    -   What does the borg compact command do?

            The `borg compact` command removes the segments of the repository that are no longer needed. It rewrites the repository to remove the segments that are no longer referenced by any archive.

-   There is a tool that has been built on top of borg called borgmatic. What does it do? Could it be useful to you? Why (not)?

        Borgmatic is a wrapper script for BorgBackup that simplifies the configuration and management of backups. It automates the backup process and provides a simple configuration file to define the backup settings. It could be useful to automate the backup process and manage the backup settings.
