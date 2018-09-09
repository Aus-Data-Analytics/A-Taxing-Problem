# original vs adjusted counts


fileName <- "POA_to_SA2_with_counts"
dfo <- read.table(paste0(fileName,".txt"),
                  sep=",", 
                  header=TRUE, 
                  quote = "", 
                  row.names = NULL, 
                  stringsAsFactors = FALSE)
View(dfo)

fileName <- "POA_to_SA2_with_adjusted_counts"
dfa <- read.table(paste0(fileName,".txt"),
                  sep=",", 
                  header=TRUE, 
                  quote = "", 
                  row.names = NULL, 
                  stringsAsFactors = FALSE)
View(dfa)



dfMerged <- merge(x=dfo, y=dfa, by = c("POA_CODE_2016","POA_NAME_2016","SA2_MAINCODE_2016","SA2_NAME_2016","RATIO","PERCENTAGE"), all.x = TRUE, all.y = TRUE)

colnames(dfMerged) <- c("POA_CODE_2016","POA_NAME_2016","SA2_MAINCODE_2016","SA2_NAME_2016","RATIO","PERCENTAGE","originalCentreCount", "adjCentreCount")

dfMerged$diff <- with(dfMerged, adjCentreCount - originalCentreCount)
View(dfMerged)

sum(dfMerged$originalCentreCount)
sum(dfMerged$adjCentreCount)

dfMerged$val <- 1

dfAgg <- aggregate(dfMerged[c("val")], 
                   by = list(dfMerged$diff), 
                   FUN = sum)

View(dfAgg)

dfMerged$state <- 'x'
i = 1
for(i in 1:length(dfMerged$state)){
  if(dfMerged$POA_CODE_2016[i] >= 2000 & dfMerged$POA_CODE_2016[i] < 3000){
    dfMerged$state[i] <- "NSW/ACT"
  }
  else if(dfMerged$POA_CODE_2016[i] >= 3000 & dfMerged$POA_CODE_2016[i] < 4000){
    dfMerged$state[i] <- "VIC"
  }
  else if(dfMerged$POA_CODE_2016[i] >= 4000 & dfMerged$POA_CODE_2016[i] < 5000){
    dfMerged$state[i] <- "QLD"
  }
  else if(dfMerged$POA_CODE_2016[i] >= 5000 & dfMerged$POA_CODE_2016[i] < 6000){
    dfMerged$state[i] <- "SA"
  }
  else if(dfMerged$POA_CODE_2016[i] >= 6000 & dfMerged$POA_CODE_2016[i] < 7000){
    dfMerged$state[i] <- "WA"
  }
  else if(dfMerged$POA_CODE_2016[i] >= 7000 & dfMerged$POA_CODE_2016[i] < 8000){
    dfMerged$state[i] <- "TAS"
  }
  else if(dfMerged$POA_CODE_2016[i] >= 800 & dfMerged$POA_CODE_2016[i] < 900){
    dfMerged$state[i] <- "NT"
  }
}

View(dfMerged)


dfAgg <- aggregate(dfMerged[c("originalCentreCount", "adjCentreCount")], 
                   by = list(dfMerged$state), 
                   FUN = sum)

dfAgg$diff <- with(dfAgg, round(-100*(originalCentreCount - adjCentreCount)/originalCentreCount), digits=3)

colnames(dfAgg) <- c("State", "originalCentres", "adjustedCentres", "percentageDifference")
View(dfAgg)

dfQld <- dfMerged[ which(dfMerged$state == "QLD"), ]

View(dfQld)
