# SPDX-FileCopyrightText: © 2026 HackingPheasant <HackingPheasant@protonmail.com>
# SPDX-License-Identifier: MIT

{
  lib,
  stdenv,
  fetchFromGitHub,

  # nativeBuildInputs
  cmake,
  ninja,
  pkg-config,

# buildInputs

}:

stdenv.mkDerivation rec {
  pname = "chimera";
  version = "0.1.0";

  src = builtins.path { path = ./.; name = "chimera"; };

  #src = fetchFromGitHub {
  #  owner = "HackingPheasant";
  #  repo = pname;
  #  rev = version;
  #  sha256 = pkg.lib.fakeHash;"
  #};

  strictDeps = true;

  # Excutable packages used to produce packages also used at build time,
  # if the dependency doesn't care about the target platform put it in
  # nativeBuildInputs instead.
  depsBuildBuild = [
    pkg-config
  ];

  # Executable packages, stuff only needed during the build process
  nativeBuildInputs = [
    cmake
    ninja
    pkg-config
  ];

  # Packages to be linked against (dependencies needed at runtime)
  buildInputs = [
  ];

  meta = {
    description = "Personal software libraries and executables";
    longDescription = ''
      This is a way for me learn C++ and build out software for personal use.
    '';
    homepage = "https://github.com/HackingPheasant/Chimera";
    downloadPage = "https://github.com/HackingPheasant/Chimera/releases/";
    changelog = "https://github.com/HackingPheasant/Chimera/CHANGELOG";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ HackingPheasant ];
    platforms = lib.platforms.all;
  };
}
