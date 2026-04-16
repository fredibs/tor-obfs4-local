# ############################################################################
# Project: fredibs/f-tech_lab (none)
# File...: tor-server/Dockerfile
# Created: Thursday, 2026/04/16 
# Author.: Frederico Matos, (fredibs.cell@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 0.1
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  >
# ############################################################################
# HISTORY:
#

FROM debian:bookworm-slim
LABEL author="Frederico Matos"
LABEL mail="fredibs.cell@gmail.com"
LABEL organization="fredibs/f-tech_lab"
LABEL version="0.1"
LABEL license="https://gitlab.torproject.org/tpo/core/tor/-/raw/HEAD/LICENSE"

RUN apt update && \
    apt install -y tor wget obfs4proxy && \
    wget -O /etc/tor/torrc \
        https://raw.githubusercontent.com/sachsenhofer/tor_proxy/master/torrc.default && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Diretório de dados
RUN mkdir -p /var/lib/tor && \
    chown -R debian-tor:debian-tor /var/lib/tor

# Copia config
COPY torrc /etc/tor/torrc

# Permissões corretas
RUN chown debian-tor:debian-tor /etc/tor/torrc

USER debian-tor

CMD ["tor", "-f", "/etc/tor/torrc"]
