# blaise-stackdriver-logging

This repo contains stackdriver logging configurations for the Blaise VM's

The verison of Stackdriver that is currently installed is as per this url https://cloud.google.com/logging/docs/agent/installation#agent-install-windows, so version 1.10

For the purposes of Blaise - we are telling Stackdriver to follow log files from all of the C# services (except BlaiseUserSync).

This is done by customising the logging agent to send additional logs to Logging. For example https://cloud.google.com/logging/docs/agent/configuration#configure

Stackdriver is installed 'hands free' via the Azure pipeline / release and is installed into C:\BlaiseServices\Stackdriver\LoggingAgent\ on the relevent VM.

The custom configurations for Stackdriver are installed into C:\BlaiseServices\Stackdriver\LoggingAgent\config.d directory. 

Attached to this repo are the following files:-

   **custom-log VAL.conf** - custom config for VAL server to tell Stackdriver which logs to pick up.
   
   **custom-log TEL.conf** - custom config for TEL server to tell Stackdriver which logs to pick up.

    In each of the above configuration files the C# service(s) there is a <source> tag element for each C# service.  The log file specified in each <source> tag element is the file that gets pushed to Stackdriver. 

   **stackdriver.ps1** - This powershell script calls stackdriver-install-main.ps1 - and outputs to a txt file for logging purposes. This is the powershell script that gets called within the 'Stackdriver Delpoy' task group.

   **stackdriver-install-main.ps1** - This powershell script does an uninstall (if necessary) and re-install of Stackdriver
    
   **logservicestopped-unexpected-failure.ps1** - this creates a log file called BlaiseServices_Failure.log in C:\BlaiseServices\


## Azure Pipeline for Stackdriver

This gets the *.ps1 and *.conf files from the repo (https://github.com/ONSdigital/blaise-stackdriver-logging) and copies them into an artifact.

## Azure Release for Stackdriver

This does the following:
    
    Copies the necessary Stackdriver config files to the VAL and TEL vms - this is so that we ensure Stackdriver monitors these files
    
    Runs the 'Stackdriver Deploy' task group 
        - this copies the files from the artifact source location to the target foled on the VM C:\BlaiseServices\Stackdriver
        - Stops and deletes the Stackdriver windows service if its running
        - Runs ps script stackdriver.ps1 - which in turns runs stackdriver-install-main.ps1
    
## Blaise windows services configuration for unexpected failures

All of the Blaise windows services (except for BlaiseUserSync) are configured via the Azure Release pipeline in the following way in case of an unexpected failure of the windows service:-

    First Failure: set to "Restart the service"

    Second Failure: set to "Run a Program"

    The program that runs is C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
    with the 'command' of "Powershell -c C:\BlaiseServices\logservicestopped-unexpected-failure.ps1 -ServiceName <servicename>".  Note: <servicename> is replaced with the relevant c# service during the pipeline e.g. Powershell -c    C:\BlaiseServices\logservicestopped-unexpected-failure.ps1 -ServiceName BlaiseCaseBackup

    The above powershell script (logservicestopped-unexpected-failure.ps1) creates and/or appends to a log file called BlaiseServices_Failure.log in C:\BlaiseServices\ folder - ( Writing to a 'temp' log file initially and then to BlaiseServices_Failure.log - this is to avoid any read/write violations).
