#!/bin/sh
#

set -e

export PACKETBEAT_VERSION="5.4.0"
export PACKETBEAT_SUM="facc75f54f1beca48dd03858499e0e05c05ead5d5d8bd28c0ccecd2014b4ae76"

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
          "https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-${PACKETBEAT_VERSION}-linux-x86_64.tar.gz"
mv "packetbeat-${PACKETBEAT_VERSION}-linux-x86_64" /packetbeat
