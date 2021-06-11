
import re
import jsbeautifier
import requests
import os

def getem():
	url = str(input("What URL whould you like to scrape?"))
	filo = str(input("What is the name of the file you would like this put into?"))
	r = requests.get(url)
	code = r.text
	with open(filo, 'w') as o:
		o.write(code)
		
	
	def prettyjs():
		js_file=""
		read_file = str(input("What file would you like me to read from?"))
		with open (read_file, "r") as f:
			js_file = f.read()
			translate = jsbeautifier.beautify(js_file)
			with open('pretti.js', 'w') as g:
				g.write(translate)
	prettyjs()
getem()
