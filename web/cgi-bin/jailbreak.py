#!/usr/bin/python3
print("Content-Type: text/html")    
print()                             
 
import cgi,cgitb,subprocess,os
os.chdir("/home/pi/raspb0x")
cgitb.enable() #for debugging
print("Jailbreaking...")
form = cgi.FieldStorage()
if form.getvalue("verbose"):
	subprocess.run(["sudo", "./checkra1n","-V","--wui","127.0.0.1","8081"], stdout=subprocess.PIPE)
else:
	subprocess.run(["sudo", "./checkra1n","--wui","127.0.0.1","8081"], stdout=subprocess.PIPE)
print("<script>window.location='http://localhost:8081';</script>")

subprocess.run(["killall","chromium-browser"])
