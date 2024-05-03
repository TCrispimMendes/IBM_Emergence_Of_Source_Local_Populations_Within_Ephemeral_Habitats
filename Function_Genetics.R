x <- function(x)

{   
  library(dplyr)
  library(tidyr)
  library(adegenet)
  library(hierfstat)
  library(Demerelate)
  
 
  # create genid data
  df.genes.genid <- x %>% separate(genes, c("1","2","3","4","5","6","7","8","9"))
  
  genid.genes <- df2genind(df.genes.genid, ploidy = 2, ncode = 3)
  
  genid.genes.summary <- summary(genid.genes)
  
  
  # create hierfstat data
  hierfstat.genes <- genind2hierfstat(genid.genes, pop = 1)
  
  basicstat <- basic.stats(hierfstat.genes, diploid = T, digits = 3)
  
  basicstat.overall <- as.data.frame(t(basicstat[["overall"]]))
  
  
  # create Demerelate data
  df.genes.demerelate <- df.genes.genid %>% 
    separate("1" , c("1.a","1.b"),sep=3) %>%
    separate("2" , c("2.a","2.b"),sep=3) %>%
    separate("3" , c("3.a","3.b"),sep=3) %>%
    separate("4" , c("4.a","4.b"),sep=3) %>%
    separate("5" , c("5.a","5.b"),sep=3) %>%
    separate("6" , c("6.a","6.b"),sep=3) %>%
    separate("7" , c("7.a","7.b"),sep=3) %>%
    separate("8" , c("8.a","8.b"),sep=3) %>%
    separate("9" , c("9.a","9.b"),sep=3) 
  
  ID <- seq(1:length(x$genes))
  Population <- rep(1,length(x$genes))
  
  related.data<- cbind(ID, Population, df.genes.demerelate)
  
  empcalc <- Emp.calc(related.data, value = "wang.fin")
  
  # calculate outputs
  n.alleles <- mean(genid.genes.summary$loc.n.all)
  
  HO <- basicstat.overall$Ho
  
  HE <- mean(genid.genes.summary$Hexp)
  
  Fis <- basicstat.overall$Fis
  
  relatedness <- mean(empcalc)
  
  newList <- list("n.alleles" = n.alleles, "HO" = HO, "HE" = HE, "Fis" = Fis, "relatedness" = relatedness)
  return(newList)
} 







