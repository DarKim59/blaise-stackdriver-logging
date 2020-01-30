
param(
    [Parameter(Mandatory=$True, Position=0, ValueFromPipeline=$false)]
    [System.String]
    $ServiceName
)

function OutPutToServiceFailedFile($ServiceName)
{
    [string]$msg = "$((Get-Date).ToString()) -- Service: " + $ServiceName + " has an unexpected failure"
    Add-Content C:\BlaiseServices\TEL_BlaiseServices_Failure_temp.log $msg

    Copy-Item C:\BlaiseServices\TEL_BlaiseServices_Failure_temp.log C:\BlaiseServices\TEL_BlaiseServices_Failure.log
}

OutPutToServiceFailedFile($ServiceName)
