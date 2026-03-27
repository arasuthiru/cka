This Ansible playbook automates the process of fetching files from a remote server, ensuring that only desired files are transferred to the local system. The logic is divided into tasks for different directories, with specific operations for each:

Directories Handled

ACRA_DATA_MOD
DB_USER_LOGGON
ACRA_TABLE_MOD
DB_USER_ACCT_MOD
Process for ACRA_DATA_MOD and DB_USER_LOGGON

Listing and Gzipping:
Find all CSV files matching a specific monthly pattern.
Gzip these files to reduce size.
Checking and Fetching:
Use stat to ensure files are non-empty.
Fetch gzipped files to local directories.
Process for ACRA_TABLE_MOD and DB_USER_ACCT_MOD

Listing Files:
Identify files matching the given pattern.
Checking and Fetching:
Use stat to verify non-empty files.
Fetch these files directly without gzipping.
Dynamic Paths and Conditions:

Variable month: Extracts MM to dynamically create folder paths on local storage (/mnt/windows-share/{{ mm }}/DB/...).
Conditional Fetching: Ensures only files that exist and have a size greater than zero are transferred.
Key Benefits
Efficiency: Only non-empty, relevant files are transferred.
Modularity: Easily adaptable to handle additional directories or file types.
Automation: Reduces manual effort in managing file transfers between servers.
This playbook is a comprehensive solution for managing multiple directories, gzipping where necessary, and optimizing file transfer operations.