library(shinythemes)
library(shiny)

ui<-fluidPage(theme=shinytheme("superhero"),
  titlePanel("Zadanie 5"),
  sidebarLayout(
    sidebarPanel(
      textInput("mojTekst", "Wpisz tekst poniżej:"),
      numericInput("mojaLiczba", "Wybierz numer od 0 do 100:",
                   value=50, min=0, max=100, step=1),
      selectInput("mojaLitera", "Wybierz literę od A do K",
                  choices=LETTERS[1:11])
      
    ),
    mainPanel(h3(
      "Poniżej wpisany tekst numer i litera"),
      code(textOutput("wyjściowyTekst")),
      strong(textOutput("wyjściowyNumer")),
      em(textOutput("wyjściowaLitera"))
    )
  )
)
server<-function(input,output){
  output$wyjściowyTekst<-renderText(paste("Wybrany tekst:", input$mojTekst))
  output$wyjściowyNumer<-renderText(paste("Wybrany numer:", input$mojaLiczba))
  output$wyjściowaLitera<-renderText(paste("Wybrana litera:", input$mojaLitera))
}
shinyApp(ui,server)