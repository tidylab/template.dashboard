# Helpers -----------------------------------------------------------------
load_app_config <- function() list2env(yaml::yaml.load_file(file.path(getOption("path_dashboard"), "config.yml"), eval.expr = TRUE), globalenv())
create_dir <- function(x){unlink(x, recursive = TRUE, force = TRUE); dir.create(x)}

# Setup -------------------------------------------------------------------
dashboard_source <- getOption("dashboard_source")
dashboard_target <- getOption("dashboard_target")
options(path_dashboard = dashboard_target)
create_dir(dashboard_target)
fs::dir_copy(dashboard_source, dirname(dashboard_target))

pacakge_source <- "."
package_target <- file.path(dashboard_target, "package")
fs::dir_copy(pacakge_source, package_target)

# Prepare Shiny -----------------------------------------------------------
load_app_config()

# Run Shiny ---------------------------------------------------------------
shiny::runApp(appDir = dashboard_target)
