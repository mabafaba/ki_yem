
#' aggregate numeric vector to the mean
#'
#' aggregates numeric vectors with the appropriate method
#'
#' @param x vector to aggregate
#' @param aggregate.to vector of group names to which to aggregate
#' @details bla
#' @value data frame with aggregated values and group names
aggregate_weighted_numeric <- function(x,aggregate.to) {
  if(length(x)!=length(aggregate.to)){stop("x and aggregate.to must have the same lenght")}
x %>% split(aggregate.to) %>% sapply(mean)

}







