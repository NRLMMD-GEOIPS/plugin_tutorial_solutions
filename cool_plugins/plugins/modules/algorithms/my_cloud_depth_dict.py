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
    """My cloud depth product algorithm manipulation steps.

    This algorithm expects Cloud Height Acha and Base in that order.

    Parameters
    ----------
    xarray_dict: dict of xarray Dataset
        * xarray datasets containing variables "variables" of channel data
        * Channel data should be in degrees Kelvin
    variables: list of str
        * List of variables that will be used out of xobj within this algorithm.
        * These variables are retrieved from the list of variables in the product
          plugin.
    product_name: str
        * Name of the product that is being produced.
        * Retrieved from the product plugin.
        * This will be the variable name of the final manipulated dataset
          that will be added to the return xarray Dataset.
    output_data_range: list of float
        * List containing minimum and maximum value for final output data.
    scale_factor: float
        * The scale to multply your data to get it in the correct output range.
    min_outbounds: str, default="crop"
        * Operation to perform for data below minimum value
        * crop or mask
    max_outbounds: str, default="mask"
        * Operation to perform for data above maximum value
        * crop or mask
    norm: bool, default=False
        * Specify whether to normalize the data or not.
    inverse: bool, default=False
        * Specify whether to invert the data or not.

    Returns
    -------
    xarray Dataset
        * xarray Dataset containing the original variables, plus variable
          "product_name" of appropriately scaled channel data
        * degrees Kelvin.
    """
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
