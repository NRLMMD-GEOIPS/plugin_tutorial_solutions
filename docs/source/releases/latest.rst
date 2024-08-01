Version latest (2024-07-31)
***************************

 * *Bug fix*: Fixed error in template_basic_plugin pyproject.toml
 * *Documentation*: Set up repo for release notes built via brassy

Bug fix
=======

Fixed error in template_basic_plugin pyproject.toml
---------------------------------------------------

Fixed a small bug in template_basic_plugin's pyproject.toml. The file was incorrectly set up after the switch to poetry and my vscode TOML highlighter caught the error with the dependency.


::

    added: 
    deleted: 
    modified: pyproject.toml
    moved: 

Documentation
=============

Set up repo for release notes built via brassy
----------------------------------------------

Add a ``latest`` directory and add a yaml release note.

::

    added: docs/source/release/latest
    added: docs/source/release/latest/20-update-pyproject-depedencies.yaml
    deleted: 
    modified: tests/scripts/amsr2.global_clean.89-PCT-Using-Product-Defaults.sh
    modified: tests/scripts/amsr2.tc_clean.89-PCT-Fully-Specified.sh
    modified: tests/scripts/test_config.sh
    moved: 
