#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#'
#' @family golem
#' @noRd
app_server <- function(input, output, session) {
    # Your application server logic
    # d13fill_server(id = "d13")
    d13fluid_server(id = "d13")
}
