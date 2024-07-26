install.packages("semTools")

library(ggplot2)
library(reshape)
library(colortools)
library(plspm)
library(semTools)

library(dplyr)


data_1 <- read.csv("C:/Users/hanee/OneDrive/Documents/GitHub/TI-Effect-on-Green-Capabilities-Spillovers/Data_Files/IN/Code_Produced/SEM_Data0.csv")
head(data_1, n=5)
#summary(data_1)
#unique(data_1)

### Keeping only developing countries
data_1 <- subset(data_1, Economy_type == 'Developing')

#data_1 <- data_1 %>% filter(!is.na(TI1))
#data_1 <- data_1 %>% filter(!is.na(TI2))

data_1 <- data_1[!is.na(data_1$TI1), ]
data_1 <- data_1[!is.na(data_1$TI2), ]

summary(data_1)
unique(data_1)

# Calculate the standard deviation
my_sd_T1 <- sd(data_1$TI1)
my_sd_T2 <- sd(data_1$TI2)

# Print the standard deviation
print(my_sd_T1)
print(my_sd_T2)

unique_values <- unique(data_1$origin)
num_unique_values <- length(unique_values)

# Print the number of unique values
print(num_unique_values)

# Find rows where "Value" is equal to zero
rows_with_zero <- subset(data_1, TI1 == 0)

# Display the rows with "Value" equal to zero
print(rows_with_zero)

head(data_1, n=5)

### SEM MODEL

TI = c(0, 0,0)
G_DGPD = c(1, 0,0)
NG_DGPD = c(1, 0,0)


foot_path = rbind(TI, G_DGPD , NG_DGPD)
# blocks of indicators (outer model)-- Green

## Based on number of column
foot_blocks = list(10:11, c(4,6,8),c(5,7,9))


# vector of modes (reflective)
foot_modes = c("A", "A","A")


### VISULIZATION OF THE PATH ANALYSIS:

innerplot(foot_path)

# RESULTS

foot_pls = plspm(data_1, foot_path, foot_blocks, modes = foot_modes)
summary(foot_pls)
foot_pls$gof



plot(foot_pls, what = "loadings", arr.width = 0.2, show.values = TRUE)


subset(foot_pls$outer_model, block == "TI")

plot(foot_pls, what = "weights",show.values = TRUE)
plot(foot_pls, what = "loadings",show.values = TRUE)

xloads = melt(foot_pls$crossloadings, id.vars = c("name", "block"),
              variable_name = "LV")
# Custom x-axis labels
x_axis_labels <- c("TI1", "TI2", "G-DGPD1", "G-DGPD2", "G-DGPD3", "NG-DGPD1", "NG-DGPD2", "NG-DGPD3")  # Add your custom labels here

x_axis_label <- "Measurment variables"
y_axis_label <- "Cross-loading values"

# bar-charts of crossloadings by block
ggplot(data = xloads,
       aes(x = name, y = value, fill = block)) +
  # add horizontal reference lines
  geom_hline(yintercept = 0, color = "gray75") +
  geom_hline(yintercept = 0.5, color = "gray70", linetype = 2) +
  # indicate the use of car-charts
  geom_bar(stat = 'identity', position = 'dodge') +
  # panel display (i.e. faceting)
  facet_wrap(block ~ LV) +
  # tweaking some grahical elements
  theme(axis.text.x = element_text(angle = 90),
        line = element_blank(),
        plot.title = element_text(size = 12),
  panel.background = element_rect(fill = "white")) +  
  scale_fill_manual(values = c("khaki", "mediumaquamarine","steelblue")) +  # Set the colors
  scale_x_discrete(labels = x_axis_labels) +  # Set custom x-axis labels
  xlab(x_axis_label) +  # Set custom x-axis label
  ylab(y_axis_label) 



#running bootstrap validation

foot_val = plspm(data_1, foot_path, foot_blocks, modes = foot_modes,
                 boot.val = TRUE, br = 200)

foot_val$boot

