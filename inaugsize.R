## data from politifact link here:
## http://www.politifact.com/truth-o-meter/article/2017/jan/20/inaugural-crowd-sizes-ranked/
df <- data.frame(
    year = seq(1989, 2017, 4),
    endyear = seq(1992, 2020, 4),
    president = c("Bush I", "Clinton", "Clinton",
                  "Bush", "Bush", "Obama", "Obama", "Trump"),
    party = c("R", "D", "D", "R", "R", "D", "D", "R"),
    term = c(1, 1, 2, 1, 2, 1, 2, 1),
    inaug.size = c(300000, 800000, 250000, 300000, 400000,
                   1800000, 1000000, 250000),
    inaug.min = rep(0, 8)
)

## load ggplot2
library(ggplot2)

## create plot
## uncomment next line and final line (dev.off()) to save img
## png("inaugsize.png", 6, 4, "in", res = 127.5)
ggplot(df, aes(year, inaug.size, fill = party)) +
    geom_bar(stat = "identity") +
    theme_minimal() +
    theme(text = element_text(family = "Avenir"),
          legend.position = "none",
          axis.text.x = element_text(
              color = "black", size = 10)) +
    scale_fill_manual(values = c("#003399", "#aa3333")) +
    scale_x_continuous(
        breaks = seq(1990.5, 2018.5, 4),
        labels = c("Bush I", "Clinton", "Clinton", "Bush",
                   "Bush", "Obama", "Obama", "Trump")) +
    scale_y_continuous(
        breaks = seq(250000, 2000000, 500000),
        labels = c("250k", "750k", "1.25m", "1.75m")) +
    labs(x = "", y = "Inauguration Crowd Size",
         title = "Inauguration crowd sizes since 1989",
         subtitle = "Crowd size estimates from PolitiFact")
## dev.off()
