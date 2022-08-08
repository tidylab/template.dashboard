#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @noRd
app_server <- function(input, output, session) {
    invisible(
        null_ggplot <- data.frame(x = 0:1, y = 0:1)
        |> ggplot2::ggplot(ggplot2::aes(x, y))
        + ggplot2::geom_text(x = 0.5, y = 0.5, label = "Image Place Holder", colour = "black")
        + ggplot2::theme_void()
    )


    # Your application server logic
    output$null_ggplot_1 <- output$null_ggplot_2 <- renderPlot({null_ggplot})
    output$null_ggplot_3 <- output$null_ggplot_4 <- output$null_ggplot_5 <- renderPlot({null_ggplot})

}
