Write-Output "Edge uninstaller v1.1 - made by loadstring1"


#give it a chance to uninstall itself before doing it forcefully

if ((Get-AppxPackage -Name "*Microsoft.DesktopAppInstaller*") -and ((winget -v) -replace 'v','' -gt 1.4)) {
    $edgeNamesGet=@("Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe","Microsoft.MicrosoftEdge_8wekyb3d8bbwe","Microsoft.Edge","Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe","Microsoft Edge Update")

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
    Write-Output "Looks like you don't have winget installed or your winget version is outdated. Attempting to remove microsoft edge without winget forcefully."
}

Stop-Process -Name "*edge*" -Force
Write-Output "Attempted to kill all microsoft edge processes"

# I don't know how these hashes work. I assume those update once microsoft edge updates that will be tons of pain keeping this edge remove function up to date - loadstring1

# my god microsoft edge leaves so much mess in the registry... - loadstring1

# remove ms edge from autostart
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "MicrosoftEdgeAutoLaunch_A9F6DCE4ABADF4F51CF45CD7129E3C6C" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "Microsoft Edge Update" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "MicrosoftEdgeAutoLaunch_A9F6DCE4ABADF4F51CF45CD7129E3C6C" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Microsoft Edge Update" /f

#remove ms edge from control panel and settings
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update" /f

# remove ms edge leftovers in registry
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{9459C573-B17A-45AE-9F64-1857B5D58CEE}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Clients\StartMenuInternet\Microsoft Edge" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Internet Explorer\Low Rights\ElevationPolicy\{c9abcf16-8dc2-4a95-bae3-24fd98f2ed29}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PolicyCache\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PolicyCache\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PolicyCache\Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\WOW6432Node\CLSID\{FEAC932B-D6B2-40BF-B7C5-F35FAB41FCCA}\InprocHandler32" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Edge" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\EdgeUpdate" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\EdgeUpdateDev" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AppHost\IndexedDB\Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AppHost\IndexedDB\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "AppX7rm9drdg8sk7vqndwj3sdjw11x96jc0y_microsoft-edge" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "AppX3xxs313wwkfjhythsb8q46xdsq8d2cvv_microsoft-edge-holographic" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeMHT_.mht" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeMHT_.mhtml" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeHTM_.svg" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeHTM_.webp" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeHTM_.xht" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeHTM_.xhtml" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeHTM_.xml" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeHTM_ftp" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeHTM_http" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeHTM_https" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeHTM_.htm" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeHTM_.html" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeHTM_read" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeHTM_microsoft-edge" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeHTM_microsoft-edge-holographic" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeHTM_ms-xbl-3d8b930f" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgePDF_.pdf" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "MSEdgeHTM_mailto" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe" /f 
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location\NonPackaged\C:#Program Files (x86)#Microsoft#Edge#Application#msedge.exe" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppLaunch" /v "MSEdge" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched" /v "{7C5A40EF-A0FB-4BFC-874A-C0F2E0B9FA8E}\\Microsoft\\EdgeUpdate\\MicrosoftEdgeUpdate.exe" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched" /v "MSEdge" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "EdgeMUID" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PushNotifications\Backup\Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe!App" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PushNotifications\Backup\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe!App" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PushNotifications\Backup\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PushNotifications\Backup\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!PdfReader" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunNotification" /v "StartupTNotiMicrosoft Edge Update" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search\JumplistData" /v "MSEdge" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\HostActivityManager\CommitHistory\Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe!App" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\HostActivityManager\CommitHistory\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge" /f
reg delete "HKEY_CURRENT_USER\Software\Wow6432Node\Microsoft\EdgeUpdateDev" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{1108FD1C-492F-4251-B9DB-77F0274267B2}\InProcServer32" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{209222BB-556D-4EAF-9C53-4ACB9E51731C}\InprocHandler32" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{5EA43877-C6D8-4885-B77A-C0BB27E94372}\InprocServer32" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{6DD6748E-7DAE-47EF-B4D5-03AA1B06D697}\InProcServer32" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{81093D63-7825-417B-BFC8-ADC63FA4E53D}\InprocServer32" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{A8E2FC12-D508-44CC-AC5E-883746A1CA4C}\InprocHandler32" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{B29F5F83-90DF-479A-BDE7-8A9F4412E394}\InProcServer32" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{FEAC932B-D6B2-40BF-B7C5-F35FAB41FCCA}\InprocHandler32" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Local Settings\MrtCache\C:%5CWindows%5CSystemApps%5CMicrosoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe%5Cresources.pri" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Local Settings\MrtCache\C:%5CWindows%5CSystemApps%5CMicrosoft.MicrosoftEdge_8wekyb3d8bbwe%5Cresources.pri" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge.stable_8wekyb3d8bbwe" /f

#and there is way more than this i could do this all day but i think its enough i don't want to make this simple script 1k lines of code


Write-Output "Attempted to remove microsoft edge from registry"

#remove leftover services
sc.exe delete "edgeupdate"
sc.exe delete "edgeupdatem"
sc.exe delete "MicrosoftEdgeElevationService"

Write-Output "Attempted to remove microsoft edge from services"

#remove leftover tasks
Unregister-ScheduledTask -TaskName MicrosoftEdgeUpdateBrowserReplacementTask -Confirm:$false
Unregister-ScheduledTask -TaskName MicrosoftEdgeUpdateTaskMachineCore -Confirm:$false
Unregister-ScheduledTask -TaskName MicrosoftEdgeUpdateTaskMachineUA -Confirm:$false

Write-Output "Attempted to remove microsoft edge from task scheduler"

$ProgramFiles86=${env:ProgramFiles(x86)}

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
    "$env:PUBLIC\Desktop\Microsoft Edge.lnk"
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