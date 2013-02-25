from time import mktime
from datetime import datetime
import datetime
import os
import time

f = open("list.txt", "w")
path = "c:\\source\\trunk\\sw\\swchannel\\customercenter\\intranet"
files = os.listdir(path)
initial = datetime.datetime(2013, 1, 14, 13, 30)
for file in files:
	structTime = time.localtime(os.path.getmtime(path+"\\"+file))
	if initial < datetime.datetime(*structTime[:6]):
		f.write(file+"\n")

f.close()