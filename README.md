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


