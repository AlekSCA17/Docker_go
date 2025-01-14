#Imagen base de go
#FROM indica la imagen base que se usará para construir la nueva imagen
#golag:1.17-alpine especifica la imagen base de go y su version esta se basa en Alpine Linux
#Alpine Linux es una distribución de Linux ligera y minimalista, lo que hace que las imágenes Docker sean más pequeñas.
FROM golang:1.23.3-alpine

#WORKDIR esta es la palabra clave y crea un directorio de trabajo dentro del contenedor
#Todos los comandos subsiguientes (COPY, RUN, etc.) se ejecutarán en este directorio.
#main es el nombre que le pusimos esta puede variar
WORKDIR /main

#COPY copia los archivos y los dos puntos indican que todo lo que está en el directorio actual se copiará en el directorio de trabajo del contenedor.
#El primer punto indica el directorio actual en el sistema de archivos del host
#EL segundo punto indica el directorio de trabajo del contenedor
COPY . .

#RUN esta palabra clave ejecuta un comando en el contenedor durante la construcción de la imagen
#go build -o main . Este comando compila el código fuente de Go en el 
#directorio actual (.) y genera un ejecutable llamado main. El archivo ejecutable se coloca en el directorio de trabajo del contenedor.
RUN go build -o main .

#EXPOSE Esta palabra clave indica el puerto en el que la aplicación dentro del contenedor escuchará las conexiones. 
#No abre el puerto en el host, pero documenta el puerto que debe ser expuesto.
#8080 es el numero del puerto
EXPOSE 8080

#CMD sta palabra clave define el comando predeterminado que se ejecutará cuando se inicie un contenedor a partir de la imagen. 
#A diferencia de RUN, que se ejecuta durante la construcción de la imagen, CMD se ejecuta cuando se inicia el contenedor.
#[./main]  Especifica el comando a ejecutar. En este caso, ejecuta el archivo main 
#(el ejecutable generado por el comando RUN go build -o main .).
CMD ["./main"]

