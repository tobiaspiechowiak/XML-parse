

library('XML')
library('dplyr')
library('readr')
library('plyr')

xmlfile <- xmlParse('170777-7777.xml')

#getting the root
xmltop <- xmlRoot(xmlfile)

#frequency range as in xml 
f <- seq(0,10000,43)

#REUG
REUG <- xmltop[['Session']][[7]][['Data']][['RecordedData']][['Measured']]

for (i in length(f) ){
  REUG.value[i] <- xmlValue(REUG[['XYData']][['Y']])
  
}


#REAG
REAG_65dB <- xmltop[['Session']][[7]][['Data']][['RecordedData']][['Measured']]

