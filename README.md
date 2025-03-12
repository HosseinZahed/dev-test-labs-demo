### DevTest Labs

This repository contains the following files:

1. **Terms.html**: This file contains the Terms and Conditions for using DevTest Labs. It outlines the rules and regulations for the use of our services.

2. **DevTestLabsConfig.ps1**: This PowerShell script performs the following tasks:
   - Restricts access to specified websites by modifying the hosts file.
   - Downloads the latest version of the `Terms.html` file from the GitHub repository.
   - Creates a scheduled task to open the `Terms.html` file each time the user logs on to the VM.

By using this script, you ensure that users are aware of the Terms and Conditions each time they connect to the VM.


