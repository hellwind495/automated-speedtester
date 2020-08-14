while ($true)
{
Write-Output "Starting a run"
$results = @()
$exe = "D:\Projects\speed tests\ookla-speedtest-1.0.0-win64\speedtest.exe"
$serverids = @(1746, 2789, 7982) 
foreach($serverid in $serverids){
    Write-Output "Doing run for serverid: $serverid"
    $result = &$exe -s $serverid -f csv
    $results += $result
}
foreach($result in $result){
    $date = Get-Date
    "`"$date`",$result" >> "D:\Projects\speed tests\ookla-speedtest-1.0.0-win64\speedtest_results.csv"
    }
Start-Sleep -s 600
}