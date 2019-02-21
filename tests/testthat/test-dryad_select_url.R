context("dryad_select_url")

test_that("dryad_select_url in non-interactive session outputs the 1st url", {
  scbi_functional_ecology_2015 <- '10.5061/dryad.6nc8c'
  first_url <- rdryad::dryad_files(scbi_functional_ecology_2015)[[1]]
  out <- dryad_select_url(rdryad::dryad_files(scbi_functional_ecology_2015))
  expect_equal(out, first_url)
})

context("dryad_list_csv")

test_that("dryad_list_csv in non-interactive session outputs the 1st .csv", {
  scbi_functional_ecology_2015 <- '10.5061/dryad.6nc8c'
  first_url <- rdryad::dryad_files(scbi_functional_ecology_2015)[[1]]
  first_csv <- readr::read_csv(first_url)
  out <- dryad_list_csv(scbi_functional_ecology_2015)[[1]]
  expect_equal(out, first_csv)
})
