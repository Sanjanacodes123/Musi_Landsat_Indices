library(terra)
library(sf)
raster1 <- rast("C://Users//sanja//Downloads//catalog_automation//LC08_L2SP_144048_20251108_20251128_02_T1_SR_B4.TIF")
raster1
raster2 <- rast("C://Users//sanja//Downloads//catalog_automation//LC08_L2SP_144048_20251108_20251128_02_T1_SR_B5.TIF")
raster2
raster3 <- rast("C://Users//sanja//Downloads//catalog_automation//LC08_L2SP_144048_20251108_20251128_02_T1_SR_B3.TIF")
raster3
raster4 <- rast("C://Users//sanja//Downloads//catalog_automation//LC08_L2SP_144048_20251108_20251128_02_T1_SR_B6.TIF")
raster4

NDVI <- (raster2 - raster1) / (raster2 + raster1)
plot(NDVI)

vector <- st_read("C://Users//sanja//Downloads//hyderabad boundary//MUSI BUFFER_FINAL")
plot(vector)
ext(NDVI)
st_bbox(vector)
vect_terra <- vect(vector)
vect_terra

cropped_NDVI <- crop(NDVI, vect_terra)
plot(cropped_NDVI)
masked_NDVI <- mask(cropped_NDVI, vect_terra)
plot(masked_NDVI)
hist(masked_NDVI)

NDWI <- (raster3 - raster2) / (raster3 + raster2)
plot(NDWI)
cropped_NDWI <- crop(NDWI, vect_terra)
plot(cropped_NDWI)
masked_NDWI <- mask (cropped_NDWI, vect_terra)
plot(masked_NDWI)

difference <- masked_NDVI - masked_NDWI
plot(difference)

NDBI <- (raster4 - raster2) / (raster4 + raster2)
plot(NDBI)
cropped_NDBI <- crop(NDBI, vect_terra)
plot(cropped_NDBI)
masked_NDBI <- mask(cropped_NDBI, vect_terra)
plot(masked_NDBI)

writeRaster(masked_NDVI, "Musi_NDVI.tif", overwrite=TRUE)
writeRaster(masked_NDWI, "Musi_NDWI.tif", overwrite=TRUE)
writeRaster(masked_NDBI, "Musi_NDBI.tif", overwrite=TRUE)

indices_stack <- c(masked_NDVI, masked_NDWI, masked_NDBI)
plot(indices_stack)
writeRaster(indices_stack, "indices.tif", overwrite=TRUE)