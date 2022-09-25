
@echo off
tasklist | find /i "ngrok.exe" >Nul && goto check || echo "Le service Ngrok ne fonctionne pas. Un compte Ngrok gratuit/ 1 tunnel, Si vous voulez exécuter plus de VM, mettez à jour le nouveau NGROK_AUTH_TOKEN dans Settings > Secrets > Repository secrets puis relancez le workflow. Votre workflow actuel se termine bientôt. Si vous avez encore des questions, contactez-moi : Kaysuto#0012 " & ping 127.0.0.1 >Nul & ping 127.0.0.1 >Nul & exit
:check
ping 127.0.0.1 > nul
cls
goto check
