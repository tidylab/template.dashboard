# Helpers -----------------------------------------------------------------
env_var_exists <- function(x) nchar(Sys.getenv(x))>0
load_app_config <- function() list2env(yaml::yaml.load_file(file.path(getOption("path_dashboard"), "config.yml"), eval.expr = TRUE), globalenv())

# Defensive Programming ---------------------------------------------------
stopifnot(env_var_exists("SHINY_NAME"), env_var_exists("SHINY_TOKEN"), env_var_exists("SHINY_SECRET"))

# Prepare Shiny -----------------------------------------------------------
options(path_dashboard = "./inst/dashboard")
load_app_config()
rsconnect::setAccountInfo(
    name = Sys.getenv("SHINY_NAME"),
    token = Sys.getenv("SHINY_TOKEN"),
    secret = Sys.getenv("SHINY_SECRET")
)

# Deploy Shiny ------------------------------------------------------------
rsconnect::deployApp(
    appDir = getOption("path_dashboard"),
    appName = appName,
    appTitle = appTitle,
    forceUpdate = appForceUpdate
)


