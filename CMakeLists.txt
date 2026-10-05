# SPDX-FileCopyrightText: © 2026 HackingPheasant <HackingPheasant@protonmail.com>
# SPDX-License-Identifier: MIT

cmake_minimum_required(VERSION 4.1)

project(Chimera
    VERSION 0.1.0
    DESCRIPTION "Personal software libraries and executables"
    HOMEPAGE_URL https://github.com/HackingPheasant/Chimera
    LANGUAGES CXX)

# Enable testing with CTest (Required to be in top level CMakeLists.txt)
# TODO: Creat tests for project
include(CTest)

# Project dependencies
include(FeatureSummary)
# License identifier list (for reference):
# https://spdx.org/licenses/
# https://spdx.org/licenses/exceptions-index.html

# TODO: List dependencies here as needed

# Project code
add_subdirectory(src)

# Packaging
# TODO: Create packaging code for project
# https://cmake.org/cmake/help/latest/module/CMakePackageConfigHelpers.html
include(CMakePackageConfigHelpers)

feature_summary(DEFAULT_DESCRIPTION WHAT ALL)
feature_summary(FILENAME "${CMAKE_CURRENT_BINARY_DIR}/features.log" WHAT ALL)
# Note: Doesn't seem to correctly mark pkg-config and FetchContent supplied
# dependencies as found. Also the docs are shit, so linking issues that have
# helpful info here:
# - https://gitlab.kitware.com/cmake/cmake/-/issues/22689
# - https://gitlab.kitware.com/cmake/cmake/-/issues/25322
# - https://gitlab.kitware.com/cmake/cmake/-/issues/26486
# - https://gitlab.kitware.com/cmake/cmake/-/issues/26487
