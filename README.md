# docker-ices-icecast
Um servidor para fluxo de audio usando icecast e o ices2

## Detalhes

Na pasta ices2 tem o Dockerfile e o entrypoint para configuração das variaveis 
que devem ser enviadas para fluxo do ices2.

Na pasta do icecast tem o servidor do icecast onde você realiza a configuração 
do servidor para recebimento do fluxo.

## Como usar

Para o servidor do Icecast indice o IP, porta (externa, pois a interna é 8000) usuário e senha do admin

`docker run -d -p 8000:8000 -e ICECAST_SOURCE_PASSWORD="teste" -e ICECAST_ADMIN_PASSWORD="senhaDificil" \
-e ICECAST_ADMIN_USERNAME="fulano" -e ICECAST_HOSTNAME="192.168.0.5" plimo263/icecast2:latest` 


Para o fluxo de audio, indique uma pasta que contenha arquivos .ogg junto com as variaveis para conexão
ao servidor do Icecast e opcionalmente um nome de montagem

`docker run -d -v $HOME/musicas:/etc/ices2/music -e ICES_HOSTNAME="192.168.0.5" -e ICES_PORT="8000" -e ICES_PASSWORD="teste" \
-e ICES_MOUNT="playlist" --name ices2 --restart=always plimo263/ices2:latest`


