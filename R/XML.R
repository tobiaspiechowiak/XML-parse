

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

for (i in 0:(length(f) - 2)){
  tmp[i] <- as.numeric(xmlValue(REUG[[17 + i]][['Y']]))
}


#REAG
REAG_65dB <- xmltop[['Session']][[7]][['Data']][['RecordedData']][['Measured']]

#xmlValue(xml[[1]][[1]][[2]][[7]][[3]][[1]][[2]][[19]][[2]])
