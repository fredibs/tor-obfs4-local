# tor-server-local
Container servidor  tor local

Proxy SOCKS (uso geral)
Se você só precisa de um proxy SOCKS5 para rotear o tráfego de outros aplicativos pela rede Tor.
docker run -d --name tor-proxy -p 127.0.0.1:9050:9050 chris579/tor-alpine
Comando de exemplo:
Este comando inicia o container e expõe o proxy SOCKS na porta 9050 apenas para o seu computador

Relay ou Bridge (para ajudar a rede)
Se você quer contribuir com a rede Tor rodando um middle relay ou uma bridge (útil em países com censura).
docker run -d --name tor-bridge -p 9001:9001 -p 9002:9002 thetorproject/obfs4-bridge:latest
Comando de exemplo:
A imagem thetorproject/obfs4-bridge é mantida oficialmente e já vem configurada para ser uma bridge, ajudando usuários em regiões com censura

