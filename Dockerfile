FROM ghcr.io/bluesky/databroker:v2.0.0b43 as base

# git is used only for the pip install git+https:// below and can be
# removed once that is no longer used.
RUN apt-get update && apt-get install -y postgresql-client git && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp/
RUN pip install --upgrade --no-cache-dir -r /tmp/requirements.txt
RUN pip install --upgrade --no-cache-dir git+https://github.com/NSLS-II-CHX/chx_compress.git@cf5e686b38
