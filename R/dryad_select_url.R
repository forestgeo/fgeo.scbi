#' Read files stored in dryad or find their download URLs.
#'
#' @param doi A character string giving a valid dryad doi, such as
#'   "'10.5061/dryad.6nc8c'".
#' @param dryad_url A character string. The output of `rdryad::dryad_files()`.
#' @inheritParams fs::dir_ls
#' @inheritParams base::grep
#'
#' @return When run interactively, both functions ask you to select files.
#'   * `dryad_list_csv()` outputs a list with the selected files.
#'   * `dryad_select_url()` outputs a character string giving the download
#'     URLs of the selected files.
#'
#' @export
#'
#' @examples
#' scbi_functional_ecology_2015 <- '10.5061/dryad.6nc8c'
#'
#' # Help find a relevant url
#' dryad_select_url(
#'   rdryad::dryad_files(scbi_functional_ecology_2015)
#' )
#'
#' # Shortcut to download and read multiple .csv files at once
#' dryad_list_csv(scbi_functional_ecology_2015)
dryad_list_csv <- function(doi,
                           regexp = "[.]csv$",
                           invert = FALSE,
                           ignore.case = TRUE) {
  urls <- dryad_select_url(
    rdryad::dryad_files(doi),
    regexp = regexp,
    invert = invert,
    ignore.case = ignore.case
  )
  out <- purrr::map(urls, readr::read_csv)
  purrr::set_names(out, dryad_file_name(urls))
}

#' @export
#' @rdname dryad_list_csv
dryad_select_url <- function(dryad_url,
                             regexp = NULL,
                             invert = FALSE,
                             ignore.case = TRUE) {
  files <- dryad_file_name(dryad_url)
  if (is.null(regexp)) {
    pick <- seq_along(dryad_url)
  } else {
    pick <- grep(regexp, files, ignore.case = ignore.case, invert = invert)
  }

  if (!interactive()) {
    message("Selecting only one file. To select more run interactively.")
    return(dryad_url[pick][[1]])
  }

  selected <- utils::select.list(
    files[pick],
    multiple = TRUE,
    title = "Which files do you want?"
  )
  dryad_url[files %in% selected]
}

dryad_file_name <- function(dryad_url) {
  sub("\\?.*$", "", fs::path_file(dryad_url))
}
