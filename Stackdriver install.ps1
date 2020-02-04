"Starting Download of Stackdriver exe"
#cd $env:UserProfile;
cd C:\BlaiseServices\Stackdriver\
(New-Object Net.WebClient).DownloadFile("https://dl.google.com/cloudagents/windows/StackdriverLogging-v1-10.exe", "C:\BlaiseServices\Stackdriver\StackdriverLogging-v1-10.exe")
& 'C:\BlaiseServices\Stackdriver\StackdriverLogging-v1-10.exe' /S /D="C:\BlaiseServices\Stackdriver\LoggingAgent\"
