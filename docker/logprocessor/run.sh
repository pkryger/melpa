#!/bin/bash -e

MELPA_REPO=/mnt/store/melpa
cd "${MELPA_REPO}"

# Unstable
/usr/bin/python3 ${MELPA_REPO}/docker/logprocessor/process_log.py \
  --db /mnt/db/download_log_full.db \
  --jsondir html \
  /mnt/store/log/melpa.access.log

# Stable
/usr/bin/python3 ${MELPA_REPO}/docker/logprocessor/process_log.py \
   --db /mnt/db/download_log_stable_full.db \
   --jsondir html-stable \
   /mnt/store/log-stable/melpa.access.log

# Snapshot
/usr/bin/python ${MELPA_REPO}/docker/logprocessor/process_log.py \
   --db /mnt/db/download_log_snapshot_full.db \
   --jsondir html-snapshot \
   /mnt/store/log-snapshot/melpa.access.log

# Release
/usr/bin/python ${MELPA_REPO}/docker/logprocessor/process_log.py \
   --db /mnt/db/download_log_release_full.db \
   --jsondir html-release \
   /mnt/store/log-release/melpa.access.log
