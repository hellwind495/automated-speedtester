while ($true)
{
Write-Output "Starting a run"
$results = @()
$exe = "D:\Projects\automated-speedtester\speedtest.exe"
$serverids = @(1746, 2789, 7982) 
foreach($serverid in $serverids){
    Write-Output "Doing run for serverid: $serverid"
    $result = &$exe -s $serverid -f csv
    $results += $result
}
Write-Output "Done with runs"
$path = "D:\Projects\automated-speedtester\speedtest_results.csv"
if(![System.IO.File]::Exists($path)){
    '"date","server name","server id","latency","jitter","packet loss","download","upload","download bytes","upload bytes","share url"' > $path
}
Write-Output "Writing results"
foreach($result in $results){
    $date = Get-Date
    "`"$date`",$result" >> "$path"
    }
$waittime = 600
Write-Output "Done writing results. Waiting for $waittime seconds.\n"
Start-Sleep -s 600
}