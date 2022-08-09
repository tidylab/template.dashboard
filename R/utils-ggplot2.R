#' @title ggplot2 Utilities Functions
#' @export
#' @examples
#' ls(ggplot2)
ggplot2 <- new.env()

ggplot2$placeholder <- function() { return(
    data.frame(x = 0:1, y = 0:1)
    |> ggplot2::ggplot(ggplot2::aes(x, y))
    + ggplot2::geom_text(x = 0.5, y = 0.5, label = "Image Place Holder", colour = "black")
    + ggplot2::theme_void()
    + ggplot2::theme(
        # makes background transparent:
        plot.background = ggplot2::element_rect(fill = "transparent",colour = NA),
        # gets rid of white border around plot:
        panel.border = ggplot2::element_blank()
    )
) }
