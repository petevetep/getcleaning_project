#
##  Reading training data
train_data <- read.table("train/X_train.txt")
## adding activity data (1 column)
train_data$Activity <- read.table("train/y_train.txt")[,1]
## adding subject id data (1 column)
train_data$Subject <- read.table("train/subject_train.txt")[,1]
##  Reading test data
test_data <- read.table("test/X_test.txt")
## adding activity data (1 column)
test_data$Activity <- read.table("test/y_test.txt")[,1]
## adding subject id data (1 column)
test_data$Subject <- read.table("test/subject_test.txt")[,1]
#
## 1. Merging data sets
#
data <- rbind(train_data,test_data)

## 2. Extracting only means and standard deviations

features <- read.table("features.txt")
means <- grep("mean", features[,2],ignore.case=TRUE)
stdvs <- grep("std", features[,2],ignore.case=TRUE)
subject.col <- ncol(data)
activity.col <- ncol(data)-1 
## Assigning desriptive names
colnames(data)[1:nrow(features)] <- as.character(features[,2])
##  filtering out unused variables (columns)
cleaned_data <- data[,sort(unique(c(means,
                                    stdvs,
                                    activity.col,
                                    subject.col)))]

## 3. Using descriptive activity names 
activities <- read.table("activity_labels.txt")
cleaned_data$Activity <- activities[cleaned_data$Activity,2]

## 4. Labeling dataset with descriptive variable names

# It is already done at previous step.
# cleaned_data retains colnames from data
cleaned_data

## Step 5

#s2 <- sapply(t1,function(x){
# m <- data.frame(); 
# colnames(m) <-  colnames(x)); 
# for (i in 1:86) m[1,i] <- mean(x[,i]); 
# m[1,87:88] <- x[1,87:88]; m 
# })

#r2 <- n[1,]; lapply(s2,function(x){ r2 <<- rbind(r2,x[1,1:89]); invisible(x)  })

#r3 <- r2[2:181,1:88]
#write.table(r3,"final_dataset_week3.txt",row.names = FALSE)
