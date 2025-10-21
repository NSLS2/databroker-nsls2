FROM ghcr.io/bluesky/tiled:0.2.0-a1 as base

USER root

# git is used only for the pip install git+https:// below and can be
# removed once that is no longer used.
RUN apt-get update && apt-get install -y postgresql-client git && rm -rf /var/lib/apt/lists/*

USER app

COPY requirements.txt /tmp/
RUN python -m ensurepip
RUN python -m pip install --pre "databroker[all]"
RUN python -m pip install --upgrade --no-cache-dir -r /tmp/requirements.txt
RUN python -m pip install --upgrade --no-cache-dir git+https://github.com/NSLS-II-CHX/chx_compress.git@cf5e686b38
