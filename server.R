# set up work
library(ggplot2)
library(plyr)
library(shiny)
#rm(list=ls(all=TRUE))
# Reading Data
Main_path="C:/Users/Tinoco/Google Drive/2. Research (Current)/(2015) Courses/(2015) Especialization in Data Science_/9. Developed data products/Developing-Data-Products-master/proyecto/Data_Base_1_DZDW.csv"
Data <- read.csv(Main_path, stringsAsFactors = FALSE)
# Reading Data
Main_path="C:/Users/Tinoco/Google Drive/2. Research (Current)/(2015) Courses/(2015) Especialization in Data Science_/9. Developed data products/Developing-Data-Products-master/proyecto/Data_Base_1_DZDW.csv"
Data <- read.csv(Main_path, stringsAsFactors = FALSE)
Names_0=names(Data)
Names_2=Names_0[c(2,4,6,8)]
Molar_Substances=Names_0[c(1,3,5,7)]
Data_Molar=data.frame(Data$Transparent.Silicone.Molar,Data$White.Gypsum.Molar,Data$Green.Gypsum.Molar,Data$Acrylic.Molar)
Varx=c(1:100);
XX=c(Varx,Varx,Varx,Varx)
var1=Data_Molar[,1]
var2=Data_Molar[,2]
var3=Data_Molar[,3]
var4=Data_Molar[,4]
Variable_yy=Data[,4]

datos_1<- data.frame(values = c(var1,var2,var3,var4),
                     type = gl(n = 4, k =100))
datos_1=as.data.frame(datos_1)

datos_2 <-data.frame(values = c(Variable_yy),
                     type = gl(n = 1, k =100))
datos_2=as.data.frame(datos_2)
###############################################

shinyServer(function(input,output) {

  ##################################################

    
     Substance <- reactive({
        input$Select })
  
     
   Yvalue <- reactive({
        input$Slider1
    })
    
  
    output$text <- renderText({
       paste(Substance(), "vs Molar Substances")
      })
    
    output$view <- renderPlot({
  
    ggplot(data = datos_1, aes(x=c(1:100,1:100,1:100,1:100),y=datos_1$values, group = type)) +
      geom_line(aes(fill = type, color=type), size=.4)+
      geom_hline(yintercept=Yvalue(),color='red')+
      geom_area(data=datos_2,aes(x=c(1:100),y=datos_2$values),alpha = 0.15,color='black')
    })
      
      
    })
