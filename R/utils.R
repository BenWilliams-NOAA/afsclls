
#' Connect
#'
#'
#' @export
#'
#' @examples
#' \dontrun{
#' db <- connect()
#' }
connect <- function() {
  odbc::dbConnect(odbc::odbc(),
                  Driver = "SQL Server",
                  Server = "161.55.120.71,1919",
                  Database = "LONGLINE",
                  Trusted_Connection = "Yes")
}

#' Disconnect
#'
#' @param db
#'
#' @export
#'
#' @examples
#' \dontrun{
#' disconnect(db)
#' }
disconnect <- function(db) {
  odbc::dbDisconnect(db)
}

