# Question 1
movie <- c("The Avengers", "Harry Potter", "Home Alone", "Toy Story",
          "Frozen", "The Notebook", "Interstellar")

# Question 2
my_rating <- c(4.8, NA, 4.5, 4.0, 4.1, NA, 4.6)
# Question 3
TA_rating <- c(4.3, NA, 3.8, 3, 2.8, NA, 1.6)
# Question 4
mem1_rating <- c(NA, 3.2, 4.0 , 4.3, 4.7, NA, 5.0)
mem2_rating <- c(4.8, 4.7, 4.7, NA, 3.8, NA, 4.6)
mem3_rating <- c(3.5, 5.0, NA, NA, 4.0, NA, 3.8)
team_matrix <- matrix(c(my_rating,TA_rating, mem1_rating, mem2_rating, mem3_rating), byrow = TRUE, nrow = 5)

# Question 5
stu_mean <- rowMeans(team_matrix, na.rm = TRUE)
# Question 6
movie_sum <- colSums(team_matrix, na.rm = TRUE)

# Question 7
team_matrix <- cbind(team_matrix, stu_mean)
# Question 8
team_matrix <- rbind(team_matrix, movie_sum)
# Question 9
team_matrix[6, 8] = NA

# Question 10
stu_name <- c("Me", "TA", "Choi", "Chae", "Jang", "Movie_sum")
rownames(team_matrix) <- stu_name
colnames(team_matrix) <- c(movie, "Student_mean")

# Question 11
student_means_exceptTA <- rowMeans(team_matrix[c(-2,-6),], na.rm = TRUE)
student_means_exceptTA

# Question 12
Movie_means_except_H.P_T.S <- colMeans(team_matrix[, c(-2,-4,-8)], na.rm = TRUE)
Movie_means_except_H.P_T.S
