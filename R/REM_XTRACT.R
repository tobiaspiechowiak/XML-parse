
REM_XTRACT <- function(xmlfile,nr) {
  
  #getting the root
  xmltop <- xmlRoot(xmlfile)
  
  
  #creating list 
  tmp <- list()
  cutF <- 7310
  
  
  #find the REM node for left ear
  i <- 1
  tryCatch(
    while (xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['Description']]) != 'REM440 data left ear'){
       i <- i + 1
  }, error = function(e) return(NULL))
  

  #extract REUG
  tmp$REUG_left <- 0
  tmp$f <- 0
  fr <- tmp$f
  l <- 1
  tryCatch(
  while (fr < cutF) {
    tmp$REUG_left <- c(tmp$REUG_left,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarUnaidedResponse']][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarUnaidedResponse']][[l + 1]][['Frequency']])))
    fr <- tmp$f[l]
    l = l + 1
  }, error = function(e) return(NULL))
  
  
  #extract REOG @ 65 dB
  tmp$REOG_left <- 0
  tmp$f <- 0
  fr <- tmp$f
  l <- 1
  tryCatch(
  while (fr < cutF) {
    tmp$REOG_left <- c(tmp$REOG_left,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarOccludedResponse']][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarOccludedResponse']][[l + 1]][['Frequency']])))
    fr <- tmp$f[l]
    l = l + 1
  }, error = function(e) return(NULL))
  
  
  #extract REAG @ 55 dB SPL
  tmp$REAG_55_left <- 0
  tmp$f <- 0
  fr <- tmp$f
  l <- 1
  tryCatch(
  while (fr < cutF) {
    tmp$REAG_55_left <- c(tmp$REAG_55_left,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[3]][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[3]][[l + 1]][['Frequency']])))
    fr <- tmp$f[l]
    l = l + 1
  }, error = function(e) return(NULL))
  
  
  #extract REAG @ 65 dB SPL
  tmp$REAG_65_left <- 0
  tmp$f <- 0
  fr <- tmp$f
  l <- 1
  tryCatch(
  while (fr < cutF) {
    tmp$REAG_65_left <- c(tmp$REAG_65_left,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[4]][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[3]][[l + 1]][['Frequency']])))
    fr <- tmp$f[l]
    l = l + 1
  }, error = function(e) return(NULL))
  
  
  
  #################find the REM node for right ear
  i <- 1
  tryCatch(
  while (xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['Description']]) != 'REM440 data right ear'){
    i <- i + 1
  }, error = function(e) return(NULL))
  
  
  #extract REUG
  tmp$REUG_right <- 0
  tmp$f <- 0
  fr <- tmp$f
  l <- 1
  tryCatch(
  while (fr < cutF) {
    tmp$REUG_right <- c(tmp$REUG_right,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarUnaidedResponse']][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarUnaidedResponse']][[l + 1]][['Frequency']])))
    fr <- tmp$f[l]
    l = l + 1
  }, error = function(e) return(NULL))
  
  #extract REOG @ 65 dB
  tmp$REOG_right <- 0
  tmp$f <- 0
  fr <- tmp$f
  l <- 1
  tryCatch(
  while (fr < cutF) {
    tmp$REOG_right <- c(tmp$REOG_right,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarOccludedResponse']][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarOccludedResponse']][[l + 1]][['Frequency']])))
    fr <- tmp$f[l]
    l = l + 1
  }, error = function(e) return(NULL))
  
  
  #extract REAG @ 55 dB SPL
  tmp$REAG_55_right <- 0
  tmp$f <- 0
  fr <- tmp$f
  l <- 1
  tryCatch(
  while (fr < cutF) {
    tmp$REAG_55_right <- c(tmp$REAG_55_right,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[3]][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[3]][[l + 1]][['Frequency']])))
    fr <- tmp$f[l]
    l = l + 1
  }, error = function(e) return(NULL))
  
  
  #extract REAG @ 65 dB SPL
  tmp$REAG_65_right <- 0
  tmp$f <- 0
  fr <- tmp$f
  l <- 1
  tryCatch(
  while (fr < cutF) {
    tmp$REAG_65_right <- c(tmp$REAG_65_right,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[4]][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(xmltop[[nr]][['Patient']][['Actions']][[i]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[3]][[l + 1]][['Frequency']])))
    fr <- tmp$f[l]
    l = l + 1
  }, error = function(e) return(NULL))
  
  REM <- as.data.frame(tmp)
  REM <- cbind(REM['f'],REM[-2])
  
  REM$Subject <- rep(nr)
  
  REM <- na.omit(REM)
  
  
  return(REM)
  
}