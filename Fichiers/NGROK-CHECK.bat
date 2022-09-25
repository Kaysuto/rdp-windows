@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Azure VM" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user runneradmin P@ssw0rd! /add >nul
net localgroup administrators runneradmin /add >nul
echo C'est fait ! Connectez votre VM en utilisant RDP. Lorsque le RDP a expiré et que la VM s'est arrêtée, relancez les tâches pour obtenir un nouveau RDP.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Impossible d'obtenir le tunnel NGROK, assurez-vous que NGROK_AUTH_TOKEN est correct dans Settings > Secrets > Repository secret. Peut-être que votre VM précédente fonctionne toujours : https://dashboard.ngrok.com/status/tunnels " 

echo User: runneradmin
echo Pass: P@ssw0rd!
curl -O https://raw.githubusercontent.com/Kaysuto/rdp-windows/main/Fichiers/DisablePasswordComplexity.ps1 > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Fast Config VPS.exe" https://raw.githubusercontent.com/Kaysuto/rdp-windows/main/Fichiers/FastConfigVPS_v5.1.exe > out.txt 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DisablePasswordComplexity.ps1'" > out.txt 2>&1
diskperf -Y >nul
sc start audiosrv >nul
sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant runneradmin:F >nul
ICACLS C:\Windows\installer /grant runneradmin:F >nul
ping -n 10 127.0.0.1 >nul

