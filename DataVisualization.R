library(dplyr)
library(ggplot2)

# Install historydata package
install.packages("historydata")

# Load historydata package
library(historydata)

# Load early colleges data
data(early_colleges)     

#View early colleges data
early_colleges

#Tidying the data
early_colleges[1,6] <- "Congregational"
early_colleges


#To find out the number of secular and non secular colleges before the U.S. War of 1812.

secular_colleges_before_1812<-early_colleges%>%
  filter(established < 1812)%>%
  mutate(is_secular=ifelse(sponsorship!="Secular", "no", "yes"))

ggplot(secular_colleges_before_1812) +
  geom_bar(aes(x=is_secular, fill=is_secular))+
  labs(x="Is the college secular?")


#To find out the number of secular and non secular colleges after the start of the U.S. War of 1812.

secular_colleges_after_1812<-early_colleges%>%
  filter(established > 1812)%>%
  mutate(is_secular=ifelse(sponsorship!="Secular", "no", "yes"))

ggplot(secular_colleges_after_1812) +
  geom_bar(aes(x=is_secular, fill=is_secular))+
  labs(x="Is the college secular?")





