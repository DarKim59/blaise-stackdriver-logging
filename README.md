# blaise-stackdriver-logging
This contains stackdriver logging / monitoring and configurations for the Blaise VM's

This repo contains Stackdriver install.ps1 - this script can be used to install Stackdriver.

Run the above script as an admin on one of the VM's - this will install Stackdriver (in silent mode) in to the default directory. 

https://cloud.google.com/logging/docs/agent/installation#agent-install-windows



For the purposes of Blaise - we are streaming the log files from all of the C# services.

This is done by customising the logging agent to send additional logs to Logging by adding input configurations. For example https://cloud.google.com/logging/docs/agent/configuration#configure

The custom configurations are installed into C:\Program Files (x86)\Stackdriver\LoggingAgent\config.d directory. 

Attached to this repo are the following files:-

    custom-log VAL.conf
    custom-log TEL.conf

In each of the above configuration files the C# service(s) there is a <source> tag element for each C# service.  The log file specified in each <source> tag element is the file that gets
pushed to Stackdriver. 

## Set up: (currently there is a manual option to copy file to the VM's')

1. Copy the .conf in the repo to the VM
2. Copy LogServiceStopped_unexpected_failure.ps1 into the C:|BlaiseServices\ folder on the VM.


## The following configuration below (manual option) is done automatically by the Azure pipelines for all c# services. No manual configuration of the winodows service is required now.  Left below description for information.

## MANUAL - Configure windows services to log a message to a file when an unexpected failure occures

    1. On the Blaise c# windows service, right click and goto the properties.  Go to the recovery tab, ensure the following:-
    
            First Failure: set to "Restart the service"

            Second Failure: set to "Run a Program"

            In the program text box enter: path to powershell.exe e.g. C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe

            In the 'command' text box enter: <command for running powershell script> e.g. Powershell -c C:\BlaiseServices\LogServiceStopped_unexpected_failure.ps1 -ServiceName <servicename> 

                replace <servicename> with relevant c# service that you are setting this up for. e.g. Powershell -c     C:\BlaiseServices\LogServiceStopped_unexpected_failure.ps1 -ServiceName BlaiseCaseBackup
    
      
        e.g. Command line example for 2 of the windows services

        Service	                            Command line param
    
        BlaiseProcessMessageService	        Powershell -c C:\BlaiseServices\LogServiceStopped_unexpected_failure.ps1 -ServiceName BlaiseProcessMessageService

        BlaiseCaseBackup                    Powershell -c C:\BlaiseServices\LogServiceStopped_unexpected_failure.ps1 -ServiceName BlaiseCaseBackup
    

        The above powershell script referenced creates and/or appends to a log file called BlaiseServices_Failure.log in C:\BlaiseServices folder

    2. Copy the powershell script (LogServiceStopped_unexpected_failure.ps1) from the repo into C:\dev folder on the VM

    
    
    
    
    
    
    

