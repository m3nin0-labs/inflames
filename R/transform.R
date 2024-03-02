#
# Copyright (C) 2024 Inflames Package.
#
# Inflames Package is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
#

#' @noRd
#' @title Firespots data as SF
#' @description
#' This function transforms raw firesposts data into a [sf::st_sf] object.
#'
#' @returns [sf::st_sf] object.
#'
.as_sf <- function(raw_data) {
  id = lon = lat = data_pas = id_bdq = pais =
    estado = municipio = bioma = foco_id = NULL

  raw_data_as_sf <- data.table::data.table(raw_data) |>
    tidytable::rowwise() |>
    tidytable::mutate(geom = list(sf::st_point(x = c(
      as.numeric(stringr::str_trim(lon)),
      as.numeric(stringr::str_trim(lat))
    )))) |>
    tidytable::mutate(date = base::as.Date(data_pas)) |>
    tidytable::mutate(id = id_bdq) |>
    tidytable::mutate(country = stringr::str_trim(pais)) |>
    tidytable::mutate(state = stringr::str_trim(estado)) |>
    tidytable::mutate(city = stringr::str_trim(municipio)) |>
    tidytable::mutate(biom = stringr::str_trim(bioma)) |>
    tidytable::mutate(fid = stringr::str_trim(foco_id)) |>
    tidytable::select(-id_bdq,
                      -lat,
                      -lon,
                      -id,
                      -data_pas,
                      -pais,
                      -estado,
                      -municipio,
                      -bioma,
                      -foco_id) |>
    sf::st_sf()

  sf::st_crs(raw_data_as_sf) <- "EPSG:4326"

  raw_data_as_sf
}
