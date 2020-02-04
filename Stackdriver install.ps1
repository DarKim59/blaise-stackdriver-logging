"Starting Download of Stackdriver exe"
cd $env:UserProfile;
(New-Object Net.WebClient).DownloadFile("https://dl.google.com/cloudagents/windows/StackdriverLogging-v1-10.exe", "C:\dev\StackdriverLogging-v1-10.exe")

"Download complete - Now running exe"

& 'C:\dev\StackdriverLogging-v1-10.exe' /S /D="C:\BlaiseServices\Stackdriver\Logging\" > C:\dev\stackdriver_output_log.txt

if($LASTEXITCODE -eq 0)
{
    Write-Host "The last PS command executed successfully"
} 
else 
{
    Write-Host "The last PS command failed"
}
