﻿cd $env:UserProfile;
(New-Object Net.WebClient).DownloadFile("https://dl.google.com/cloudagents/windows/StackdriverLogging-v1-10.exe", "C:\dev\StackdriverLogging-v1-10.exe")
. C:\dev\StackdriverLogging-v1-10.exe /S
if($LASTEXITCODE -eq 0)
{
    Write-Host "The last PS command executed successfully"
} 
else 
{
    Write-Host "The last PS command failed"
}
