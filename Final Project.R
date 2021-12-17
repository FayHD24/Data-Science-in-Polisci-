
### Final Project ##

globalterrorismdb <- read_excel("globalterrorismdb_.xlsx")
TerrosismUs <- globalterrorismdb$region_txt

table(TerrosismUs)
summary(TerrosismUs)

Before911 <- subset(globalterrorismdb, (iyear  >=1980 & iyear < 2001) & 
                      (country_txt == "United States"))

after911 <- subset(globalterrorismdb, (iyear >= 2001) &
                      (country_txt == "United States"))


table(after911$iyear)
table(Before911$iyear)

y <-c(67,74,77,44,63,40,49,34,27,42,32,30,32,0,55,60,35,42,31,54,42,44,  
      33,33,9,21,6,8,18,12,17,10,20,20,29,39,68,66,75,68) 
x <-c(1980,1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,
      1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,
      2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019)

barplot(y, main= "Terrorist Attacks in the U.S. (1980-2019)", 
        xlab= "Year", ylab= "Number of Attacks", cex.main = 2,
        names.arg= x, col = "Sky blue", ylim = c(0,100), las=3)




FTO <- c("Croatian Nationalists","Croatian Freedom Fighters",
         "Palestine Liberation Organization (PLO)",
         "Hanafi Muslims",
         "Armenian Secret Army for the Liberation of Armenia",
         "Serbian Nationalists", "Jewish Defense League (JDL)", "Black Muslims",
         "Worldwide Organization of Native Taiwanese", "Black American Moslems",
         "Justice Commandos for the Armenian Genocide","Qaddafi loyalists",
         "Hatikvah Leumi or National Hope",
         "Imperial Iranian Patriotic Organization", 
         "Anti-Communist Viets Organization","Ninth of June Organization",
         "Black Brigade (United States)",
         "Thunder of Zion",
         "Vietnamese Organization to Exterminate Communists and Restore the Nation",
         "Jamaat-al-Fuqra","Jewish Direct Action",
         "Pedro Albizu Campos Revolutionary Forces", "Vietnamese Refugees",
         "Tontons Macoutes","Kahane Chai","Mujahedin-e Khalq (MEK)",
         "Medellin Drug Cartel","Islamist extremists", 
         "Al-Qaida in the Arabian Peninsula (AQAP)","Iraqi extremists",
         "Al-Qaida")

after911$FTO <- ifelse(after911$gname %in% FTO,0, 1)
Before911$FTO <- ifelse(Before911$gname %in% FTO,0, 1)

mean(Before911$FTO)-mean(after911$FTO)


after911$FTO <- ifelse(after911$gname %in% FTO,"Foreign", " Domestic")
Before911$FTO <- ifelse(Before911$gname %in% FTO,"Foreign", "Domestic")


y <-c(67,74,77,44,63,40,49,34,27,42,32,30,32,0,55,60,35,42,31,54,42,44,  
  33,33,9,21,6,8,18,12,17,10,20,20,29,39,68,66,75,68) 
x <-c(1980,1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,
  1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,
  2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019)

barplot(y, main= "Terrorist Attacks in the U.S. (1980-2019)", 
        xlab= "Year", ylab= "Number of Attacks",
        names.arg= x, col = "Sky blue", ylim = c(0,100), las=3)


Period2 <-table(after911$FTO)
Period1 <-table(Before911$FTO)

barplot(Period1,
        ylim = c(0, 1000),
        col = c("red", "Yellow"),
        main = "Terrorist Attacks in the U.S. Before 9/11 by group", cex.main = 2,
        cex.names = 1, ylab = "Number of Attacks",
        xlab= "Group", 
        cex.lab = 1,
        las = 1)

