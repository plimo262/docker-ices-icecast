FROM ubuntu:18.04

# Cria a pasta do projeto, baixa o ices2 e limpa o local
RUN mkdir -p /etc/ices2/music && mkdir -p /var/log/ices2/ && apt update && apt install ices2 -y && apt clean 

# Copia os arquivos necessários
COPY docker-entrypoint.sh /entrypoint.sh
COPY ices-playlist.xml /etc/ices2/
COPY playlist.txt /etc/ices2/

# Volume inserir as musicas
VOLUME ["/etc/ices2/music"]

RUN chmod +x /entrypoint.sh

# Executa o entrypoint para verificar e configurar variáveis de ambiente
ENTRYPOINT ["/entrypoint.sh"]

# Comando para iniciar o fluxo
CMD ices2 /etc/ices2/ices-playlist.xml
