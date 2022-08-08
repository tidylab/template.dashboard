#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @importFrom shiny tagList plotOutput
#' @importFrom shiny fillRow fillPage fillCol
#' @import bs4Dash
#' @noRd
app_ui <- function(request) {
    default_box <- purrr::partial(box, width = 12)
    # plotOutput <- purrr::partial(shiny::plotOutput, height = "100%")

    # Your application UI logic
    tagList(
        # Leave this function for adding external resources
        golem_add_external_resources(),
        # Your application UI logic
        dashboardPage(
            header = dashboardHeader(
                title = "template.dashboard"
            ), #dashboardHeader
            sidebar = dashboardSidebar(
                sidebarMenu(
                    menuItem(
                        text = "Dashboard 13",
                        tabName = "dashboard_13"
                    )#menuItem
                ),#sidebarMenu
                minified = FALSE
            ), #dashboardSidebar
            body = dashboardBody(
                tabItems(
                    tabItem(
                        tabName = "dashboard_13",
                        fillPage(
                            fillRow(
                                default_box(plotOutput("null_ggplot_1"), title = "1st Box"),
                                default_box(plotOutput("null_ggplot_2"), title = "2nd Box"),
                                flex = c(8, 4)
                            ),#upper fillRow
                            fillRow(
                                default_box(plotOutput("null_ggplot_3"), title = "3rd Box"),
                                default_box(plotOutput("null_ggplot_4"), title = "4th Box"),
                                default_box(plotOutput("null_ggplot_5"), title = "5th Box"),
                                flex = c(6, 2, 4)
                            )#bottom fillRow
                        )#fillPage
                    )#Dashboard 13
                )#tabItems
            ), #dashboardBody
            title = "Skin Selector"
        )#dashboardPage
    )#tagList
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @importFrom shiny tags
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
    add_resource_path(
        "www",
        app_sys("app/www")
    )

    tags$head(
        favicon(),
        bundle_resources(
            path = app_sys("app/www"),
            app_title = "template.dashboard"
        )
        # Add here other external resources
        # for example, you can add shinyalert::useShinyalert()
    )
}
