#### Preamble
---
  # Purpose: Downloads and saves the data from City of Toronto's Open Data Portal
  
  # Author: Samarth Rajani
  
  # Date: 21 January 2024
  
  # Contact:[samarth.rajani\@utoronto.ca](mailto:samarth.rajani@utoronto.ca){.email}
  
  # License: University of Toronto
  
  #### Workspace setup
install.packages("tidyverse")
install.packages("opendatatoronto")
library(opendatatoronto)
library(dplyr)
library(tidyverse)

# get package
package <- show_package("neighbourhood-crime-rates")
package

# get all resources for this package
resources <- list_package_resources("neighbourhood-crime-rates")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data
### Saving data
write_csv(  x = data, file = "raw_data.csv")
