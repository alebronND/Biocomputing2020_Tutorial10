# Exercise #8 

# setwd
setwd ("/Users/alebron1/homework")
# open UWvMSU_1-22-13.txt
ScoringTable=read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="\t")
# create dataframe or matrix with the cumulative scores for each team whenever either team scores
score_time_Table=data.frame(matrix(ncol=3, nrow=0))
x=c("time", "MSU", "UW")
colnames(score_time_Table)=x


MSU_score=0
UW_score=0

for (i in 1:nrow(ScoringTable)) {
  if (ScoringTable$team[i]=="UW"){
    UW_score=UW_score+ScoringTable$score[i]
    newscore_time_Table[(ScoringTable$time[i])
    
  }
  else {
    MSU_score=MSU_score+ScoringTable$score[i]
  }
}

?rbind
