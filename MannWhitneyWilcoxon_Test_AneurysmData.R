#The following script will perform a Mann-Whitney-Wilcoxon test on some data related to the maximum
#height of a set of intracranial aneurysms.  This test wants to compare the size of aneurysms that did 
#not rupture vs. aneurysms that did rupture, to see if there is a significant difference in the aneurysm
#height between aneurysms that rupture and aneurysms that do not.  The reason this statistical test was
#chosen is because it appears that the aneurysm height data is unfortunately not very well normally distributed.
#Based on looking at some histograms of the data, the data appears to follow more of a lognormal distribution.  
#This test does not assume that the data have to be normally distributed.  This approach is also preferred to
#taking the logarithm of the data, since taking the log of the data can alter the original data unfavorably,
#especially if negative log values are generated.

#Set the working directory where the Excel file containing the aneurysm data is located.
setwd("c:/Users/310084562/My Documents/Aneurysm Measurement project/Statistical analysis")

#Install and load the Excel file package to read in the data.
#install.packages("xlsx")
library("xlsx")

#Read in an Excel worksheet showing some example houseprices into a data frame.
#Since there is only one sheet in the Excel file, read the first sheet.
#Headers are also present in the first row and only the 11th and 12th columns will be read in,
#Since these columns specifically contain the needed data.
AneurysmData<- read.xlsx("Ruptured_vs_unruptured_aneurysms.xlsx",sheetIndex = 1, header = TRUE, colIndex =c(11,12))

#Print the class type and size of the aneurysm data frame.
print(class(AneurysmData))
print(dim(AneurysmData))


#[Optional code segment.] 

#Can extract data seperately into numerical vectors from the original data frame.

#Convert the first column of the data frame to a numerical data vector.  These are the ruptured aneurysm data.
#Ruptured_data <- c(unlist(AneurysmData[,1]))


#Also convert the unruptured data in the data frame to a numerical data vector.
#Unruptured_data <- c(unlist(AneurysmData[,2]))

#Remove all NA arguments from the vector of unruptured data, since it has fewer entries than the ruptured data.
#Unruptured_data <- Unruptured_data[!is.na(Unruptured_data)]

#[End of optional code segment.]


#Perform the Mann-Whitney-Wilcoxon statistical test.  In this case, we are doing a one-tailed test, since we
#hypothesize that the ruptured aneurysms are larger on average than the unruptured ones.  This is also not
#a paired test, since we are comparing two categories of patients, with each category independent of the other.
# We really want to see if there is a statistically significant difference between the mean aneurysm heights
#in each category.  The advantage of this test specifically is that it makes no assumptions about whether
#or not the data is normally distributed.  In this case, the aneurysm height data appears to follow more of a
#lognormal distribution, with a long right tail.  
Test_Result <- wilcox.test(AneurysmData$Ruptured.AK.data.[1:30],AneurysmData$Unruptured.AK.data.[1:30], 
                           alternative = "greater", correct = T, exact = F, paired = FALSE)

#Print the result of the statistical test.
print(Test_Result)


