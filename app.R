# Petite Greta 2021 karácsonyi nyereményjáték sorsolás

library(shiny)
library(emojifont)
library(stringr)

jatekosok <- sort(unique(c("Zsófia Lilla Jakab", "Judit Máramarosi", "Linkáné Molnár Evelin", "Budinkity Bernadett", "Árpád Pásztor", "Bényi Erika", "Kata Tatár-Györe", "Kata Zsófia Németh", "Judit Pálmai", "Júlia Karáné Aranyi", "Kisné Túri Andrea", "Boglárka Balya", "Szilvia Pintér", "Oláhné Pfaff Rita", "Biró Andrea", "Gabriella Farkas", "Dalma Piroska Dalos", "Ildikó Fejér", "Nikcsy Mihálik", "Eszter Németh", "Ágnes Czibere", "Adrienn Olaszka", "Nyitrai-Ipolyi Alexandra", "Dorottya Kövesdi", "Viktória Vasadi", "Izabella Kis-Pál", "Virgínia Jóka", "Kováts-Lavati Kinga", "Lilla Kövesdi")))

ido <- Sys.time()

ui <- fluidPage(

  titlePanel(h1("2021. December 12. Nyereményjáték sorsolás", align = "center")),
  div(img(src = "pglogo.jpg", height="10%", width="10%"), style="text-align: center;"),

  br(),
  br(),

  # Sidebar with inputs for the random number generator
  sidebarLayout(
    sidebarPanel(
       width = 0
    ),

    # Show a table of random numbers
    mainPanel(
      column(2,
             p(jatekosok[1]),
             p(jatekosok[2]),
             p(jatekosok[3]),
             p(jatekosok[4]),
             p(jatekosok[5]),
             p(jatekosok[6]),
             p(jatekosok[7]),
             p(jatekosok[8]),
             p(jatekosok[9]),
             p(jatekosok[10]),
             p(jatekosok[11]),
             p(jatekosok[12]),
             p(jatekosok[13]),
             p(jatekosok[14]),
             p(jatekosok[15])
      ),
      column(2,
             p(jatekosok[16]),
             p(jatekosok[17]),
             p(jatekosok[18]),
             p(jatekosok[19]),
             p(jatekosok[20]),
             p(jatekosok[21]),
             p(jatekosok[22]),
             p(jatekosok[23]),
             p(jatekosok[24]),
             p(jatekosok[25]),
             p(jatekosok[26]),
             p(jatekosok[27]),
             p(jatekosok[28]),
             p(jatekosok[29])),
      br(),
      br(),
      br(),



      h1(emoji("sparkles"), emoji("christmas_tree"), emoji("sparkles"), align = "center"),
      br(),
      br(),
      h1(textOutput("do"), align = "center"),
      br(),
      br(),
      h1(emoji("sparkles"), emoji("christmas_tree"), emoji("sparkles"), align = "center"),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      actionButton("do", "Sorsolás!"), align = "center"


    )
  )
)


server <- function(input, output) {

  # set.seed hogy megismetelheto legyen a sorsolas eredmenye fuggetlenul is (ellenorzes miatt fontos)
  set.seed(123)

  randomVals <- eventReactive(input$do, {
    str_c(sample(jatekosok, 1), ", gratulálunk!")
  })

  output$do <- renderText({
    randomVals()
  })
}


shinyApp(ui = ui, server = server)
