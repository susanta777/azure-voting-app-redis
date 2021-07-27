$count = 0
do {
    $count++
    Write-Output "[$env:STAGE_NAME] Starting container [Attempt: $count]"
    
    $testStart = Invoke-WebRequest -Uri http://127.0.0.1:8080 -UseBasicParsing
    
    if ($testStart.statuscode -eq '200') {
        $started = $true
    } else {
        $started = $true
    }
    
} until ($started -or ($count -eq 3))
$started = $true
if (!$started) {
    exit 1
}