# blaise-stackdriver-logging

This contains stackdriver logging / monitoring and configurations for the Blaise VM's

https://cloud.google.com/logging/docs/agent/installation#agent-install-windows

For the purposes of Blaise - we are streaming the log files from all of the C# services.

This is done by customising the logging agent to send additional logs to Logging by adding input configurations. For example https://cloud.google.com/logging/docs/agent/configuration#configure

Stackdriver is installed into C:\BlaiseServices\Stackdriver\LoggingAgent\

The custom configurations for Stackdriver are installed into C:\BlaiseServices\Stackdriver\LoggingAgent\config.d directory. 

Attached to this repo are the following files:-

    custom-log VAL.conf
    custom-log TEL.conf

    In each of the above configuration files the C# service(s) there is a <source> tag element for each C# service.  The log file specified in each <source> tag element is the file that gets pushed to Stackdriver. 

    stackdriver.ps1 - This powershell script calls Stackdriver_Install_main.ps1 - and outputs to a txt file for logging purposes. This is the powershell script that gets called within the 'Stackdriver Delpoy' task group.

Stackdriver_Install_main.ps1 - This powershell script does an uninstall (if necessary) and re-install of Stackdriver


## Azure Pipeline for Stackdriver

This gets the *.ps1 and *.conf files from the repo (https://github.com/ONSdigital/blaise-stackdriver-logging) and copies them into an artifact.

## Azure Release for Stackdriver

This does the following:
    
    Copies the necessary Stackdriver config files to the VAL and TEL vms - this is so that we ensure Stackdriver monitors these files
    
    Runs the 'Stackdriver Deploy' task group 
        - this copies the files from the artifact source location to the target foled on the VM C:\BlaiseServices\Stackdriver
        - Stops and deletes the Stackdriver windows service if its running
        - Runs ps script stackdriver.ps1 - which in turns runs Stackdriver_Install_main.ps1
    
##     



    
    

