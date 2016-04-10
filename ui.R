library(ggplot2)
library(plyr)
library(shiny)

# UI #
shinyUI(fluidPage(
   
   titlePanel("Comparison of Data For Supporting Substances Obatined for Two Teeth (Molar and Canine) "),
    
    sidebarLayout(
        sidebarPanel(
            h3("Supporting Substance with Canine Tooth:"),
            selectInput("Select", label=h3("Choose:"),
                        choices = lapply(unique(Names_2), unlist)),
            sliderInput("Slider1", label=h3("Y-Value comparison"),
                        min=0, max=1.8, value=1, step=0.01),
            width=3
        ),
        mainPanel(
            h2(textOutput("text")),
            plotOutput("view"),
            br(),
            h4("Description"),
            p(paste("In this study, an experimental method is described to identify and differentiate materials that act as constraints on a host structure, which defines the boundary conditions")),
            p("Data Source: 10.13140/RG.2.1.2953.0008")
        )
    )
))
