#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @importFrom shiny tagList
#' @import bs4Dash
#' @noRd
app_ui <- function(request) {
    tagList(
        # Leave this function for adding external resources
        golem_add_external_resources(),
        # Your application UI logic
        tagList(
            # Leave this function for adding external resources
            golem_add_external_resources(),
            # Your application UI logic
            dashboardPage(
                header = dashboardHeader(

                ), #dashboardHeader
                sidebar = dashboardSidebar(
                    sidebarMenu(
                        menuItem(
                            text = "Item 1"
                        ),
                        menuItem(
                            text = "Item 2"
                        )
                    )
                ), #dashboardSidebar
                body = dashboardBody(

                ), #dashboardBody
                controlbar = dashboardControlbar(
                    skinSelector(),
                    pinned = TRUE
                ),#dashboardControlbar
                title = "Skin Selector"
            )
        )
    )
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