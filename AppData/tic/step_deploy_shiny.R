DeployShiny <- R6::R6Class(
    "DeployShiny",
    inherit = TicStep,
    public = list(
        env_var_exists = function(x) nchar(Sys.getenv(x)) > 0,
        load_app_config = function() list2env(yaml::yaml.load_file(file.path(getOption("path_dashboard"), "config.yml"), eval.expr = TRUE), globalenv()),
        initialize = function(path_dashboard = "./inst/dashboard"){
            options(path_dashboard = path_dashboard)
            remotes::install_cran(c("rsconnect", "yaml"), quiet = TRUE)
        },
        run = function(){
            load_app_config <- self$load_app_config
            env_var_exists <- self$env_var_exists

            # Defensive Programming --------------------------------------------
            stopifnot(env_var_exists("SHINY_NAME"), env_var_exists("SHINY_TOKEN"), env_var_exists("SHINY_SECRET"))

            # Prepare Shiny ----------------------------------------------------
            repo_address <- paste0(tic::ci_get_slug(),"@", tic::ci_get_branch(), collapse = "")
            options(path_dashboard = "./inst/dashboard")
            load_app_config()
            rsconnect::setAccountInfo(
                name = Sys.getenv("SHINY_NAME"),
                token = Sys.getenv("SHINY_TOKEN"),
                secret = Sys.getenv("SHINY_SECRET")
            )
            desc::description$new()$add_remotes(repo_address)$write()

            # Deploy Shiny -----------------------------------------------------
            rsconnect::deployApp(
                appDir = getOption("path_dashboard"),
                appName = appName,
                appTitle = appTitle,
                forceUpdate = appForceUpdate
            )

            # Cleanup ----------------------------------------------------------
            desc::description$new()$del_remotes(repo_address)$write()
        }
    )
)

step_deploy_shiny <- function() {
    DeployShiny$new()
}


