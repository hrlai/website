#' Add a publication to a YAML datastore
#'
#' Retrieve bibliographic metadata for a DOI and append it to a YAML file
#' of publications. The function fetches a bibentry via rcrossref, annotates
#' it with a logical `corresponding` field to indicate if one is the
#' corresponding author, and then writes the combined list to
#' disk (creating the file if it does not exist).
#'
#' @param doi Character. DOI of the publication (e.g. \"10.1111/ele.12414\").
#' @param corresponding Logical. Whether to mark the publication as being a
#'   corresponding author. Defaults to \code{FALSE}.
#' @param joint_first Logical. Whether to mark the publication as having joint
#'   first authorship. Defaults to \code{FALSE}.
#' @param file Character. Path to the YAML file used to store publications.
#'   If the file does not exist it will be created. Defaults to \"data/publications.yaml\".
#'
#' @return Invisibly \code{NULL}. This function is used for its side effect of
#'   updating the YAML file on disk.
#'
#' @export
#' @examples
#' box::use(R/add_publication[add_publication])
#' add_publication("10.1111/ele.12414")

add_publication <- function(
  doi,
  corresponding = FALSE,
  joint_first = FALSE,
  file = "data/publications.yaml"
) {
  # download bibligraphy from DOI and then append corresponding
  # and joint first authorship status
  bib_new <-
    rcrossref::cr_cn(doi, format = "bibentry") |>
    purrr::list_merge(corresponding = corresponding, joint_first = joint_first)

  # read the publication metadata list if it exists
  existing <- if (file.exists(file)) {
    yaml::read_yaml(file)
  } else {
    list()
  }

  # combine the existing (if it does) and new bibliography into a single YAML
  yaml::write_yaml(c(existing, list(bib_new)), file)
}
