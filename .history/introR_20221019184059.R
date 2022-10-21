##############
##  PART 1  ##
##############

####  INTRODUCTION TO R AND RSTUDIO  ####

# Intro to R Lesson
# Feb 16th, 2016

# Interacting with R

## I am adding 3 and 5. R is fun!
3 + 5

x <- 3

y <- 5

number <- x + y

## Exercise ##
x <- 5

number <- x + y

y <- 10

number <- x + y

####  R SYNTAX AND DATA STRUCTURE  ####

# Create a numeric vector and store the vector as a variable called 'glengths'
glengths <- c(4.6, 3000, 50000)
glengths

# Create a character vector and store the vector as a variable called 'species'
species <- c("ecoli", "human", "corn")
species

# Forget to put quotes around corn
species <- c("ecoli", "human", corn)

# Create a character vector and store the vector as a variable called 'species'
species <- c("ecoli", "human", "corn")

## Exercise ##
# create a vector of numeric and character values by combining the two vectors we just created
combined <- c(glengths, species)

# Create a character vector and store the vector as a variable called 'expression'
expression <- c("low", "high", "medium", "high", "low", "medium", "high")

# Turn 'expression' vector into a factor
expression <- factor(expression)

samplegroup <- c("CTL", "CTL", "CTL", "KO", "KO", "KO", "OE", "OE", "OE")
samplegroup <- factor(samplegroup)

# Create a data frame and store it as a variable called 'df'
df <- data.frame(species, glengths)

df

titles <- c("Catch-22", "Pride and Prejudice", "Nineteen Eighty Four")
pages <- c(453, 432, 328)

favorite_books <- data.frame(titles, pages)
favorite_books

list1 <- list(species, df, number)
list1

list2 <- list(species, glengths, number)
list2

####  FUNCTIONS AND ARGUMENTS  ####

# function_name(input)

glengths <- c(glengths, 90) # adding at the end
glengths <- c(30, glengths) # adding at the beginning

sqrt(81)

sqrt(glengths)

round(3.14159)

# how to find out information of the function
?round

args(round)

example("round")

round(3.14159, digits = 2)

round(3.14159, 2)

?mean

mean(glengths)

test <- c(1, NA, 2, 3, NA, 4)
mean(test, na.rm = TRUE)

sort(test, decreasing = TRUE)

# name_of_function <- function(argument1, argument2) {
# statements or code that does something
# return(something)
# }

square_it <- function(x) {
  square <- x * x
  return(square)
}

square_it(5)

multiply_it <- function(x, y) {
  multiply <- x * y
  return(multiply)
}

multiply_it(x = 4, y = 6)


####  READING IN AND INSPECTING DATA  ####

?read.csv

metadata <- read.csv(file = "data/mouse_exp_design.txt")

proj_summary <- read.table(file = "data/project-summary.txt")

head(metadata)

class(glengths)
class(metadata)

summary(proj_summary)

length(samplegroup)

dim(proj_summary)

rownames(metadata)

ncol(proj_summary)


#### PRACTICE EXERCISES I: DAY 2 ACTIVITIES #####

temp_conv <- function(temp_f) {
  temp_k <- ((temp_f - 32) * 5 / 9) + 273.15
  return(temp_k)
}
temp_conv(70)

round(temp_conv(70), 1)

##############
##  PART 2  ##
##############

#### DATA WRANGLING: SUBSETTING VECTORS AND FACTORS ####

age <- c(15, 22, 45, 52, 73, 81)

age[5]

age[-5]

age[c(3, 5, 6)] ## nested

# OR

## create a vector first then select
idx <- c(3, 5, 6) # create vector of the elements of interest
age[idx]

age[1:4]

age[4:1]

alphabets <- c("C", "D", "X", "L", "F")
alphabets[c(1, 2, 5)]
alphabets[-3]
alphabets[5:1]

age > 50

age > 50 | age < 18

age

age[age > 50 | age < 18] ## nested

# OR

## create a vector first then select
idx <- age > 50 | age < 18
age[idx]


which(age > 50 | age < 18)

age[which(age > 50 | age < 18)] ## nested

# OR

## create a vector first then select
idx_num <- which(age > 50 | age < 18)
age[idx_num]

expression[expression == "high"] ## This will only return those elements in the factor equal to "high"

samplegroup[which(samplegroup != "KO")]

expression

str(expression)

expression <- factor(expression, levels = c("low", "medium", "high")) # you can re-factor a factor

str(expression)

str(samplegroup)

samplegroup <- factor(samplegroup, levels = c("KO", "CTL", "OE"))

str(samplegroup)

####  PACKAGES AND LIBRARIES  ####

sessionInfo() # Print version information about R, the OS and attached or loaded packages

# OR

search() # Gives a list of attached packages

install.packages("ggplot2")

library(ggplot2)

sessionInfo()

install.packages("tidyverse")

####  DATA WRANGLING: DATA FRAMES, MATRICES AND LISTS  ####

# Extract value 'Wt'
metadata[1, 1]

# Extract value '1'
metadata[1, 3]

# Extract third row
metadata[3, ]

# Extract third column
metadata[, 3]

# Extract third column as a data frame
metadata[, 3, drop = FALSE]

# Dataframe containing first two columns
metadata[, 1:2]

# Data frame containing first, third and sixth rows
metadata[c(1, 3, 6), ]

# Extract the celltype column for the first three samples
metadata[c("sample1", "sample2", "sample3"), "celltype"]

# Check column names of metadata data frame
colnames(metadata)

# Check row names of metadata data frame
rownames(metadata)

# Extract the genotype column
metadata$genotype

