$ErrorActionPreference = "Stop"
$logFile = Join-Path $PSScriptRoot "keep-awake.log"

function Write-Log($msg) {
    $line = "[{0}] {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $msg
    $line | Tee-Object -FilePath $logFile -Append
}

try {
    Write-Log "Script starting..."

    Add-Type @"
using System;
using System.Runtime.InteropServices;
public class SleepUtil {
    [DllImport("kernel32.dll")]
    public static extern uint SetThreadExecutionState(uint esFlags);
}
"@

    [UInt32]$ES_CONTINUOUS       = [UInt32]::Parse("2147483648")
    [UInt32]$ES_SYSTEM_REQUIRED  = [UInt32]1
    [UInt32]$ES_DISPLAY_REQUIRED = [UInt32]2

    [UInt32]$flags = $ES_CONTINUOUS -bor $ES_SYSTEM_REQUIRED -bor $ES_DISPLAY_REQUIRED

    Write-Log "Keep-awake mode enabled. Flags=$flags"

    while ($true) {
        [void][SleepUtil]::SetThreadExecutionState($flags)
        Write-Log "Wake signal sent."
        Start-Sleep -Seconds 30
    }
}
catch {
    Write-Log "ERROR: $($_.Exception.Message)"
    Write-Host ""
    Write-Host "Script failed. Check keep-awake.log"
    Read-Host "Press Enter to close"
}
finally {
    try {
        if ([System.Management.Automation.PSTypeName]'SleepUtil'.Type) {
            [UInt32]$clearFlag = [UInt32]::Parse("2147483648")
            [void][SleepUtil]::SetThreadExecutionState($clearFlag)
            Write-Log "Keep-awake mode cleared."
        }
    } catch {}
}