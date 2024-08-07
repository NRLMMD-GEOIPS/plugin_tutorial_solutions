"""Cloud depth product.

Difference of cloud top height and cloud base height.
"""

import logging
from xarray import DataArray

LOG = logging.getLogger(__name__)

interface = "algorithms"
family = "xarray_dict_to_xarray"
name = "my_cloud_depth_dict"


def call(
    xarray_dict,
    variables,
    product_name,
    output_data_range,
    scale_factor,
    min_outbounds="crop",
    max_outbounds="mask",
    norm=False,
    inverse=False,
):

    # DATA:cloud_height_acha
    cth_dsname, cth_varname = variables[0].split(":")
    # DATA:cloud_height_base
    cbh_dsname, cbh_varname = variables[1].split(":")
    # DATA:Unregistered-Cloud-Depth
    out_dsname, out_varname = product_name.split(":")
    cth = xarray_dict[cth_dsname][cth_varname]
    cbh = xarray_dict[cbh_dsname][cbh_varname]

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
    xarray_dict[out_dsname][out_varname] = DataArray(data)
    xobj = xarray_dict[out_dsname]

    return xobj
