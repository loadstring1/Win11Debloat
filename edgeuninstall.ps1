Write-Output "Edge uninstaller v1.1 - made by loadstring1"

#give it a chance to uninstall itself before doing it forcefully

$ProgramFiles86=${env:ProgramFiles(x86)}

if ((Get-AppxPackage -Name "*Microsoft.DesktopAppInstaller*") -and (Test-Path -Path "$ProgramFiles86\Microsoft\Edge") -and ((winget -v) -replace 'v','' -gt 1.4)) {
    $edgeNamesGet=@("Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe","Microsoft.Edge","Microsoft Edge Update")

    foreach ($edge in $edgeNamesGet) {
        try {
            winget uninstall $edge
            Write-Output "uninstalled edge with winget ($edge)"
        }catch{
            Write-Output "failed to uninstall edge with winget ($edge)"
        }
    }

    Write-Output "Attempted to uninstall microsoft edge with winget"
}else{
    Write-Output "Microsoft edge was not found in winget."
}

Stop-Process -Name "*edge*" -Force
Write-Output "Attempted to kill all microsoft edge processes"

# remove ms edge from autostart
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "MicrosoftEdgeAutoLaunch_A9F6DCE4ABADF4F51CF45CD7129E3C6C" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "Microsoft Edge Update" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "MicrosoftEdgeAutoLaunch_A9F6DCE4ABADF4F51CF45CD7129E3C6C" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Microsoft Edge Update" /f

#remove ms edge from control panel and settings
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update" /f


Write-Output "Attempted to remove microsoft edge from registry"

#remove leftover services
sc.exe delete "edgeupdate"
sc.exe delete "edgeupdatem"
sc.exe delete "MicrosoftEdgeElevationService"

Write-Output "Attempted to remove microsoft edge from services"

#remove leftover tasks
Unregister-ScheduledTask -TaskName "*MicrosoftEdgeUpdateBrowserReplacementTask*" -Confirm:$false
Unregister-ScheduledTask -TaskName "*MicrosoftEdgeUpdateTaskMachineCore*" -Confirm:$false
Unregister-ScheduledTask -TaskName "*MicrosoftEdgeUpdateTaskMachineUA*" -Confirm:$false

Write-Output "Attempted to remove microsoft edge from task scheduler"

$edgePaths=@(
    "$ProgramFiles86\Microsoft\Edge",
    "$ProgramFiles86\Microsoft\EdgeCore",
    "$ProgramFiles86\Microsoft\EdgeUpdate",
    "$ProgramFiles86\Microsoft\Temp",
    "$env:LOCALAPPDATA\Microsoft\Edge"
    "$env:LOCALAPPDATA\Microsoft\EdgeCore",
    "$env:LOCALAPPDATA\Microsoft\EdgeUpdate",
    "$env:ProgramData\Microsoft\EdgeUpdate",
    "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk",
    "$env:APPDATA\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge.lnk",
    "$env:APPDATA\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk",
    "$env:PUBLIC\Desktop\Microsoft Edge.lnk",
    "$env:USERPROFILE\Desktop\Microsoft Edge.lnk"
)
foreach ($path in $edgePaths){
    if (Test-Path -Path $path) {
        Remove-Item -Force -Recurse $path
        Write-Output "Removed $path"
    }else{
        Write-Output "$path doesn't exist. No action was taken."
    }
}

Write-Output "Microsoft edge should be removed from your system."
Write-Output "Please keep in mind microsoft edge webview has not been uninstalled. You can uninstall that in settings or control panel."