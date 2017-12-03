setwd('C:/Users/Xiqian/Desktop/WorkArea/Data_Science/Course_4_Exploring_Data/Week_1')
Work_Dir<-getwd()
HPC_File <- paste(Work_Dir, '/household_power_consumption.txt', sep = '')

HPC_Data <- read.table(HPC_File, header = TRUE, sep = ";")
HPC_Data$Global_active_power <- as.numeric(as.character(HPC_Data$Global_active_power))
HPC_Data$Global_reactive_power <- as.numeric(as.character(HPC_Data$Global_reactive_power))
HPC_Data$Voltage <- as.numeric(as.character(HPC_Data$Voltage))
HPC_Data$Global_intensity <- as.numeric(as.character(HPC_Data$Global_intensity))
HPC_Data$Sub_metering_1 <- as.numeric(as.character(HPC_Data$Sub_metering_1))
HPC_Data$Sub_metering_2 <- as.numeric(as.character(HPC_Data$Sub_metering_2))
HPC_Data$Sub_metering_3 <- as.numeric(as.character(HPC_Data$Sub_metering_3))

Date_Sub <- c("1/2/2007", "2/2/2007")
HPC_Sub <- HPC_Data[HPC_Data$Date %in% Date_Sub,]

HPC_Sub$Date_Time <- paste(HPC_Sub$Date, HPC_Sub$Time)
HPC_Sub$Date_Time <-strptime(HPC_Sub$Date_Time, format = "%d/%m/%Y %H:%M:%S")


plot(HPC_Sub$Date_Time, HPC_Sub$Global_active_power, type = "l", ylab = "Global Active Power (killowatts)", xlab = "")

