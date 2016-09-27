#!/bin/sh
#

set -e

export PACKETBEAT_VERSION="1.3.1"
export PACKETBEAT_SUM="db580a2ad762a958afbe1b214d84d2c9e9087535ffcc50e7ca120fbf883a22e4"

get_src()
{
  hash="$1"
  url="$2"
  f=$(basename "$url")

  curl -sSL "$url" -o "$f"
  echo "$hash  $f" | sha256sum -c - || exit 10
  tar xzf "$f"
  rm -rf "$f"
}
get_src $PACKETBEAT_SUM \
          "https://download.elastic.co/beats/packetbeat/packetbeat-${PACKETBEAT_VERSION}-x86_64.tar.gz"

mv "packetbeat-${PACKETBEAT_VERSION}-x86_64" /packetbeat

