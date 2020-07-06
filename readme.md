# Code Challenge

El siguiente reto esta divido en 6 actividades : 

## Generacion de servidor API 

El script **```GetApiBySwagger.sh```** nos permitira obtener la [API](https://s3-eu-west-1.amazonaws.com/mmi-codechallenge/swagger-users-v1.json). 

## Instalacion del API mediante CI/CD

Se han utilizado los siguientes productos de AWS :

1. Codecommit
2. Codebuild
3. Codepipeline
4. EC2
5. S3
6. KMS
7. IAM
8. Cloudformation

Los recursos(cf) se encuentran en el folder **/CI-AWStack** y el orden de implementacion es el siguiente :

1. **RolesyPoliticas**
2. **PoliticasKMS**
3. **PipelineStack**    
4. **APIServer**    

La carpeta de aplicacion desplegada en EC2 es **/Nodejs**    

* Se utiliza pm2 para la administracion del servidor node en EC2.

## Dockerizacion de la API

El folder **/Docker** tenemos la API mas los archivos **Dockerfile.Alpine** y **Dockerfile**.   
El primero genera una imagen base obtenida del registro oficial de node, el segundo es para uso de la API.   
El archivo **.dockerignore** obviara los archivos autogenerados por swagger entre otros.

* Se modifico el dominio host en el file api/swagger.yaml
* Se agrega y comenta configuracion de CORS en el archivo index.js

## Creacion y configuracion de autoscalamiento de EKS

Los cf de creacion se encuentra en el folder **/CI-AWStack** (**EKSPermisos** y **EKSConfig**). La configuracion de autoescalamiento seleccionada es por HPA (Horizontal Pod Autoscaling) mediante el uso de metrics-server.    
Para EKS se utilizaron los archivos del subfolder **CI-AWStack**/**EKS-HPAConfig**, tambien se agregan capturas de la prueba de autoescalamiento.   

* AWS no tiene instalado el metrics-server por default
* La configuracion del ingress-service implica la creacion de roles de kubernetes.
* Los deployment deben definir metricas y limites de recursos.

A efectos de la prueba, el balanceo se realiza mediante el nodeport y se establece un max de CPU permitido por pod de 7%.
EKS-Load-1 : Se genera un loop peticiones.
EKS-Load-2 : Los pods comienzan a escalar.
EKS-Load-3 : En 3 minutos se llega a 38 pods y subiendo. 
HPAConfig 
## Generacion de un script de pruebas de estres con jmeter

Realice tres pruebas con balanceadores de red, clasico y de aplicacion.
En el folder **/jmeter** se adjuntan :     

1. Pruebas y reporte del CLB.   
2. Logs de pruebas del NLB.   
3. Archivo de configuracon eks.jmx

Evaluar el uso de EC2 (spots quizas) para mejorar el performance de jmeter ademas de la configuracion en profundida de jmeter. (mi equipo no aguanto)

## Realizacion de pruebas con Postman

Capturas en el folder **/Postman**.   


## Enlaces

[http://eks.yoshieki.com](http:eks.yoshieki.com)     

[http://ci.yoshieki.com](http://ci.yoshieki.com/docs) 


## License
[GG](https://en.wikipedia.org/wiki/GG#:~:text=GG%20(gaming)%2C%20a%20slang,match%20to%20mean%20Good%20Game.)
