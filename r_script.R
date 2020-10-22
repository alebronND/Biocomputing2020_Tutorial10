# Exercise #8 

# setwd
setwd ("/Users/andrea/Biocomputing2020_Tutorial10")
# open UWvMSU_1-22-13.txt
ScoringTable=read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="\t")
# create dataframe or matrix with the cumulative scores for each team whenever either team scores
score_time_Table=data.frame(matrix(ncol=3, nrow=0))

# create variable to save the score for each team
MSU_score=0
UW_score=0
# create for loop that will go for as many rows in the table and will add up the scores for each time every time they score

for (i in 1:nrow(ScoringTable)) {
  if (ScoringTable$team[i]=="UW"){
    UW_score=UW_score+ScoringTable$score[i]
  }
  else {
    MSU_score=MSU_score+ScoringTable$score[i]
  }

  # create time variable to save the time at which the teams scored; easy way to name column as time
  time=as.numeric(ScoringTable$time[i])
  # create data frame with the time and score for each time at that time point
  time_score=data.frame(time,MSU_score,UW_score)
  # append the data frame that was already created
  score_time_Table=rbind(score_time_Table, time_score)
}
x=c("time", "MSU", "UW")
colnames(score_time_Table)=x
# THIS WILL ADD A COLUMN WITH THE QUARTER 
for (i in 1:nrow(score_time_Table)) {
  if (score_time_Table$time[i]>30.0) {
    score_time_Table$quarter[i]="fourth quarter"
  }
  else if (score_time_Table$time[i]>20.0) {
    score_time_Table$quarter[i]="third quarter"
  }
  else if (score_time_Table$time[i]>10.0) {
    score_time_Table$quarter[i]="second quarter"
  }
  else { 
    score_time_Table$quarter[i]="first quarter"
  }
}
# create plot with time in the x axis and score in the y axis
plot=plot(x=score_time_Table$time, y=score_time_Table$MSU, type="l", col="black", lwd=1.6, xlab="time", ylab="score")
# adds the second line 
lines (x=score_time_Table$time, y=score_time_Table$UW, col="blue", lwd=1.6)
# create legend with the team names and their respective lines
legend(4,48, legend=c("MSU", "UW"), col=c("black", "blue"), lty=1:10, cex=1.2)



# Problem 2
# creates function called guess_my_number
guess_my_number=function(x) {
  print("Let's play guess my number!")
  # x will be the random number chosen from 1 to 100
  x=sample(1:100, size=1)
  tries=1
  # ask the person to input a number
  guess=readline("guess a number between 1 and 100: ")
  #will stop at 10 guesses
  while(tries < 10) {
    # if guess is lower than the x it'll ask to try again and will say higher
    if (guess < x) {
      print(paste0("higher"))
      y=readline("try again: ")
      guess=as.numeric(y)
      tries=tries+1
    # if guess is higher than the x it'll ask to try again and will say lower
    } else if (guess>x) {
      print(paste0("lower"))
      y=readline("try again: ")
      guess=as.numeric(y)
      tries=tries+1
    # if the guess is right it'll say correct!
    } else if (guess == x) {
      print("correct!")
      stop()
    }
  }
}




