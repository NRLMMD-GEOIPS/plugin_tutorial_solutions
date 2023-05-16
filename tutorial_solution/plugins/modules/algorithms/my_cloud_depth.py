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

"""Cloud depth product.

This cloud depth product is computed as the difference of cld_height_acha and
cld_height_base from CLAVR-x output.
"""
import logging
from geoips.data_manipulations.corrections import apply_data_range

LOG = logging.getLogger(__name__)

interface = "algorithms"
family = "list_numpy_to_numpy"
name = "my_cloud_depth"


def call(
    arrays,
    output_data_range,
    scale_factor,
    min_outbounds="crop",
    max_outbounds="crop",
    norm=False,
    inverse=False,
):
    """Cloud depth product data manipulation steps."""
    cth = arrays[0]
    cbh = arrays[1]

    out = (cth - cbh) * scale_factor

    data = apply_data_range(
        out,
        min_val=output_data_range[0],
        max_val=output_data_range[1],
        min_outbounds=min_outbounds,
        max_outbounds=max_outbounds,
        norm=norm,
        inverse=inverse,
    )

    return data
