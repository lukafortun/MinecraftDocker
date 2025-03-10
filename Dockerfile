FROM eclipse-temurin:21-jdk

ENV SERVER_TYPE=paper    
ENV MC_VERSION=1.20.1    
ENV MEMORY_MAX=4G        
ENV MEMORY_MIN=1G        

RUN apt-get update && apt-get install -y curl jq screen && apt-get clean

WORKDIR /server

COPY ./utils/* /utils/

RUN chmod +x /utils/lts-paper.sh /utils/lts-fabric.sh /utils/lts-vanilla.sh /utils/lts-forge.sh

RUN echo "eula=true" > eula.txt

VOLUME /server

EXPOSE 25565

ENTRYPOINT ["/utils/start-server.sh"]
