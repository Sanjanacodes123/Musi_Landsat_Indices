# Musi_Landsat_Indices
NDVI, NDWI, and NDBI calculation for the Musi River area using Landsat 8 and R

This project demonstrates the extraction and analysis of vegetation, water, and built-up indices for the Musi River region in Hyderabad using Landsat 8 imagery. The workflow is implemented in R with the `terra` and `sf` packages. It includes:

- Reading and plotting Landsat 8 raster bands
- Cropping and masking rasters using a vector boundary of the Musi River
- Calculating NDVI (Normalized Difference Vegetation Index), NDWI (Normalized Difference Water Index), and NDBI (Normalized Difference Built-up Index)
- Exporting individual index rasters and a stacked raster file for further analysis

This repository can serve as a reference for geospatial analysis and remote sensing projects using R.
