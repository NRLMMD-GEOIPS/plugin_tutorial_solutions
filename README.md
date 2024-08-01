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

Basic GeoIPS Plugin Template
=============================

This template repository contains everything necessary to create a fully
compatible GeoIPS Plugin Package.  Each file within this repository contains
appropriate modification instructions.

To create your own functional plugin for GeoIPS, follow the
[step by step instructions](./docs/source/userguide/template_instructions.rst) for
modifying the template files within this repo.

cool_plugins GeoIPS Plugin
==========================

The cool_plugins package is a GeoIPS-compatible plugin, intended to be used within
the GeoIPS ecosystem.  Please see the
[GeoIPS Documentation](https://github.com/NRLMMD-GEOIPS/geoips#readme) for
more information on the GeoIPS plugin architecture and base infrastructure.

Package Overview
-----------------

The cool_plugins plugin provides the capability for creating Cool Plugins.

System Requirements
---------------------

* geoips >= 1.10.0
* Test data repos contained in $GEOIPS_TESTDATA_DIR for tests to pass.
* Coolness.

IF REQUIRED: Install base geoips package
------------------------------------------------------------
SKIP IF YOU HAVE ALREADY INSTALLED BASE GEOIPS ENVIRONMENT

If GeoIPS Base is not yet installed, follow the
[installation instructions](https://github.com/NRLMMD-GEOIPS/geoips#installation)
within the geoips source repo documentation:

Install cool_plugins package
----------------------------
```bash

    # Ensure GeoIPS Python environment is enabled.

    # Clone and install cool_plugins
    git clone https://github.com/NRLMMD-GEOIPS/cool_plugins $GEOIPS_PACKAGES_DIR/cool_plugins
    pip install -e $GEOIPS_PACKAGES_DIR/cool_plugins

    # Add any additional clone/install/setup steps here
```

Test cool_plugins installation
-----------------------------
```bash

    # Ensure GeoIPS Python environment is enabled.

    # This script will run ALL tests within this package
    $GEOIPS_PACKAGES_DIR/cool_plugins/tests/test_all.sh

    # Individual direct test calls, for reference
    $GEOIPS_PACKAGES_DIR/cool_plugins/tests/scripts/<test_script_name>.sh
```
