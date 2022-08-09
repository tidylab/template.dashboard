#' d13fluid UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom shiny fluidRow fluidPage
d13fluid_ui <- function(id){
    ns <- NS(id)
    # Helper Functions --------------------------------------------------------
    # plotOutput <- purrr::partial(shiny::plotOutput, height = "100%")
    box <- purrr::partial(bs4Dash::box, collapsible = FALSE)


    # Module Core -------------------------------------------------------------
    tabItem(
        tabName = id,
        fluidPage(
            fluidRow(
                box(plotOutput(ns("box_1")), title = "1st Box", width = 8),
                box(plotOutput(ns("box_2")), title = "2nd Box", width = 4)
            ),#upper fluidRow
            fluidRow(
                box(plotOutput(ns("box_3")), title = "3rd Box", width = 6),
                box(plotOutput(ns("box_4")), title = "4th Box", width = 2),
                box(plotOutput(ns("box_5")), title = "5th Box", width = 4)
            )#bottom fluidRow
        )#fluidPage
    )#tabItem
}


#' d13fill UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom shiny fillRow fillPage fillCol
d13fill_ui <- function(id){
    ns <- NS(id)

    # Helper Functions --------------------------------------------------------
    # plotOutput <- purrr::partial(shiny::plotOutput, height = "100%")
    box <- purrr::partial(bs4Dash::box, collapsible = FALSE, width = 12)


    # Module Core -------------------------------------------------------------
    tabItem(
        tabName = id,
        fillPage(
            fillRow(
                box(plotOutput(ns("box_1")), title = "1st Box"),
                box(plotOutput(ns("box_2")), title = "2nd Box"),
                flex = c(8, 4)
            ),#upper fillRow
            fillRow(
                box(plotOutput(ns("box_3")), title = "3rd Box"),
                box(plotOutput(ns("box_4")), title = "4th Box"),
                box(plotOutput(ns("box_5")), title = "5th Box"),
                flex = c(6, 2, 4)
            )#bottom fillRow
        )#fillPage
    )#dashboard_13
}


#' d13_Server Functions
#'
#' @noRd
d13_server <- function(id){
    moduleServer( id, function(input, output, session){
        ns <- session$ns


        # Module Core -------------------------------------------------------------
        output$box_1 <- renderPlot({ggplot2$placeholder()})
        output$box_2 <- renderPlot({ggplot2$placeholder()})
        output$box_3 <- renderPlot({ggplot2$placeholder()})
        output$box_4 <- renderPlot({ggplot2$placeholder()})
        output$box_5 <- renderPlot({ggplot2$placeholder()})
    })
}

