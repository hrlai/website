#' Title
#'
#' @param doi
#' @param corresponding
#' @param file
#'
#' @returns
#'
#' @export
#' @examples add_publication("10.1111/ele.12414", corresponding = FALSE)

add_publication <- function(
  doi,
  corresponding = FALSE,
  file = "data/publications.yaml"
) {
  # download bibligraphy from DOI and then append corresponding
  # authorship status
  bib_new <-
    rcrossref::cr_cn(doi, format = "bibentry") |>
    purrr::list_merge(corresponding = corresponding)

  # read the publication metadata list if it exists
  existing <- if (file.exists(file)) {
    yaml::read_yaml(file)
  } else {
    list()
  }

  # combine the existing (if it does) and new bibliography into a single YAML
  write_yaml(c(existing, list(bib_new)), file)
}
