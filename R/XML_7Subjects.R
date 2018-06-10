
Sys.setenv(JAVA_HOME='c:/Program Files/Java/jre-9.0.1') # for 64-bit version

library('XML')
library('dplyr')
library('readr')
library('plyr')
library('xlsx')


xmlfile <- xmlParse('../../test2.xml')

source('REM_XTRACT_v2.R')

nrSubjects <- 7

bla <- data.frame()

for (index in seq(1,nrSubjects,1)) {
   print(index)
   bla <- rbind(bla,REM_XTRACT_v2(xmlfile,index))

}
  
write.xlsx(bla,'7-subject-REM.xlsx')









