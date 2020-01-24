#!/bin/bash

#--------------------
# needs root access
#--------------------



# sed chars
p1='s/'
p2='/g'
r='/'
l='main'
file='/etc/apt/sources.list'
c=${p1}${l}&{r}$"main contrib non-free"${p2}
sed -i ${c} $file
echo "done"	


	
