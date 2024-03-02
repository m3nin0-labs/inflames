#
# Copyright (C) 2024 Inflames Package.
#
# Inflames Package is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
#

#' @title Read 'Queimadas DB' file as SF object.
#'
#' @description
#' This function read data from 'Queimadas DB / INPE' as [sf::st_sf] object.
#'
#' @param ifile Path to Queimadas DB CSV file
#'
#' @return Raster with the BNDVI data.
#' @export
inflames_read <- function(ifile) {
  .as_sf(data.table::fread(ifile, sep = ","))
}
