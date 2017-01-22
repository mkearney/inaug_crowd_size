## data from politifact link here:
## http://www.politifact.com/truth-o-meter/article/2017/jan/20/inaugural-crowd-sizes-ranked/
df <- data.frame(
    year = seq(1989, 2017, 4),
    president = c("Bush I", "Clinton", "Clinton",
                  "Bush", "Bush", "Obama", "Obama", "Trump"),
    party = c("R", "D", "D", "R", "R", "D", "D", "R"),
    term = c(1, 1, 2, 1, 2, 1, 2, 1),
    inaug.size = c(300000, 800000, 250000, 300000, 400000,
                   1800000, 1000000, 250000)
)

## load ggplot2
library(ggplot2)

## create plot
## uncomment next line and final line (dev.off()) to save img
## png("inaugsize.png", 6, 4, "in", res = 127.5)
ggplot(df, aes(year, inaug.size, fill = party)) +
    geom_bar(stat = "identity") +
    theme_minimal() +
    theme(text = element_text(family = "Avenir Next Condensed"),
          plot.title = element_text(face = "bold", size = 18),
          legend.position = "none",
          axis.text.x = element_text(
              color = "black", size = 10)) +
    scale_fill_manual(values = c("#003399", "#aa3333")) +
    scale_x_continuous(
        breaks = seq(1989, 2017, 4),
        labels = c("Bush I", "Clinton", "Clinton", "Bush",
                   "Bush", "Obama", "Obama", "Trump")) +
    scale_y_continuous(
        breaks = seq(250000, 2000000, 500000),
        labels = c("250k", "750k", "1.25m", "1.75m")) +
    labs(x = "", y = "Inauguration Crowd Size",
         title = "Inauguration crowd sizes since 1989",
         subtitle = "Crowd size estimates from PolitiFact")
## dev.off()



## metro ridership data as reported by @wmata twitter feed
## https://twitter.com/wmata
## all estimates are as of 11am on the day of the events
metro <- data.frame(
    event = c("Bush Inaug\n2005",
              "Obama Inaug\n2009",
              "Obama Inaug\n2013",
              "Trump Inaug\n2017",
              "#WomensMarch\n2017"),
    ridership = c(197000, 513000, 317000, 193000, 275000)
)
## fix factor order
metro$event <- factor(metro$event, levels = metro$event)

## uncomment following and dev.off() lines to save png
## png("metroride.png", 6, 4, "in", res = 127.5)
ggplot(metro, aes(x = event, y = ridership, fill = event)) +
    geom_bar(stat = "identity") +
    theme_minimal() +
    theme(text = element_text(family = "Avenir Next Condensed"),
          plot.title = element_text(face = "bold", size = 16),
          legend.position = "none",
          axis.text.x = element_text(
              color = "black", size = 10)) +
    scale_fill_manual(values = c(
                          "#aa3333", "#003399", "#003399",
                          "#aa3333", "#aa3399")) +
    scale_y_continuous(
        breaks = seq(0, 600000, 150000),
        labels = c("0", "150k", "300k", "450k", "600k")) +
    labs(x = "", y = "Metro Ridership at 11am",
         title = "Metro Ridership of DC inaugurals and #WomensMarch",
         subtitle = paste0(
             "Estimates reported by @wmata the official ",
             "feed of Metro/WMATA"))
## dev.off()
