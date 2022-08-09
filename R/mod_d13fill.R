#' d13fill UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
d13fill_ui <- function(id){
    ns <- NS(id)

    # Helper Functions --------------------------------------------------------
    default_box <- purrr::partial(box, width = 12)
    # plotOutput <- purrr::partial(shiny::plotOutput, height = "100%")


    # Module Core -------------------------------------------------------------
    tabItem(
        tabName = "dashboard_13",
        fillPage(
            fillRow(
                default_box(plotOutput(ns("null_ggplot_1")), title = "1st Box"),
                default_box(plotOutput(ns("null_ggplot_2")), title = "2nd Box"),
                flex = c(8, 4)
            ),#upper fillRow
            fillRow(
                default_box(plotOutput(ns("null_ggplot_3")), title = "3rd Box"),
                default_box(plotOutput(ns("null_ggplot_4")), title = "4th Box"),
                default_box(plotOutput(ns("null_ggplot_5")), title = "5th Box"),
                flex = c(6, 2, 4)
            )#bottom fillRow
        )#fillPage
    )#dashboard_13
}

#' d13fill Server Functions
#'
#' @noRd
d13fill_server <- function(id){
    moduleServer( id, function(input, output, session){
        ns <- session$ns


        # Helpers -----------------------------------------------------------------
        invisible(
            null_ggplot <- data.frame(x = 0:1, y = 0:1)
            |> ggplot2::ggplot(ggplot2::aes(x, y))
            + ggplot2::geom_text(x = 0.5, y = 0.5, label = "Image Place Holder", colour = "black")
            + ggplot2::theme_void()
        )


        # Module Core -------------------------------------------------------------
        output$null_ggplot_1 <- output$null_ggplot_2 <- renderPlot({null_ggplot})
        output$null_ggplot_3 <- output$null_ggplot_4 <- output$null_ggplot_5 <- renderPlot({null_ggplot})
    })
}

