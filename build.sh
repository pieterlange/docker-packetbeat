#!/bin/sh
#

set -e

export PACKETBEAT_VERSION="1.2.3"
export PACKETBEAT_SUM="db2fcf1934f1bebe9da2ed08703d0a9361c3efa2be873a9b91559df8bd2bb1dd"

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

