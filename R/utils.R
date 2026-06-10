#' Parse Author Names for Bibliography Formatting
#'
#' Converts a string of author names into a shortened, comma-separated format
#' suitable for bibliography entries. Names are expected in "Last, First Middle"
#' format and separated by " and ". Individual authors are abbreviated to last
#' name plus initials, with author lists truncated to a maximum number.
#'
#' @param author_string A character string containing one or more author names
#'   separated by " and ". Each name should follow the "Last, First Middle" format.
#' @param max_authors Integer specifying the maximum number of authors to display
#'   before appending "et al.". Default is 3.
#'
#' @return A character string with formatted authors in "Last, FM" format,
#'   separated by commas and spaces. If the number of authors exceeds
#'   \code{max_authors}, the output includes only the first \code{max_authors}
#'   followed by "et al.".
#'
#' @examples
#' parse_authors("Smith, John and Doe, Jane and Brown, Robert")
#' parse_authors("Smith, John and Doe, Jane and Brown, Robert and Green, Alice",
#'               max_authors = 2)
#'
#' @export

parse_authors <- function(author_string, max_authors = 3) {
  # Split by " and " and trim whitespace
  authors <- stringr::str_split(author_string, " and ") |>
    unlist() |>
    stringr::str_trim()

  # Parse each name: "Last, First Middle" -> "Last, FM"
  authors <- purrr::map_chr(authors, function(name) {
    parts <- stringr::str_split(name, ",\\s+") |> unlist()
    last_name <- parts[1]
    initials <- stringr::str_c(
      stringr::str_sub(stringr::str_split(parts[2], "\\s+") |> unlist(), 1, 1),
      collapse = ""
    )
    stringr::str_c(last_name, ", ", initials)
  })

  # Limit to max_authors and add "et al." if needed
  if (length(authors) > max_authors) {
    authors <- c(authors[1:max_authors], "et al.")
  }

  stringr::str_c(authors, collapse = ", ")
}
