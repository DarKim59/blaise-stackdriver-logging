
param(
    [Parameter(Mandatory=$True, Position=0, ValueFromPipeline=$false)]
    [System.String]
    $ServiceName
)

function OutPutToServiceFailedFile($ServiceName)
{
    [string]$msg = "$((Get-Date).ToString()) -- Service: " + $ServiceName + " has an unexpected failure"
    Add-Content C:\BlaiseServices\BlaiseServices_Failure_temp.log $msg

    Copy-Item C:\BlaiseServices\BlaiseServices_Failure_temp.log C:\BlaiseServices\BlaiseServices_Failure.log
}

OutPutToServiceFailedFile($ServiceName)
