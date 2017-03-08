#!/bin/bash -e

if [ "${DEBUG,,}" == "true" ]; then
  set -x
fi

if [ -n "${TEXMF_URL}" ]; then
  TEXMF_DIR=/root/texmf
  TEXMF_TMPFILE=/tmp/texmf.archive
  TEXMF_TMPDIR=/tmp/texmf

  echo "Downloading texmf contents from ${TEXMF_URL}"
  wget "${TEXMF_URL}" -O "${TEXMF_TMPFILE}"

  # Extract archive
  if [ "${TEXMF_FORMAT,,}" == "tar" ]; then
    TEXMF_TAR_OPTS=(${TEXMF_TAR_OPTS})
    tar "${TEXMF_TAR_OPTS[@]}" -xf "${TEXMF_TMPFILE}" -C "${TEXMF_TMPDIR}"
  else
    # Assume that the URL is a zip, if not specified otherwise
    TEXMF_UNZIP_OPTS=(${TEXMF_UNZIP_OPTS})
    unzip "${TEXMF_TMPFILE}" "${TEXMF_UNZIP_OPTS[@]}" -d "${TEXMF_TMPDIR}"
  fi

  # Optional TEXMF_SUBDIR
  mv "${TEXMF_TMPDIR}/${TEXMF_SUBDIR}" "${TEXMF_DIR}"

  # Cleanup the downloaded archive
  rm "${TEXMF_TMPFILE}"
fi

# Execute the provided command
exec "$@"
