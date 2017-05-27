#-------- Ex for ggplot


require(ggplot2)
require(dplyr)


#--- SCATTERPLOT

# Basic
ggplot(data = iris, aes(x=Sepal.Length, y=Sepal.Width)) +
  geom_point()

# Plus Color
ggplot(data = iris, aes(x=Sepal.Length, y=Sepal.Width)) +
  geom_point(aes(col=Species))  

# Plus Size
ggplot(data = iris, aes(x=Sepal.Length, y=Sepal.Width)) +
  geom_point(aes(col=Species, size = Petal.Length)) 

# Stat
ggplot(data = iris, aes(x=Sepal.Length, y=Sepal.Width, col=Species)) +
  geom_point()  +
  stat_ellipse()



#--- HISTOGRAM

# Basic
ggplot(data = iris, aes(x=Sepal.Length)) +
  geom_histogram(binwidth = 0.3)

# Faceting
ggplot(data = iris, aes(x=Sepal.Length)) +
  geom_histogram(binwidth = 0.3) +
  facet_grid(.~Species)



#--- OVERLAPPING LAYERS

# Basic v2
ggplot() +
  geom_histogram(data = iris, aes(x=Sepal.Length), binwidth = 0.3)

# Two histograms
ggplot() +
  geom_histogram(data = iris, aes(x=Sepal.Length), binwidth = 0.3) +
  geom_histogram(data = iris %>% filter(Species == "setosa"), aes(x=Sepal.Length), fill = "#F8766D",
                 binwidth = 0.3) +
  labs(title = "Sepal length distribution: Setosa vs all")

ggplot() +
  geom_histogram(data = iris, aes(x=Sepal.Length), binwidth = 0.3) +
  geom_histogram(data = iris %>% filter(Species == "versicolor"), aes(x=Sepal.Length), fill = "#A3A500",
                 binwidth = 0.3) +
  labs(title = "Sepal length distribution: Versicolor vs all")



#--- PROGRAMMING WITH GGPLOT2

# Meh
iris_hist <- function(xvar){
  ggplot(data = iris, aes(x=xvar)) +
    geom_histogram(binwidth = 0.3)  
}

iris_hist(Sepal.Length) 


# OK! Standard Evaluation version
iris_hist <- function(xvar){
  ggplot(data = iris, aes_string(x=xvar)) +
    geom_histogram(binwidth = 0.3)  
}

iris_hist("Sepal.Length")
iris_hist("Sepal.Width")