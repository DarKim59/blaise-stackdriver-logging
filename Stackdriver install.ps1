"Starting Download of Stackdriver exe"
#cd $env:UserProfile;
cd C:\BlaiseServices\Stackdriver\
(New-Object Net.WebClient).DownloadFile("https://dl.google.com/cloudagents/windows/StackdriverLogging-v1-10.exe", "C:\BlaiseServices\Stackdriver\StackdriverLogging-v1-10.exe")
& 'C:\BlaiseServices\Stackdriver\StackdriverLogging-v1-10.exe' /S /D="C:\BlaiseServices\Stackdriver\LoggingAgent\"

function WaitUntilServices($searchString, $status)
{
    # Get all services where DisplayName matches $searchString and loop through each of them.
    foreach($service in (Get-Service -DisplayName $searchString))
    {
        # Wait for the service to reach the $status or a maximum of 30 seconds
        $service.WaitForStatus($status, '00:01:30')
    }
}

WaitUntilServices "Stackdriver Logging" "Running"
