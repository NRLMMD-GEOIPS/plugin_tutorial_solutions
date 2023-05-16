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
[step by step instructions](./docs/template_instructions.rst) for
modifying the template files within this repo.

@ Once this repository has been set up properly, you can remove this "Basic
GeoIPS Plugin Template" section in the README.md, leaving the appropriate
content for your package's README file.


plugin_tutorial_solution GeoIPS Plugin
==========================

The plugin_tutorial_solution package is a GeoIPS-compatible plugin, intended to be used within
the GeoIPS ecosystem.  Please see the
[GeoIPS Documentation](https://github.com/NRLMMD-GEOIPS/geoips#readme) for
more information on the GeoIPS plugin architecture and base infrastructure.


Package Overview
-----------------

The plugin_tutorial_solution plugin provides the capability for

@ Please include a brief description of what capability this package provides.

@ This section should be no more than 1-2 paragraphs, if you have additional
@ information to include, please include in a "docs" subdirectory.

@ Example overview:

@ The template_basic_plugin package provides template files which can be used to create
@ a fully compatible GeoIPS plugin.  This template repository is focused on basic functionality -
@ ie, simple readers, products, output formats, etc.  Additional template repositories will be
@ created for more sophisticated and complicated use cases.

System Requirements
---------------------

* geoips >= 1.10.0
* Test data repos contained in $GEOIPS_TESTDATA_DIR for tests to pass.
* @ Add any additional system requirements, such as gfortran, etc

IF REQUIRED: Install base geoips package
------------------------------------------------------------
SKIP IF YOU HAVE ALREADY INSTALLED BASE GEOIPS ENVIRONMENT

If GeoIPS Base is not yet installed, follow the
[installation instructions](https://github.com/NRLMMD-GEOIPS/geoips#installation)
within the geoips source repo documentation:

Install plugin_tutorial_solution package
----------------------------
```bash

    # Ensure GeoIPS Python environment is enabled.

    git clone https://github.com/NRLMMD-GEOIPS/plugin_tutorial_solution $GEOIPS_PACKAGES_DIR/plugin_tutorial_solution
    pip install -e $GEOIPS_PACKAGES_DIR/plugin_tutorial_solution
```

Test plugin_tutorial_solution installation
-----------------------------
```bash

    # Ensure GeoIPS Python environment is enabled.

    # This script will run ALL tests within this package
    # @ You can add additional individual test calls if desired
    # @  (rather than forcing the user to run the full test)
    $GEOIPS_PACKAGES_DIR/plugin_tutorial_solution/tests/test_all.sh
```
