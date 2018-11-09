context("aggregate_weighted_numeric")


test_that("aggregate_weighted_numeric works",{
  x<-c(1,1,2)
  names<-c("a","b","a")
  result<-data.frame(c(1.5,2),c("a","b"))
  expect_equal(aggregate_weighted_numeric(x,names),result)
  expect_error(aggregate_weighted_numeric(c(1,2,3),c("a")))
  expect_error(aggregate_weighted_numeric(NULL,c("a")))
  expect_error(aggregate_weighted_numeric(data.frame("a",1),c("a")))
})
