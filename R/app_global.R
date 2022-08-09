#' global.R
#'
#' @return
#' @export
#'
#' @family golem
global <- function(){
    # Server ------------------------------------------------------------------
    invisible(
        null_ggplot <<- data.frame(x = 0:1, y = 0:1)
        |> ggplot2::ggplot(ggplot2::aes(x, y))
        + ggplot2::geom_text(x = 0.5, y = 0.5, label = "Image Place Holder", colour = "black")
        + ggplot2::theme_void()
    )


    # UI ----------------------------------------------------------------------
    box <<- purrr::partial(bs4Dash::box, collapsible = FALSE)
}
