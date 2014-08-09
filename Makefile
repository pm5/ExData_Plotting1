
.PHONY: all

all: plot1.png plot2.png plot3.png plot4.png

power.txt: household_power_consumption.txt
	head -n 1 household_power_consumption.txt > power.txt
	grep '^[12]/2/2007' household_power_consumption.txt >> power.txt

household_power_consumption.txt:
	unzip exdata_data_household_power_consumption.zip

plot1.png: plot1.R power.txt
	R --save < plot1.R
