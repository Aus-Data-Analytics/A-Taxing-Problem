# A Taxing Problem
## Project Description

Our focus was the challenge of identifying where the ATO should locate their Tax Help Centers. This project also addressed the challenge of combining data sets and using open data to help governments answer questions.

## Data Story

We set out to demonstrate in this challenge how Machine Learning can be used to help government agencies make decisions, in this case where to put Tax Help Centers to best serve the community.
We utilised this opportunity to merge data from a variety of sources, namely:
1. ATO individual tax return data from 2014 - 2015 & 2015 - 2016
2. ABS demographic summary data from 2015 & 2016
3. Tax Help Center locations
4. ABS Geography publications

Given that the current distribution of Tax Help Centers is not necessarily optimal, the merged data was used to calculate an adjusted score for each postcode's requirement for tax assistance based upon the ATO eligibility criteria.
The adjusted scores were used to train a deep neural network to predict the required number of Tax Help Centers in a postcode.

The adjusted scores were used to train a deep neural network to predict the required number of Tax Help Centers in a postcode, which after using cross-folds validation to verify the accuracy of the model, achieved a score of 96%

## Examples

### Adelaide with current tax help centre locations
![Adelaide original locations](https://raw.githubusercontent.com/Aus-Data-Analytics/A-Taxing-Problem/master/content/images/adelaide_original.png)

### Adelaide with suggested tax help centre locations
![Adelaide suggested locations](https://raw.githubusercontent.com/Aus-Data-Analytics/A-Taxing-Problem/master/content/images/adelaide_suggested.png)
