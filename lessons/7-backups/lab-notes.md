# Backups

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
