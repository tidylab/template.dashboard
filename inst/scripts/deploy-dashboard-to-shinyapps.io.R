# Helpers -----------------------------------------------------------------
env_var_exists <- function(x) nchar(Sys.getenv(x))>0
load_app_config <- function() list2env(yaml::yaml.load_file(file.path(getOption("path_dashboard"), "config.yml"), eval.expr = TRUE), globalenv())

# Defensive Programming ---------------------------------------------------
stopifnot(env_var_exists("SHINY_NAME"), env_var_exists("SHINY_TOKEN"), env_var_exists("SHINY_SECRET"))

# Prepare Shiny -----------------------------------------------------------
repo_address <- paste0(tic::ci_get_slug(),"@", tic::ci_get_branch(), collapse = "")
options(path_dashboard = "./inst/dashboard")
load_app_config()
rsconnect::setAccountInfo(
    name = Sys.getenv("SHINY_NAME"),
    token = Sys.getenv("SHINY_TOKEN"),
    secret = Sys.getenv("SHINY_SECRET")
)
desc::description$new()$add_remotes(repo_address)$write()


# Deploy Shiny ------------------------------------------------------------
rsconnect::deployApp(
    appDir = getOption("path_dashboard"),
    appName = appName,
    appTitle = appTitle,
    forceUpdate = appForceUpdate
)

# Cleanup -----------------------------------------------------------------
desc::description$new()$del_remotes(repo_address)$write()
