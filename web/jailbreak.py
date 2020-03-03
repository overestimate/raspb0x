#!/usr/local/bin/python3.2
print("Content-Type: text/html")    
print()                             
 
import cgi,cgitb
cgitb.enable() #for debugging
print("Jailbreaking...")
cdDone = subprocess.run(["cd", "/home/pi/raspb0x"], stdout=subprocess.DEVNULL)
if (cdDone != 0):
	print("Something failed, most likely broken install...")
	print("<script>window.location='/index.html';")
doneJB = subprocess.run(["sudo", "./checkra1n"], stdout=subprocess.DEVNULL)
if (doneJB != 0):
	print("JB failed! Error code: %s" % str(doneJB))
	print("<script>window.location='/index.html';")
else:
	print("JB Success!")
	print("<script>window.location='/index.html';")