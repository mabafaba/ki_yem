# prepare workspace
rm(list=ls())
require("roxygen2")
require("devtools")
## the directory containing the repository folder
package_parent_directory<-"~"
setwd(package_parent_directory)
# repository folder should have the same name as the package and should
my_pkg_name<-"reachmm"
dir.exists(my_pkg_name) # <--- this should give TRUE / package folder should exist and be already a github repo



# setting up a new package
#################################




# create package skeleton:
# ATTENTION: this will open a new RStudio window set in your package project
# you can ignore that for now and continue this script
usethis::create_package("kiyem")
# this does:
# ??? Creating 'R/'
# all (and only) your package functions go here
# they should contain NO executed scripts except those making functions
# ??? Creating 'man/'
# all the documentation files go here. No need to touch this, auto created by roxygen2
# ??? Writing 'DESCRIPTION'
# this is preconfigured, but you have to declare all your external dependencies here
# ??? Writing 'NAMESPACE'
# this will be also automatically written by roxygen2; declaring all visible functions
# ??? Writing 'reachmm.Rproj'
# an R project file. I don't use rprojects so don't know about that but I'm sure they're useful.

## use 'testthat' package for automated testing:
usethis::use_testthat()
# this adds a standardised folder for testing scripts

# updating your package
#################################
# load local package
devtools::load_all("kiyem") # this is equivalent to installing and loading your local package version
# run all tests to make sure
test_check("kiyem")


test_file("./kiyem/tests/testthat/test.aggregate_weighted_numeric.R")


# recreate documentation & package namespace (empty for now:):
roxygenize(package.dir = "kiyem",clean=T)
# now just git add ., git push -m "package update"



# RUN THIS PART BUT DONT READ THE CODE IT IS NOT NEEDED.
#################################
# here I'll add an example script; I'm just doing this here to create a full working example
# in a single script
# run and ignore this part; it's written in one line so it's easier to ignore.
# you'll of course create your own package functions like a normal person
example_package_script<-"#' Example function\n#'\n#' example function summary description\n#'\n#'@param lama this function only accepts lamas as input\n#' @details the functions default behaviour and parameter details.\n#' @value return value of the function\n#' @example \\code{example()}\nexample_fun<-function(lama){\n  # thank god I'm a pure function otherwise this would be chaos\n  return('woah badass package you got there!')\n}";fileConn<-file(paste0(package_parent_directory,my_pkg_name,"./R/package_example_function.R",collapse="/"));writeLines(example_package_script, fileConn);close(fileConn);message("See ./YOURPACKSGE/R/example_functions.R for the script example.")
example_test_script   <-
  
  context("example function (all test files must start with a context, usually use a function (family) name)")
test_that("example_fun() only accepts lamas as input",{
  expect_error(example_fun("not a lama"))
  real_lama<-"LAHMAAHHH"
  class(real_lama)<-"lama"
  expect_success({example_fun(real_lama)})
})


# running your package from local:
#################################
devtools::load_all("kiyem")

?aggregate_numeric





# installing and running your package from remote (that's how other users would use it):
#################################
github_username<-"mygithubusername"
devtools::install_github(paste0(github_username,my_pkg_name,collapse = "/"))

















