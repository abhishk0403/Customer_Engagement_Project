# Tracking User Engagement with SQL, Excel, and Python Project

## Project Overview
- Comparing and Analyzing Student Engagement was done by using SQL, Excel and python
- Data preparation for model building and analysis was done by using complex SQL queries
- Hypothesis Testing and data preprocessing done using Excel
- Built Linear regression model for prdicting the student engagement

## Software Used
- Python
- Excel
- MySQL
- Packages: Numpy, pandas,Matplotlib,Seaborn,sklearn,scikit-Learn

## Data Preparation with SQL – Creating a View
-Calculating a Subscription’s End Date
-Re-Calculating a Subscription’s End Date
-Creating Two ‘paid’ Columns and a MySQL View
-Calculating Total Minutes Watched in Q2 2021 and Q2 2022
-Creating a ‘paid’ Column

## Data Preparation with SQL – Certificates Issued
- Studying Minutes Watched and Certificates Issued

## Data Preprocessing with Python – Removing Outliers
- Plotting the Distributions
![image](https://github.com/abhishk0403/Customer_Engagement_Project/assets/140788396/25852531-2d03-41a6-bdbc-c61bcd1b471a)  
-Removing the Outliers  
![image](https://github.com/abhishk0403/Customer_Engagement_Project/assets/140788396/49a0944d-7b10-4b95-81c2-a08f2eda9157)

## Data Analysis with Excel – Hypothesis Testing
- Calculating Mean and Median Values
- Calculating Confidence Intervals
- Performing Hypothesis Testing
Regarding the second part of the question, a Type I error (false positive) occurs when you reject the null hypothesis, which is true.
In our case, this would mean concluding that engagement in 2022 is higher when it’s not.
The cost to the company of each type of error would depend on the implications of incorrectly concluding that engagement has increased—potentially leading to over-investment
in certain features or complacency about needing to improve features—versus incorrectly concluding that engagement has not increased—potentially missing out on recognizing
successful features or identifying areas that need improvement.

A Type II error (false negative) occurs when you fail to reject the null hypothesis, but it is false. In our case, this would mean concluding that the engagement in 2022 is not higher when it is

## Data Analysis with Excel – Correlation Coefficients
- Calculating Correlation Coefficients
  ![image](https://github.com/abhishk0403/Customer_Engagement_Project/assets/140788396/5398f80f-49e8-4fcf-b1a8-0f930c989a43)
  The correlation between Certificates and Minutes is approaximately 0.513—a strong positive correlation. It suggests that students who watch more content tend to earn more certificates.

## Dependencies and Probabilities
- Assessing Event Dependencies
-  Calculating Probabilities
Confirming the result from the previous task, students who watched a lecture in Q2 2022 were unlikely to have also watched one in the same quarter of the previous year.
Among the students who watched a lecture in Q2 2022, 7% had also watched a lecture in Q2 2021.

## Data Prediction with Python
-  Creating a Linear Regression
The value we obtained is approximately 0.305. This suggests that about 30% of the variability in the target variable (the number of certificates issued) is
explained by the input variable (the number of minutes watched). This model does not account for the other 70%.An R-squared value of 0.305 is not a bad result,
but, as we mentioned, it implies that other factors also play a role in the number of certificates issued. Let’s list them one by one.
One such factor, for example, includes different courses with different lengths. Therefore, a student passing three short courses will be issued three certificates,
while a student passing one long course—roughly the length of three short ones—will be given only one certificate. Another factor could be that some students pass exams
without watching the courses. The reason could be that they are familiar with the subject and only aim for a document proving their proficiency.
The model, therefore, provides some insight into the relationship between these two quantities, but there’s still a large portion of the variance that remains unexplained.
The number of minutes watched is reasonable to include when predicting the number of certificates issued but should not be the sole factor considered. 

