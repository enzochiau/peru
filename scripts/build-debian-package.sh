#! /usr/bin/env bash

# Generates a source package suitable for upload to a Launchpad PPA.
# See https://launchpad.net/~buildinspace/+archive/ubuntu/peru

set -e

# TODO: How should package versions be handled (across various package
# platforms)? There is also a package version specified in
# packaging/debian/changelog, for example. What about `peru --version`?
name="peru"
version="0.1"

cd $(dirname "$BASH_SOURCE")/..
repo_root=`pwd`

# TODO: Using a symlink breaks dpkg-buildpackage. Is there a workaround?
cp -R packaging/debian debian

# Pack the original tarball with the package metadata.
tar cfhJ ../"$name"_"$version".orig.tar.xz ../$(basename "$repo_root")

# Build a source package.
dpkg-buildpackage -S
