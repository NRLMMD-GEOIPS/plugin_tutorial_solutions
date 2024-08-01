# # # This source code is protected under the license referenced at
# # # https://github.com/NRLMMD-GEOIPS.

#!/bin/bash

geoips run data_fusion \
      --filename_formatter geoips_netcdf_fname \
      --sector_list goes_east \
      --fusion_final_output_formatter netcdf_geoips \
      --fusion_final_product_name Cloud-Masked-Infrared \
      --fusion_final_source_name fusion \
      --fusion_final_platform_name geo \
      --fuse_files $GEOIPS_TESTDATA_DIR/test_data_2024_tutorial/*ABI-L1b-RadF*.nc \
          --fuse_reader_name abi_netcdf \
          --fuse_product_name Infrared-Gray \
          --fuse_dataset_name brightness_temperature_dataset \
          --fuse_order 0 \
      --fuse_files $GEOIPS_TESTDATA_DIR/test_data_clavrx/data/goes16_2023101_1600/clavrx_OR_ABI-L1b-RadF-M6C01_G16_s20231011600207.level2.hdf \
          --fuse_reader_name clavrx_hdf4 \
          --fuse_product_name Cloud-Mask \
          --fuse_dataset_name cloud_mask_dataset \
          --fuse_order 1
retval=$?

exit $retval

