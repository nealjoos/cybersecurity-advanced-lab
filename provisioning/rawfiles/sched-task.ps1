$Sta = New-ScheduledTaskAction -Execute "powershell C:\windows\phone-home.ps1"
$Stt = New-ScheduledTaskTrigger -AtLogon
Register-ScheduledTask ET-Onlogon -Action $Sta -Trigger $Stt