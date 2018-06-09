
library('XML')
library('dplyr')
library('readr')
library('plyr')
#library('xlsx')

xmlfile <- xmlParse('../../test2.xml')

source('REM_XTRACT.R')

nrSubjects <- 7

bla <- data.frame()

for (index in seq(1,nrSubjects,1)) {
   print(index)
   bla <- rbind(bla,REM_XTRACT(xmlfile,index))

}
  
write.table(bla,'7-subject-REM.txt',sep=',')









