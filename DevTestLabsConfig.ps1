# Restrict access to specified URLs by modifying the hosts file
$hostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"

# List of URLs to block
$blockedUrls = @(
    "yahoo.com", 
    "www.yahoo.com"
)

foreach ($url in $blockedUrls) {
    $entry = "127.0.0.1 $url"
    if (-not (Select-String -Path $hostsPath -Pattern $url)) {
        Add-Content -Path $hostsPath -Value $entry
    }
}

# Download the Terms.html file from the GitHub repository
$termsUrl = "https://raw.githubusercontent.com/HosseinZahed/dev-test-labs-demo/main/Terms.html"
Invoke-WebRequest -Uri $termsUrl -OutFile "C:\terms.html"

# Create a scheduled task to open terms.html on user logon
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "Start-Process '$termsUrl'"
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserId "BUILTIN\Users" -LogonType Interactive
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

Register-ScheduledTask -TaskName "OpenTermsOnLogon" -Action $action -Trigger $trigger -Principal $principal -Settings $settings
