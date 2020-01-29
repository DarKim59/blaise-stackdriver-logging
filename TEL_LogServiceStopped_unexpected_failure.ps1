
param(
    [Parameter(Mandatory=$True, Position=0, ValueFromPipeline=$false)]
    [System.String]
    $ServiceName
)

function OutPutToServiceFailedFile($ServiceName)
{
    [string]$msg = "$((Get-Date).ToString()) -- Service: " + $ServiceName + " has an unexpected failure"
     Add-Content C:\BlaiseServices\TEL_BlaiseServices_Failure.log $msg
}

OutPutToServiceFailedFile($ServiceName)
