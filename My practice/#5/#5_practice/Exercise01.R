library(tidyr)
wide_df <- data.frame(col = c('X', 'Y'), A = c(1,4), B = c(2,5), C = c(3,6))
wide_df
long_df <- gather(wide_df, my_key, my_val, -col)
spread(long_df, my_key, my_val)
