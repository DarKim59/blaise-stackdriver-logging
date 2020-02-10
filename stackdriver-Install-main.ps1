"Start of Reinstall/Install"

$exefile = "C:\BlaiseServices\Stackdriver\LoggingAgent\uninstall.exe"
if (Test-Path $exefile)
{
    #run uninstall
    "Uninstalling stackdriver"
    & 'C:\BlaiseServices\Stackdriver\LoggingAgent\uninstall.exe' /S
    Start-Sleep -s 60
}

"Starting Download of Stackdriver exe"
cd C:\BlaiseServices\Stackdriver\
(New-Object Net.WebClient).DownloadFile("https://dl.google.com/cloudagents/windows/StackdriverLogging-v1-10.exe", "C:\BlaiseServices\Stackdriver\StackdriverLogging-v1-10.exe")
"Finished Download of Stackdriver exe"
"Running Stackdriver exe"
& 'C:\BlaiseServices\Stackdriver\StackdriverLogging-v1-10.exe' /S /D="C:\BlaiseServices\Stackdriver\LoggingAgent\"

"End of Reinstall/Install"
