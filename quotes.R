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
