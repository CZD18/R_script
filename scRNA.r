rna <- read.table('GSE120575_scRNA_TPM_GEO.txt',nrows=55739, header=T,row.names=1,sep='\t')
rna <- read.table('GSE120575_scRNA_TPM_GEO.txt',header=T, row.names=1,sep='\t',fill=T)

rna <- rna[-1,]
NR_B <- subset(dat, select=c("Pre_P12", "Pre_P15", "Pre_P2", "Pre_20", "Pre_P25", "Pre_P27", "Pre_P3", "Pre_P31", "Pre_P4", "Pre_6"))
write.csv <- (NR_B, "NR_B.csv")

#############################################################################################

library(dplyr)
library(tidyverse)
rn <- read.table('scRNA.txt',header=T,row.names = NULL,sep='\t',fill=T)
rn <- rn [,-1]
#write.csv(rn,'es.csv')
#rn <- rn [,-1]
names(rn)[1] <- "id"
#write.csv(rn,"rn_id.csv")

#e12 <- rn [ ,grepl("Pre_P12", names(rn))]
#e15 <- rn [ ,grepl("Pre_P15", names(rn))]
nrb <- rn [ ,grep("Pre_P12|Pre_P15|Pre_P2|Pre_P20|Pre_P25|Pre_P27|Pre_3|Pre_P31|Pre_P4|Pre_P6",names(rn))]
#nrb> nrb[ , -which(names(nrb) %in% c("z","u"))]
nrb <- nrb %>% select(-contains("Pre_P21"))
nrb <- nrb %>% select(-contains("Pre_P22"))
nrb <- nrb %>% select(-contains("Pre_P23"))
nrb <- nrb %>% select(-contains("Pre_P24"))
nrb <- nrb %>% select(-contains("Pre_P26"))
nrb <- nrb %>% select(-contains("Pre_P28"))
nrb <- nrb %>% select(-contains("Pre_P29"))
nrb <- nrb %>% select(-contains("Pre_P30"))
nrb <- nrb %>% select(-contains("Pre_P32"))
nrb <- nrb %>% select(-contains("Pre_P33"))
nrb <- nrb %>% select(-contains("Pre_P34"))
nrb <- nrb %>% select(-contains("Pre_P35"))

rownames(nrb) <- rn$id
write.csv(nrb,"nrb.csv")

nrp <- rn [ ,grep("Post_P1_2|Post_P10|Post_P11|Post_P12|Post_P13|Post_P14|Post_P15|Post_P16|Post_P18|Post_P2|Post_P20|Post_P22|Post_P23|Post_P23_2|Post_P28|Post_P28_2|Post_P3|Post_P3_2|Post_P30|Post_P5|Post_P6",names(rn))]
#nrp> df[ , -which(names(df) %in% c("))]
nrp <- nrp %>% select(-contains("Post_P21"))
nrp <- nrp %>% select(-contains("Post_P24"))
nrp <- nrp %>% select(-contains("Post_P25"))
nrp <- nrp %>% select(-contains("Post_P26"))
nrp <- nrp %>% select(-contains("Post_P27"))
nrp <- nrp %>% select(-contains("Post_P29"))
nrp <- nrp %>% select(-contains("Post_P31"))
nrp <- nrp %>% select(-contains("Post_P32"))
nrp <- nrp %>% select(-contains("Post_P33"))
nrp <- nrp %>% select(-contains("Post_P34"))
nrp <- nrp %>% select(-contains("Post_P35"))

rownames(nrp) <- rn$id
write.csv(nrp,"nrp.csv")


rb <- rn [ ,grep("Pre_P1|Pre_P24|Pre_P26|Pre_P28|Pre_P29|Pre_P33|Pre_P35|Pre_P7|Pre_P8",names(rn))]

rb <- rb %>% select(-contains("Pre_P10"))
rb <- rb %>% select(-contains("Pre_P11"))
rb <- rb %>% select(-contains("Pre_P12"))
rb <- rb %>% select(-contains("Pre_P13"))
rb <- rb %>% select(-contains("Pre_P14"))
rb <- rb %>% select(-contains("Pre_P15"))
rb <- rb %>% select(-contains("Pre_P16"))
rb <- rb %>% select(-contains("Pre_P17"))
rb <- rb %>% select(-contains("Pre_P18"))
rb <- rb %>% select(-contains("Pre_P19"))

rownames(rb) <- rn$id
write.csv(rb,"rb.csv")
