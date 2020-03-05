#!/usr/bin/python3
print("Content-Type: text/html")    
print()                             
 
import cgi,cgitb,subprocess,os
os.chdir("/home/pi/raspb0x")
cgitb.enable() #for debugging
print("Jailbreaking...")
cdDone = subprocess.run(["cd", "/home/pi/raspb0x"], stdout=subprocess.DEVNULL)
if (cdDone != 0):
	print("Something failed, most likely broken install...")
	print("<script>window.location='/index.html';")
form = cgi.FieldStorage()
if form.getvalue("verbose"):
	doneJB = subprocess.run(["sudo", "./checkra1n","-V"], stdout=subprocess.PIPE)
else:
	doneJB = subprocess.run(["sudo", "./checkra1n"], stdout=subprocess.PIPE)
for c in iter(lambda: process.stdout.read(15), b''):  # replace '' with b'' for Python 3
        print(c)
for x in range(15):
	print("\033[F")
if (doneJB != 0):
	print("JB failed! Error code: %s" % str(doneJB))
	print("<script>window.location='/index.html';</script>")
else:
	print("JB Success!")
	print("<script>window.location='/index.html';</script>")
