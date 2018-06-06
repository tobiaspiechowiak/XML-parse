

library('XML')
library('dplyr')
library('readr')
library('plyr')


xmlfile <- xmlParse('../../170777-7777.xml')

#getting the root
xmltop <- xmlRoot(xmlfile)

#frequency range as in xml 
f <- seq(0,10000,43)
tmp <- list()

####Measured REM right side

#REUG
REUG <- xmltop[['Session']][[7]][['Data']][['RecordedData']][[2]] 
tmp$REUG_right <- 0 
for (i in 0:(length(f) - 2)){
  tmp$REUG_right <- c(tmp$REUG_right,as.numeric(xmlValue(REUG[[17 + i]][['Y']])))
}


#REOG@65 dB
REOG_65dB <- xmltop[['Session']][[8]][['Data']][['RecordedData']][[2]]
tmp$REOG_65_right <- 0 
for (i in 0:(length(f) - 2)){
  tmp$REOG_65_right <- c(tmp$REOG_65_right,as.numeric(xmlValue(REOG_65dB[[17 + i]][['Y']])))
}


#REAG@55 dB
REAG_55dB <- xmltop[['Session']][[10]][['Data']][['RecordedData']][[2]]
tmp$REAG_55_right <- 0 
for (i in 0:(length(f) - 2)){
  tmp$REAG_55_right <- c(tmp$REAG_55_right,as.numeric(xmlValue(REAG_55dB[[17 + i]][['Y']])))
}


#REAG@65 dB
REAG_65dB <- xmltop[['Session']][[11]][['Data']][['RecordedData']][[2]]
tmp$REAG_65_right <- 0 
for (i in 0:(length(f) - 2)){
  tmp$REAG_65_right <- c(tmp$REAG_65_right,as.numeric(xmlValue(REAG_65dB[[17 + i]][['Y']])))
}


#REAG@80 dB
REAG_80dB <- xmltop[['Session']][[12]][['Data']][['RecordedData']][[2]]
tmp$REAG_80_right <- 0 
for (i in 0:(length(f) - 2)){
  tmp$REAG_80_right <- c(tmp$REAG_80_right,as.numeric(xmlValue(REAG_80dB[[17 + i]][['Y']])))
}




#######Measured REM left side
#REUG
REUG <- xmltop[['Session']][[7]][['Data']][['RecordedData']][[3]] 
tmp$REUG_left <- 0 
for (i in 0:(length(f) - 2)){
  tmp$REUG_left <- c(tmp$REUG_left,as.numeric(xmlValue(REUG[[17 + i]][['Y']])))
}


#REOG@65 dB
REOG_65dB <- xmltop[['Session']][[8]][['Data']][['RecordedData']][[3]]
tmp$REOG_65_left <- 0 
for (i in 0:(length(f) - 2)){
  tmp$REOG_65_left <- c(tmp$REOG_65_left,as.numeric(xmlValue(REOG_65dB[[17 + i]][['Y']])))
}


#REAG@55 dB
REAG_55dB <- xmltop[['Session']][[10]][['Data']][['RecordedData']][[3]]
tmp$REAG_55_left <- 0 
for (i in 0:(length(f) - 2)){
  tmp$REAG_55_left <- c(tmp$REAG_55_left,as.numeric(xmlValue(REAG_55dB[[17 + i]][['Y']])))
}


#REAG@65 dB
REAG_65dB <- xmltop[['Session']][[11]][['Data']][['RecordedData']][[3]]
tmp$REAG_65_left <- 0 
for (i in 0:(length(f) - 2)){
  tmp$REAG_65_left <- c(tmp$REAG_65_left,as.numeric(xmlValue(REAG_65dB[[17 + i]][['Y']])))
}


#REAG@80 dB
REAG_80dB <- xmltop[['Session']][[12]][['Data']][['RecordedData']][[3]]
tmp$REAG_80_left <- 0 
for (i in 0:(length(f) - 2)){
  tmp$REAG_80_left <- c(tmp$REAG_80_left,as.numeric(xmlValue(REAG_80dB[[17 + i]][['Y']])))
}

#bind left and right side
REM <- as.data.frame(tmp)
REM <- cbind(f,REM)

write.table(REM,file='REM_data_1_person.txt',sep='\t') 




