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

# @ Please identify and update all instances of "@" found in this script appropriately.
# @ You will need to generate one or more test scripts that test your
# @ complete functionality, @(these scripts provide example geoips calls and
# @ sample output, as well as providing a full integration test),
# @ and call each script within the test_all.sh script.

# Do not rename this script or test directory - automated integration
# tests look for the tests/test_all.sh script for complete testing.

#!/bin/bash

# This should contain test calls to cover ALL required functionality tests
# for the @package@ repo.

# The $GEOIPS tests modules sourced within this script handle:
   # setting up the appropriate associative arrays for tracking the overall
   #   return value,
   # calling the test scripts appropriately, and
   # setting the final return value.

# Note you must use the variable "call" in the for the loop

# @ Pass the name of your package to "test_all_pre.sh", ie

if [[ ! -d $GEOIPS_PACKAGES_DIR/geoips ]]; then
    echo "Must CLONE geoips repository into \$GEOIPS_PACKAGES_DIR location"
    echo "to use test_all.sh testing utility."
    echo ""
    echo "export GEOIPS_PACKAGES_DIR=<path_to_geoips_cloned_packages>"
    echo "git clone https://github.com/NRLMMD-GEOIPS/geoips $GEOIPS_PACKAGES_DIR/geoips"
    echo ""
    exit 1
fi
if [[ ! -f $GEOIPS_PACKAGES_DIR/geoips/tests/utils/test_all_pre.sh ]]; then
    echo "geoips-based testing utility does not exist:"
    echo "  $GEOIPS_PACKAGES_DIR/geoips/tests/utils/test_all_pre.sh"
    echo ""
    echo "Please ensure geoips repo is CLONED in GEOIPS_PACKAGES_DIR location"
    echo "and up to date."
    exit 2
fi

# . $GEOIPS_PACKAGES_DIR/geoips/tests/utils/test_all_pre.sh @package@
. $GEOIPS_PACKAGES_DIR/geoips/tests/utils/test_all_pre.sh my_package

# @ NOTE: Update "plugin_tutorial_solution" paths below to point to your package's
# @ test scripts, ie
# @   $GEOIPS_PACKAGES_DIR/plugin_tutorial_solution -> $GEOIPS_PACKAGES_DIR/@package@

echo ""
# "call" used in test_all_run.sh
for call in \
\
            "$GEOIPS_PACKAGES_DIR/geoips/tests/utils/check_code.sh all `dirname $0`/../" \
            "test_interfaces" \
            "$GEOIPS_PACKAGES_DIR/plugin_tutorial_solution/tests/scripts/clavrx.conus_annotated.my-cloud-base-height.sh" \
            "$GEOIPS_PACKAGES_DIR/plugin_tutorial_solution/tests/scripts/clavrx.conus_annotated.my-cloud-top-height.sh" \
            "$GEOIPS_PACKAGES_DIR/plugin_tutorial_solution/tests/scripts/clavrx.goes16_annotated.my-cloud-base-height.sh" \
            "$GEOIPS_PACKAGES_DIR/plugin_tutorial_solution/tests/scripts/clavrx.goes16_clean.my-cloud-base-height.sh" \
            "$GEOIPS_PACKAGES_DIR/plugin_tutorial_solution/tests/scripts/clavrx.goes16_clean.my-cloud-top-height.sh" \
            "$GEOIPS_PACKAGES_DIR/plugin_tutorial_solution/tests/scripts/clavrx.japan_annotated.my-cloud-base-height.sh" \
            "$GEOIPS_PACKAGES_DIR/plugin_tutorial_solution/tests/scripts/clavrx.japan_annotated.my-cloud-depth.sh" \
            "$GEOIPS_PACKAGES_DIR/plugin_tutorial_solution/tests/scripts/clavrx.japan_annotated.my-cloud-top-height.sh"
do
    . $GEOIPS_PACKAGES_DIR/geoips/tests/utils/test_all_run.sh
done

. $GEOIPS_PACKAGES_DIR/geoips/tests/utils/test_all_post.sh
