###
###
###
###   Purpose:   Document tools
###   started:   2016/02/03 (pvr)
###
### ################################### ###

cleanup_vignettes <- function(pkg = ".", psPattern = "pdf$"){
  ### # check that vignettes directory  is called "vignettes", o/w do nothing
  pkg <- devtools::as.package(pkg)
  vigns <- tools::pkgVignettes(dir = pkg$path)
  if (basename(vigns$dir) != "vignettes")
    return()
  ### # files to be cleaned up
  for (p in psPattern) {
    files_to_remove <- list.files(path = vigns$dir, pattern = psPattern, full.names = TRUE)
    message("Removing files: ", paste(basename(files_to_remove), collapse = ", "))
    file.remove(files_to_remove)
  }
  invisible(TRUE)
}
