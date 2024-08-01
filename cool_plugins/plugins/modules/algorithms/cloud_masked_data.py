# # # This source code is protected under the license referenced at
# # # https://github.com/NRLMMD-GEOIPS.

"""Cloud masked data product.

Mask cloudy pixels in dataset using CLAVR-x cloud mask data
"""
import logging
import xarray

LOG = logging.getLogger(__name__)

interface = "algorithms"
family = "xarray_dict_to_xarray"
name = "cloud_masked_data"


def call(xarray_dict):
    """My cloud masked data product algorithm manipulation steps."""
    final_xarray = xarray.Dataset()

    bt_dataset = xarray_dict["brightness_temperature_dataset"]
    bt_variable_name = bt_dataset.product_plugin.name
    bt = bt_dataset[bt_variable_name]

    cm_dataset = xarray_dict["cloud_mask_dataset"]
    cm_variable_name = cm_dataset.product_plugin.name
    cm = cm_dataset[cm_variable_name]

    final_variable_name = xarray_dict["METADATA"].product_name

    # Cloud mask 0 clear, 1 probably clear, 2 probaby cloudy, 3 cloudy
    final_xarray[final_variable_name] = bt.where(cm>1)
    final_xarray["latitude"] = bt_dataset["latitude"]
    final_xarray["longitude"] = bt_dataset["longitude"]
    final_xarray.attrs = xarray_dict["METADATA"].attrs

    return final_xarray

