library(foreign)
library(dplyr)
library(ggvis)

df <- data.frame(read.csv("retained_everincar.csv"))
df2 <- df %>% mutate(quarter = factor(quarter))




df2 %>% ggvis(x = ~quarter, y = ~retained, fill = ~as.factor(everincar)) %>% layer_bars(stack = F)