# Extract the first five values/elements of the genotype column
metadata$genotype[1:5]

metadata[c("sample2", "sample8"), c("genotype", "replicate")]

metadata$genotype[c(1, 9)]

metadata[, 3, drop = FALSE]

metadata$celltype == "typeA"

logical_idx <- metadata$celltype == "typeA"

metadata[logical_idx, ]

which(metadata$celltype == "typeA")

idx <- which(metadata$celltype == "typeA")

metadata[idx, ]

which(metadata$replicate > 1)

idx <- which(metadata$replicate > 1)

metadata[idx, ]

metadata[which(metadata$replicate > 1), ]

sub_meta <- metadata[which(metadata$replicate > 1), ]

metadata[which(metadata$genotype == "KO"), ]

list1[[2]]

comp2 <- list1[[2]]
class(comp2)

list1[[1]]

list1[[1]][1]

list1

random <- NULL

random

random <- list(c(metadata, age, list1, samplegroup, number))
random[[1]]

names(list1)

# Name components of the list
names(list1) <- c("species", "df", "number")

names(list1)

# Extract 'df' component
list1$df

names(random)

names(random) <- c("metadata")
names(random)

####  THE %IN% OPERATOR  ####

rpkm_data <- read.csv("data/counts.rpkm.txt")

head(rpkm_data)

ncol(rpkm_data)
nrow(metadata)

vector1 %in% vector2

A <- c(1, 3, 5, 7, 9, 11) # odd numbers
B <- c(2, 4, 6, 8, 10, 12) # even numbers

# test to see if each of the elements of A is in B
A %in% B

A <- c(1, 3, 5, 7, 9, 11) # odd numbers
B <- c(2, 4, 6, 8, 1, 5) # add some odd numbers in
# test to see if each of the elements of A is in B
A %in% B

intersection <- A %in% B
intersection

A[intersection]

any(A %in% B)

all(A %in% B)

any(B %in% A)

onlyB <- B %in% A
B[onlyB]

A <- c(10, 20, 30, 40, 50)
B <- c(50, 40, 30, 20, 10) # same numbers but backwards

# test to see if each element of A is in B
A %in% B

# test to see if each element of A is in the same position in B
A == B

# use all() to check if they are a perfect match
all(A == B)

x <- rownames(metadata)
y <- colnames(rpkm_data)

all(x %in% y)

all(rownames(metadata) %in% colnames(rpkm_data))

x == y
all(x == y)

important_genes <- c("ENSMUSG00000083700", "ENSMUSG00000080990", "ENSMUSG00000065619", "ENSMUSG00000047945", "ENSMUSG00000081010", "ENSMUSG00000030970")

important_genes %in% rownames(rpkm_data)

idx <- rownames(rpkm_data) %in% important_genes
ans <- rpkm_data[idx, ]
idx2 <- which(rownames(rpkm_data) %in% important_genes)
ans2 <- rpkm_data[idx2, ]

ans3 <- rpkm_data[important_genes, ]

####  REORDERING AND MATCHING  ####

teaching_team <- c("Jihe", "Mary", "Meeta", "Radhika")

# Extracting values from a vector
teaching_team[c(2, 4)]

teaching_team

# Extracting values and reordering them
teaching_team[c(4, 2)]

# Extracting all values and reordering them
teaching_team[c(4, 2, 1, 3)]

# Saving the results to a variable
reorder_teach <- teaching_team[c(4, 2, 1, 3)]

first <- c("A", "B", "C", "D", "E")
second <- c("B", "D", "E", "A", "C") # same letters but different order

match(first, second)

# Saving indices for how to reorder `second` to match `first`
reorder_idx <- match(first, second)

# Reordering the second vector to match the order of the first vector
second[reorder_idx]

# Reordering and saving the output to a variable
second_reordered <- second[reorder_idx]

first <- c("A", "B", "C", "D", "E")
second <- c("D", "B", "A") # remove values

match(first, second)

second[match(first, second)]

# Check row names of the metadata
rownames(metadata)

# Check the column names of the counts data
colnames(rpkm_data)

genomic_idx <- match(rownames(metadata), colnames(rpkm_data))
genomic_idx

# Reorder the counts data frame to have the sample names in the same order as the metadata data frame
rpkm_ordered <- rpkm_data[, genomic_idx]

# View the reordered counts
View(rpkm_ordered)

all(rownames(metadata) == colnames(rpkm_ordered))

first <- c("A", "B", "C", "D", "E")
second <- c("B", "D", "E", "A", "C")
second[c(4, 1, 5, 2, 3)]

subset_rpkm <- rpkm_ordered[, -c(2, 9)]

idx <- match(colnames(subset_rpkm), rownames(metadata))
metadata[idx, ]

mean(rpkm_ordered$sample1)

library(purrr) # Load the purrr

samplemeans <- map_dbl(rpkm_ordered, mean)

# Named vectors have a name assigned to each element instead of just referring to them as indices ([1], [2] and so on)
samplemeans

# Check length of the vector before adding it to the data frame
length(samplemeans)

# Create a numeric vector with ages. Note that there are 12 elements here
age_in_days <- c(40, 32, 38, 35, 41, 32, 34, 26, 28, 28, 30, 32)

# Add the new vector as the last column to the new_metadata dataframe
new_metadata <- data.frame(metadata, samplemeans, age_in_days)

# Take a look at the new_metadata object
View(new_metadata)


####  DAY 3 ACTIVITIES ####

animals <- read.csv("data/animals.txt")
row.names(animals)
class(animals)
length(row(animals))
length(col(animals))

animals$speed
animals$speed[40.0]
