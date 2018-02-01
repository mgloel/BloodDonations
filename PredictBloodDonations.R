# PredictBloodDonations.R
suppressMessages(library(dplyr))
suppressMessages(library(plotly))

setwd("/Users/matthiasgloel/BloodDonations/")

training <- read.csv("9db113a1-cdbe-4b1c-98c2-11590f124dd8.csv")
test <- read.csv("5c9fa979-5a84-45d6-93b9-543d1a0efc41.csv")

submission <- read.csv("BloodDonationSubmissionFormat.csv")

# Some exploration
training$avg_volume_per_donation <- training$Total.Volume.Donated..c.c.. / training$Number.of.Donationsmutate(training, avg_volume_per_donation = Total.Volume.Donated..c.c../Number.of.Donations)
training$donation_period <- training$Months.since.First.Donation - training$Months.since.Last.Donation
training$month_per_donation <- training$donation_period / training$Number.of.Donations

# Try logistic regressio