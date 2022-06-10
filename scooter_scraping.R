# load libs

library(tidyverse)
library(jsonlite)

# yoio
yoio <- fromJSON("https://geoportal.freiburg.de/files/yoio/yoio_verf_geo.json?SERVICE=GeoJSON&REQUEST=GetCapabilities")
yoio_scooter <- yoio$features
yoio_scooter_coords <- do.call(rbind.data.frame, yoio_scooter$geometry$coordinates)
yoio_scooter_coords$id <- yoio_scooter$properties$nr

names(yoio_scooter_coords) <- c("x", "y", "id")
write_csv(
  yoio_scooter_coords,
  paste0("data/", Sys.Date(), "_", Sys.time(), "_yoio", ".csv")
)

# roxy
roxy <- fromJSON("https://geoportal.freiburg.de/files/roxy/roxy_verf_geo.json?SERVICE=GeoJSON&REQUEST=GetCapabilities")
roxy_scooter <- roxy$features
roxy_scooter_coords <- do.call(rbind.data.frame, roxy_scooter$geometry$coordinates)
roxy_scooter_coords$id <- roxy_scooter$properties$id

names(roxy_scooter_coords) <- c("x", "y", "id")
write_csv(
  roxy_scooter_coords,
  paste0("data/", Sys.Date(), "_", Sys.time(), "_roxy", ".csv")
)

# freib_e
freib_e <- fromJSON("https://geoportal.freiburg.de/files/suewag_freib-e/freib-e_verf_geo.json")
freib_e_scooter <- freib_e$features
freib_e_scooter_coords <- do.call(rbind.data.frame, freib_e_scooter$geometry$coordinates)
freib_e_scooter_coords$id <- freib_e_scooter$properties$id

names(freib_e_scooter_coords) <- c("x", "y", "id")
write_csv(
  freib_e_scooter_coords,
  paste0("data/", Sys.Date(), "_", Sys.time(), "_freib_e", ".csv")
)