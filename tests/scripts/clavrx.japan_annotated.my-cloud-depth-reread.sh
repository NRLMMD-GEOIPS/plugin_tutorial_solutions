# # # Distribution Statement A. Approved for public release. Distribution unlimited.
# # #
# # # Author:
# # # Naval Research Laboratory, Marine Meteorology Division
# # #
# # # This program is free software: you can redistribute it and/or modify it under
# # # the terms of the NRLMMD License included with this program. This program is
# # # distributed WITHOUT ANY WARRANTY; without even the implied warranty of
# # # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the included license
# # # for more details. If you did not receive the license, for more information see:
# # # https://github.com/U-S-NRL-Marine-Meteorology-Division/

#!/bin/bash

# Produces the My-Cloud-Base-Height product for the conus sector with annotations

run_procflow \
    $GEOIPS_OUTDIRS/preprocessed/algorithms/My-Cloud-Depth_latitude_longitude/clavrx/him9/japan/20230411/20230411.030000.him9.My-Cloud-Depth_latitude_longitude.japan.nc \
    --procflow single_source \
    --reader_name geoips_netcdf \
    --product_name "My-Cloud-Depth-Reread" \
    --compare_path "$GEOIPS_PACKAGES_DIR/plugin_tutorial_solution/tests/outputs/clavrx.japan_annotated.my-cloud-top-height-reread" \
    --output_formatter imagery_annotated \
    --filename_formatter geoips_fname \
    --minimum_coverage 0 \
    --sector_list japan
ss_retval=$?

exit $((ss_retval))
