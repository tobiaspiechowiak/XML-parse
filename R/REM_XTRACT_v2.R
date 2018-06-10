
REM_XTRACT_v2 <- function(xmlfile,nr) {
  
  #getting the root
  top <- xmlRoot(xmlfile)
  
  
  #creating list 
  tmp <- list()
  
  
  
  #count the nodes in actions 
  childNodeActions <- top[[nr]][['Patient']][['Actions']]
  size.Node.Actions <- xmlSize(childNodeActions)
 
  ######################################################################### for left ear######################################################################
  #find the REM nodes
  n <- NULL
  for (i in seq(1,size.Node.Actions-1,1)){
    if (xmlValue(childNodeActions[[i]][['Description']]) == 'REM440 data left ear'){
      n <- c(n,i)
    }
  }
  
  
  ### if no REM return empty list
  if(!is.null(n)){
    
  
  #extract REUG (last date)
  size <- xmlSize(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarUnaidedResponse']])
  tmp$REUG_left <- 0
  tmp$f <- 0
  for (l in seq(1,size-1,1)){
      tmp$REUG_left <- c(tmp$REUG_left,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarUnaidedResponse']][[l + 1]][['Output']])))
      tmp$f <- c(tmp$f,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarUnaidedResponse']][[l + 1]][['Frequency']])))
      
    }
  
  
  #extract REOG (last date)
  size <- xmlSize(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarOccludedResponse']])
  tmp$REOG_left <- 0
  tmp$f <- 0
  for (l in seq(1,size-1,1)){
    tmp$REOG_left <- c(tmp$REOG_left,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarOccludedResponse']][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarOccludedResponse']][[l + 1]][['Frequency']])))
    
  }
  
  #extract REAG@55 dB (last date)
  size <- xmlSize(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarAidedResponse']])
  tmp$REAG_left_55 <- 0
  tmp$f <- 0
  for (l in seq(1,size-1,1)){
    tmp$REAG_left_55 <- c(tmp$REAG_left_55,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[3]][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[3]][[l + 1]][['Frequency']])))
    
  }
  
  #extract REAG@65 dB (last date)
  size <- xmlSize(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarAidedResponse']])
  tmp$REAG_left_65 <- 0
  tmp$f <- 0
  for (l in seq(1,size-1,1)){
    tmp$REAG_left_65 <- c(tmp$REAG_left_65,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[4]][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[4]][[l + 1]][['Frequency']])))
    
  }
  
  #extract REAG@80 dB (last date)
  size <- xmlSize(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarAidedResponse']])
  tmp$REAG_left_80 <- 0
  tmp$f <- 0
  for (l in seq(1,size-1,1)){
    tmp$REAG_left_80 <- c(tmp$REAG_left_80,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[5]][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[5]][[l + 1]][['Frequency']])))
    
  }
  
  tmp$date_left <- xmlValue(childNodeActions[[max(n)]][['ActionDate']])
  
  } #is.null(n)
  
  ######################################################################### for right ear######################################################################
  
  
  #find the REM nodes
  n <- NULL
  for (i in seq(1,size.Node.Actions-1,1)){
    if (xmlValue(childNodeActions[[i]][['Description']]) == 'REM440 data right ear'){
      n <- c(n,i)
    }
  }

  ### if no REM return empty list
  if(!is.null(n)){
    
    
  #extract REUG (last date)
  size <- xmlSize(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarUnaidedResponse']])
  tmp$REUG_right <- 0
  tmp$f <- 0
  for (l in seq(1,size-1,1)){
    tmp$REUG_right <- c(tmp$REUG_right,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarUnaidedResponse']][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarUnaidedResponse']][[l + 1]][['Frequency']])))
    
  }
  
  
  #extract REOG (last date)
  size <- xmlSize(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarOccludedResponse']])
  tmp$REOG_right <- 0
  tmp$f <- 0
  for (l in seq(1,size-1,1)){
    tmp$REOG_right <- c(tmp$REOG_right,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarOccludedResponse']][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarOccludedResponse']][[l + 1]][['Frequency']])))
    
  }
  
  #extract REAG@55 dB (last date)
  size <- xmlSize(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarAidedResponse']])
  tmp$REAG_right_55 <- 0
  tmp$f <- 0
  for (l in seq(1,size-1,1)){
    tmp$REAG_right_55 <- c(tmp$REAG_right_55,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[3]][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[3]][[l + 1]][['Frequency']])))
    
  }
  
  #extract REAG@65 dB (last date)
  size <- xmlSize(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarAidedResponse']])
  tmp$REAG_right_65 <- 0
  tmp$f <- 0
  for (l in seq(1,size-1,1)){
    tmp$REAG_right_65 <- c(tmp$REAG_right_65,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[4]][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[4]][[l + 1]][['Frequency']])))
    
  }
  
  #extract REAG@80 dB (last date)
  size <- xmlSize(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][['RealEarAidedResponse']])
  tmp$REAG_right_80 <- 0
  tmp$f <- 0
  for (l in seq(1,size-1,1)){
    tmp$REAG_right_80 <- c(tmp$REAG_right_80,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[5]][[l + 1]][['Output']])))
    tmp$f <- c(tmp$f,as.numeric(xmlValue(childNodeActions[[max(n)]][['PublicData']][['HIMSARemStandard']][['RealEarData']][[5]][[l + 1]][['Frequency']])))
    
  }
  
  
  tmp$date_right <- xmlValue(childNodeActions[[max(n)]][['ActionDate']])
  
  
}# end is.null(n)
  
  
    ######return data frame and make it pretty 
    REM <- as.data.frame(tmp)
    
    if(length(tmp) != 0){
    REM <- cbind(REM['f'],REM[-2])
    
    REM$NoahId <- rep(xmlValue(top[[nr]][['Patient']][['NOAHPatientId']]))
    
    REM <- na.omit(REM)
    }
    
  
  
  return(REM)
  
    
}

