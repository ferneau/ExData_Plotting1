library(dplyr)

load_powerdata <- function() {
  # Set constants
  powerdata_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  powerdata_zipfilename <- "household_power_consumption.zip"
  #
  # If the zip file does not exist, download it
  if ( !file.exists(powerdata_zipfilename)) {
    print("Downloading ZIP file")
    download.file(powerdata_url,powerdata_zipfilename)
  }
  #  
  # The zipfile only contains a single file, extract its name
  files <- unzip(powerdata_zipfilename, list=TRUE)
  powerdata_filename <- files$Name
  #
  # if the extracted text file does not exist, extract it
  if ( !file.exists(powerdata_filename)) {
    print("Unzipping datafile")
    unzip(powerdata_zipfilename)
  }
  #
  # Load the power file
  print("Reading datafile")
  powerdata <- read.table(powerdata_filename,header=TRUE,sep=";",na.strings="?")
  #
  # Subset the data
  print("Limiting data to Feb 1 & 2, 2007")
  powerdata <- subset(powerdata, Date == "1/2/2007" | Date == "2/2/2007")
  #
  # Clean up the date
  print("Cleaning up date")
  powerdata <- mutate(powerdata,Date = as.Date(Date,"%d/%m/%Y"))
  #
  # Create a date time value
  print("Creating datetime")
  powerdata <- mutate(powerdata, date_time = paste(Date,Time))
  #
  # Return the subsetted data
  powerdata
}