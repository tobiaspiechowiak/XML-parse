
REM_XTRACT_v2 <- function(xmlfile,nr) {
  
  #getting the root
  top <- xmlRoot(xmlfile)
  
  
  #creating list 
  tmp <- list()
  cutF <- 7310
  
  
  
  #count the nodes in actions 
  childNodeActions <- top[[nr]][['Patient']][['Actions']]
  size <- xmlSize(childNodeActions)
  
  ###################################################################### for left ear######################################################################
  #find the REM node
  n <- NULL
  for (i in seq(1,size-1,1)){
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
  
  
  
}
  
}