FROM 124051652702.dkr.ecr.us-east-1.amazonaws.com/appi:nodealpine

# Directorio principal
WORKDIR /usr/src/app

# Dependencias y metadatos
COPY package*.json /usr/src/app/

# Instalacion de paquetes
RUN npm install 

# Copiando el build context en WORKDIR
COPY . /usr/src/app/

# Puerto del conetenedor
EXPOSE 8080

# Pendiente: Revisar la necesidad de un Entrypoint

# Ejecucion de la aplicacion 
CMD ["node", "index.js"]
