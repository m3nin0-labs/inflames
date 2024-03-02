#
# Copyright (C) 2024 Inflames Package.
#
# Inflames Package is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
#

#' @noRd
#' @title Create example data.
#'
#' @description Create example data in a temp directory.
#'
local_create_example_data <- function() {
  file_content <- "
  id_bdq,foco_id,lat,lon,data_pas,pais,estado,municipio,bioma
   12740425 ,600c4caf-5abb-11e8-911c-28924ad12c5c,   -8.823000 ,  -77.944000 ,2003-09-15 18:28:00,Peru,Ancash,Huaylas,
   12300305 ,5fe7c8b9-5abb-11e8-911c-28924ad12c5c,   -7.797000 ,  -75.313000 ,2003-09-02 18:59:00,Peru,Loreto,Ucayali,
   12234819 ,5fe177a7-5abb-11e8-911c-28924ad12c5c,   -6.545000 ,  -75.197000 ,2003-08-31 19:11:00,Peru,Loreto,Ucayali,
  "

  file_path <- tempfile()

  write(file_content, file = file_path)

  withr::defer_parent(unlink(file_path))
  file_path
}
