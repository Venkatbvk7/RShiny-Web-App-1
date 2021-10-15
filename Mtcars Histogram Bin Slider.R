# Credit - Data Professor on YT

library(shiny) #attaching the shiny library
data(mtcars) # attaching the data

# Define UI for app that draws a histogram ----
#First Component of Shiny app UI definition
ui <- fluidPage(
  
  # App title ----
  titlePanel("Cars Horse Power"), # Adds the title for the web app
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(    # sidebar in the webapp
    
    # Sidebar panel for inputs ----      
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30,
                  step = 1) 
      # inputId gets the input based on the slider option chosen and sends it to the breaks option in hist
      #value is the default selection and step is the increment value
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

# Defining server logic required to draw a histogram ----
server <- function(input, output) {
  
  
  output$distPlot <- renderPlot({ # Creating object distPlot that produces the histogram output
    
    x    <- mtcars$hp # assigning the hp values from mtcars to x variable
    x    <- na.omit(x) # to remove any na values in the data
    bins <- seq(min(x), max(x), length.out = input$bins + 1) 
    # get the input value of bins from the slider value
    
    hist(x, breaks = bins, col = "blue", border = "#003366",
         xlab = "Horse Power", 
         main = "Histogram of Cars Horse Power") # hist creates the histogram plot
    
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)



