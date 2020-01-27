cd $env:UserProfile;
(New-Object Net.WebClient).DownloadFile("https://dl.google.com/cloudagents/windows/StackdriverLogging-v1-10.exe", "C:\dev\StackdriverLogging-v1-10.exe")
. C:\dev\StackdriverLogging-v1-10.exe /S
