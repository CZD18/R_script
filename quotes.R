airquality_trimmed <- airquality[which(airquality$Month == "Jul" |
                                       airquality$Month == "Aug" |
                                       airquality$Month == "Sep"), ]
airquality_trimmed$Temp.f <- factor(ifelse(airquality_trimmed$Temp > mean(airquality_trimmed$Temp), 1, 0),
                                    labels = c("Low temp", "High temp"))


######################### ---Boxplots

p10 <- ggplot(airquality_trimmed, aes(x = Month, y = Ozone, fill = Temp.f)) +
        geom_boxplot(alpha=0.7) +
        scale_y_continuous(name = "Mean ozone in\nparts per billion",
                           breaks = seq(0, 175, 25),
                           limits=c(0, 175)) +
        scale_x_discrete(name = "Month") +
        ggtitle("Boxplot of mean ozone by month") +
        theme_bw() +
        theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
              text = element_text(size = 12, family = "Tahoma"),
              axis.title = element_text(face="bold"),
              axis.text.x=element_text(size = 11),
              legend.position = "bottom") +
        scale_fill_brewer(palette = "Accent") +
        labs(fill = "Temperature")
p10



#######################----ggplot for stack bars

ggplot(test_perce, aes(fill=Mixture, y=Percentage, x=Condition)) + 
    geom_bar(position="fill", stat="identity")+theme_bw() + 
scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9","#BEAED4","#FFFF99","#F0027F","#CCCCCC","#666666","#D95F02","#E7298A","#984EA3","#A6CEE3","#377EB8","#FF7F00","#A65628","#999999","#8DA0CB","#FFD92F","#B3DE69","#CCEBC5","#B3B3B3","#BC80BD"))+
labs(x=NULL, y=NULL)+
theme( panel.grid.major = element_blank(), panel.grid.minor = element_blank())


barplot(as.matrix(t(CIBERSORT_005)),col=mycol,border = NA,space = 0,ylab = "Percentage",axis.lty = 1,legend("topright",colnames(CIBERSORT_005),fill = mycol,bty="n",xpd = TRUE))
