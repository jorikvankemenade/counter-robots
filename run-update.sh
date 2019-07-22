#!/usr/bin/env sh
# -*- coding: utf-8 -*-
#
# Run the update script to see if there are any updates to the lists.
# If there are any updates the updates are commited and a tag is created.
#
# This file is part of COUNTER-Robots.
# Copyright (C) 2019 CERN.
#
# COUNTER-Robots is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
set -e
python scripts/update-lists.py

if git diff --name-only; then
    git commit --author="'Invenio <info@inveniosoftware.org>" \
        -am "Update the user-agent lists"
    export TRAVIS_TAG=$(date +'%Y.%m')
    git tag $TRAVIS_TAG
fi