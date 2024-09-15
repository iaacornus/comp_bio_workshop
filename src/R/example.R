library(ggplot2)

data()
data(ToothGrowth)
head(ToothGrowth, 6)

boxplot(
    len ~ dose,
    data = ToothGrowth,
    frame = FALSE,
    col = c(
        "#999999",
        "#E69F00",
        "#56B4E9"
    )
)
