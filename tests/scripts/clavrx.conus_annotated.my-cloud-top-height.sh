# # # This source code is protected under the license referenced at
# # # https://github.com/NRLMMD-GEOIPS.

#!/bin/bash

geoips run single_source $GEOIPS_TESTDATA_DIR/test_data_clavrx/data/goes16_2023101_1600/clavrx_OR_ABI-L1b-RadF-M6C01_G16_s20231011600207.level2.hdf \
  --reader_name clavrx_hdf4 \
  --product_name My-Cloud-Top-Height \
  --output_formatter imagery_annotated \
  --filename_formatter geoips_fname \
  --minimum_coverage 0 \
  --sector_list conus
ss_retval=$?

exit $((ss_retval))
