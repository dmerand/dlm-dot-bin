#!/usr/bin/env sh

for DIR in external sensitive; do
  for FILE in $(ls ${DIR}); do
    echo "Installing ${DIR} ${FILE} symlink..."
    ln -sf "$(pwd)/${DIR}/${FILE}" "${FILE}"
  done
done
