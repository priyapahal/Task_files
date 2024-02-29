library(readxl)
library(ggplot2)

df <- read_excel("Chromosome_data.xlsx")

chromosome_counts <- table(df$chromosome)

counts_df <- data.frame(chromosome = as.character(names(chromosome_counts)),
                        count = as.integer(chromosome_counts))

ggplot(counts_df, aes(x = chromosome, y = count)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  geom_text(aes(label = count), vjust = -0.5, size = 3, color = "black") +
  labs(x = "Chromosome", y = "Symbol Count", title = "Gene Symbol
Count by Chromosome") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))