# counts per SA2

## count * ratio for number of centres per sa2

setwd("C:\\Users\\Jess\\Documents\\GovHack2018")


fileName <- "poa_to_sa2_OriginalWithAllSA2s"
sa2file <- read.csv(paste0(fileName,".csv"),header=TRUE,quote="",stringsAsFactors=FALSE)
View(sa2file)

countFileName <- "out2"
countfile <- read.csv(paste0(countFileName,".csv"),header=TRUE,quote="",stringsAsFactors=FALSE)
View(countfile)


df <- merge(x=countfile, y=sa2file,  by.x="Postcode", by.y = "POA_CODE_2016",all.x=TRUE)
df[is.na(df)] <- 0.0
View(df)


colnames(df)


cols <- c("Postcode","POA_NAME_2016","SA2_MAINCODE_2016","SA2_NAME_2016","RATIO","PERCENTAGE","Count")
dfMerged <- df[cols]


dfMerged$centres <- with(dfMerged, RATIO * as.numeric(Count))
#dfMerged$centres <- with(dfMerged, round(RATIO * as.numeric(Count)))
sum(dfMerged$centres)
View(dfMerged)

dfMerged$Count <- as.numeric(dfMerged$Count)


dfAgg <- aggregate(dfMerged[c("centres")], 
                by = list(dfMerged$SA2_MAINCODE_2016), 
                FUN = sum)
View(dfAgg)

sum(dfAgg$centres)
length(unique(dfAgg$Group.1))
dim(dfAgg)

write.table(dfAgg, "sa2_counts.txt", sep=",", col.names=TRUE, row.names=FALSE, quote=FALSE)

