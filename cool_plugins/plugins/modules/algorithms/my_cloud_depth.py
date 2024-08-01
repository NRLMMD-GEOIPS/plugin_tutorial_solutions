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

Difference of cloud top height and cloud base height.
"""
import logging
from xarray import DataArray

LOG = logging.getLogger(__name__)

interface = "algorithms"
family = "xarray_to_xarray"
name = "my_cloud_depth"


def call(
    xobj,
    variables,
    product_name,
    output_data_range,
    scale_factor,
    min_outbounds="crop",
    max_outbounds="crop",
    norm=False,
    inverse=False,
):
    """My cloud depth product algorithm manipulation steps."""
    cth = xobj[variables[0]]
    cbh = xobj[variables[1]]

    out = (cth - cbh) * scale_factor

    from geoips.data_manipulations.corrections import apply_data_range

    data = apply_data_range(
        out,
        min_val=output_data_range[0],
        max_val=output_data_range[1],
        min_outbounds=min_outbounds,
        max_outbounds=max_outbounds,
        norm=norm,
        inverse=inverse,
    )
    xobj[product_name] = DataArray(data)
    return xobj
