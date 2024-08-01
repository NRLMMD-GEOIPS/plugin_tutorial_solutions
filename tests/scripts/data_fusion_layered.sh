# # # This source code is protected under the license referenced at
# # # https://github.com/NRLMMD-GEOIPS.

#!/bin/bash

geoips run data_fusion \
      --filename_formatter geoips_fname \
      --sector_list goes_east \
      --fusion_final_output_formatter layered_imagery \
      --fusion_final_product_name Layered-Visible-CloudMask-TPW \
      --fusion_final_source_name layered \
      --fusion_final_platform_name geo \
      --fuse_files $GEOIPS_TESTDATA_DIR/test_data_2024_tutorial/*ABI-L1b-RadF*.nc \
          --fuse_reader_name abi_netcdf \
          --fuse_product_name Visible \
          --fuse_dataset_name ref \
          --fuse_output_format imagery_clean \
          --fuse_order 0 \
      --fuse_files $GEOIPS_OUTDIRS/preprocessed/algorithms/Cloud-Masked-Infrared_latitude_longitude/fusion/geo/goes_east/20230411/20230411.160020.geo.Cloud-Masked-Infrared_latitude_longitude.goes_east.nc \
          --fuse_reader_name geoips_netcdf \
          --fuse_product_name Preprocessed-Cloud-Masked-Infrared \
          --fuse_dataset_name cloud_mask_dataset \
          --fuse_output_format imagery_clean \
          --fuse_order 1 \
      --fuse_files $GEOIPS_TESTDATA_DIR/test_data_2024_tutorial/*TPW*.nc \
          --fuse_reader_name abi_l2_netcdf \
          --fuse_product_name TPW \
          --fuse_dataset_name tpw \
          --fuse_output_format imagery_clean \
          --fuse_order 2 
retval=$?

exit $retval

