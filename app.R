##creating a dashboard

##install dashboard package
##install.packages("shinydashboard")
library(shinydashboard)
library(shiny)
library(ggplot2)
library(dplyr)
library(DT)
library(tidyr)
table <- read.csv("shinytable.csv")


##dashboard objects

header <- dashboardHeader(title = "Do Old Dogs Need New Tricks?")

##all the dynamic input stuff goes here
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Input Selections", icon = icon("th"), tabName = "Selections"),
    selectInput(
      inputId = "item", "Characteristic", 
      choices = unique(table$item)
    )
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "dashboard",
            h2("Reactive Output"),
            h4(dataTableOutput(
                outputId = "mytable")),
              plotOutput(
                outputId = "myplot", height = "500px", width="500px"))
  )
)



##dashboard Page
ui <- dashboardPage(
  dashboardHeader(title = "Simple tabs"),
  sidebar, 
  body
  )

server <- function(input, output) {
  
  filtered_data1 <- reactive({subset(table, select = -c(Linear, Quadratic, Difference,Edwards, EH, AA, A, BA, EL)) %>% filter(item == input$item)})
  gather <- gather(table, "level", "mean", EH:EL)
  filtered_data <- reactive({gather %>% filter(item == input$item)})
  
  
  
  output$myplot <- renderPlot({
    
    filtered_data() %>%
      ggplot(aes(x=level, y=mean)) + 
      geom_point() +
      scale_x_discrete(limits=c("EH", "AA", "A", "BA","EL")) +
      coord_cartesian(ylim=c(0.00,5.00)) +
      scale_colour_continuous() + theme_light() +
      theme(axis.text.x = element_text(angle=60, hjust=1))
    
    
  })
  
  output$mytable <- renderDataTable({datatable(filtered_data1(), selection="single", rownames = F)
  })
  
}

shinyApp(ui, server)

