#
# Copyright (C) 2024 Inflames Package.
#
# Inflames Package is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
#

test_that("inflames::read test", {
  res <-
    inflames_read(local_create_example_data())

  expect_true(all(sf::st_is_valid(res)))
  expect_equal(class(sf::st_crs(res)), "crs")
})
