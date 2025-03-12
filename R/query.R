
#' Query catch data
#'
#' @param year year(s) of interest
#' @param db database connection
#'
#' @returns data.frame of catches and vessel info - unfiltered
#' @export
#'
#' @examples
#' \dontrun{
#' catch_data <- q_catch(2022, db)
#' }
q_catch <- function(year, db) {
  yr = year
  dplyr::tbl(db, dbplyr::in_schema("dbo", "catches_view")) %>%
    dplyr::rename_with(tolower) %>%
    dplyr::filter(year %in% yr) %>%
    dplyr::left_join(dplyr::tbl(db, dbplyr::in_schema("dbo", "vessels")) %>%
                       dplyr::rename_with(tolower)) %>%
    dplyr::collect()
}


#' Query length data
#'
#' @param year year(s) of interest
#' @param db database connection
#'
#' @returns data.frame of lengths and species catch codes
#' @export
#'
#' @examples
#' \dontrun{
#' length_data <- q_length(2022, db)
#' }
q_lengths <- function(year, db) {
  yr = year
  dplyr::tbl(db, dbplyr::in_schema("dbo", "lengths_view")) %>%
    dplyr::rename_with(tolower) %>%
    dplyr::filter(year %in% yr) %>%
    dplyr::left_join(dplyr::tbl(db, dbplyr::in_schema("dbo", "specie_catch_codes")) %>%
                       dplyr::rename_with(tolower)) %>%
    dplyr::collect()
}

#' Query strata data
#'
#' @param db database connection
#'
#' @returns data.frame of area_stratum, areas, and depth_stratum
#' @export
#'
#' @examples
#' \dontrun{
#' strata_data <- q_strata(db)
#' }
q_strata <- function(db) {

  dplyr::tbl(db, dbplyr::in_schema("dbo", "area_stratum")) %>%
    dplyr::rename_with(tolower) %>%
    dplyr::left_join(dplyr::tbl(db, dbplyr::in_schema("dbo", "areas")) %>%
                       dplyr::rename_with(tolower)) %>%
    dplyr::left_join(dplyr::tbl(db, dbplyr::in_schema("dbo", "depth_stratum")) %>%
                       dplyr::rename_with(tolower)) %>%
    dplyr::collect()
}


