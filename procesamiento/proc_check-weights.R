if (!require("pacman")) install.packages("pacman") # instalar pacman
pacman::p_load(dplyr,       # Manipulacion de datos 
               haven,       # importar datos en .dta o .sav
               sjmisc,      # descriptivos y frecuencias
               sjPlot,      # tablas, plots y descriptivos
               sjlabelled,
               summarytools,# resumen de dataframe
               knitr,       # tablas kable
               kableExtra,  # tablas kable personalizadas
               ggplot2,     # plots
               corrplot,    # plot correlacion
               survey,
               WeightIt
)


# check ponderadores ola 1 ------------------------------------------------
load(file = here::here("output/data_01.RData"))

data_w01[data_w01==-99] <- NA
df_w01 <- 
data_w01 %>% 
  select(cs_genero,cs_educ,cs_edad,weight_w01,weight_na0_w01) %>% 
  na.omit()

dim(df_w01)

sjmisc::frq(df_w01$cs_genero)
sjmisc::frq(df_w01$cs_genero,weights = df_w01$weight_w01)
sjmisc::frq(df_w01$cs_genero,weights = df_w01$weight_na0_w01)

sjmisc::frq(df_w01$cs_educ)
sjmisc::frq(df_w01$cs_educ,weights = df_w01$weight_w01)
sjmisc::frq(df_w01$cs_educ,weights = df_w01$weight_na0_w01)

sjmisc::frq(df_w01$cs_edad)
sjmisc::frq(df_w01$cs_edad,weights = df_w01$weight_w01)
sjmisc::frq(df_w01$cs_edad,weights = df_w01$weight_na0_w01)


# check ponderadores ola 2 ------------------------------------------------
load(file = here::here("output/data_02.RData"))

data_w02[data_w02==-99] <- NA
df_w02 <- 
  data_w02 %>% 
  select(cs_genero,cs_educ,cs_edad,weight_w02,weight_na0_w02) %>% 
  na.omit()

dim(df_w02)

sjmisc::frq(df_w02$cs_genero)
sjmisc::frq(df_w02$cs_genero,weights = df_w02$weight_w02)
sjmisc::frq(df_w02$cs_genero,weights = df_w02$weight_na0_w02)

sjmisc::frq(df_w02$cs_educ)
sjmisc::frq(df_w02$cs_educ,weights = df_w02$weight_w02)
sjmisc::frq(df_w02$cs_educ,weights = df_w02$weight_na0_w02)

sjmisc::frq(df_w02$cs_edad)
sjmisc::frq(df_w02$cs_edad,weights = df_w02$weight_w02)
sjmisc::frq(df_w02$cs_edad,weights = df_w02$weight_na0_w02)


# check ponderadores ola 1 ------------------------------------------------
load(file = here::here("output/data_03.RData"))

data_w03[data_w03==-99] <- NA
df_w03 <- 
  data_w03 %>% 
  select(cs_genero,cs_educ,cs_edad,weight_w03,weight_na0_w03) %>% 
  na.omit()

dim(df_w03)

sjmisc::frq(df_w03$cs_genero)
sjmisc::frq(df_w03$cs_genero,weights = df_w03$weight_w03)
sjmisc::frq(df_w03$cs_genero,weights = df_w03$weight_na0_w03)

sjmisc::frq(df_w03$cs_educ)
sjmisc::frq(df_w03$cs_educ,weights = df_w03$weight_w03)
sjmisc::frq(df_w03$cs_educ,weights = df_w03$weight_na0_w03)

sjmisc::frq(df_w03$cs_edad)
sjmisc::frq(df_w03$cs_edad,weights = df_w03$weight_w03)
sjmisc::frq(df_w03$cs_edad,weights = df_w03$weight_na0_w03)


