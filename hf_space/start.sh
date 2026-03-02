#!/usr/bin/env bash
set -e

mkdir -p /app/_paper_notes

NOTEBOOK_URL="https://raw.githubusercontent.com/zhuobietly/lanyuetang.github.io/HEAD/_paper_notes/stochastic_process_pub.ipynb"
curl -L "$NOTEBOOK_URL" -o /app/_paper_notes/stochastic_process_pub.ipynb

python -m ipykernel install --name python3 --prefix /usr/local

exec voila /app/_paper_notes/stochastic_process_pub.ipynb \
  --Voila.ip=0.0.0.0 \
  --Voila.port=7860 \
  --VoilaConfiguration.base_url=/ \
  --ServerApp.disable_check_xsrf=True \
  --ServerApp.trust_xheaders=True \
  --no-browser
