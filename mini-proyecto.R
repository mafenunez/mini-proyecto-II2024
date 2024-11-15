# Se busca realizar un analisis comparativo entre letras de canciones de amor escritas en los 60' y en la decada del 2010
# Los datos son recolectados a partir de la pagina Genius

# Primero, se deben instalar los paquetes "remotes", "tidyverse" y "geniusr"

install.packages("remotes")
library(remotes)

install.packages("tidyverse")
library(tidyverse)

# El paquete "geniusr" presenta algunos errores, por lo que se debe instalar una versión más actualizada desde Github

remotes::install_github("giovanni-cutri/geniusr")
library(geniusr)

# Se debe crear una API y un token desde la pagina de Genius para poder extraer las letras
# Para ello, es necesario crear una cuenta e identificar el valor de "client access token"

Sys.setenv(GENIUS_API_TOKEN = "WdpkaOPzecLuH0-EF30G2mF-i2jGtzCWydOUWwSnoILDwHK5OTc5Cc2NH9nRTMWG")

print(Sys.getenv("GENIUS_API_TOKEN"))
genius_token()

# Con el token habilitado, corresponde cargar los data frames sobre los que se va a trabajar

canciones_2010 <- read.csv2("data/canciones2010.csv", encoding = "utf-8")
canciones_1960 <- read.csv2("data/canciones1960.csv", encoding = "utf-8")

# Se crea la funcion para poder sacar las letras de acuerdo al nombre del artista y de la cancion
  # Primero, la funcion busca la canción en Genius
  # Esto arroja un listado de canciones con títulos similares
  # El comando que mejor funciona para sacar las letras con "geniusr" es el de "get_lyrics_url"
  # Entre todas las opciones, se accede al url de la primera canción del listado
  # Se utiliza "plain_text" para que el texto se muestre continuo 
  # Se eliminan signos de puntuación y otros símbolos para simplificar la lectura

sacar_letras <- function(nombre_cancion, nombre_artista){
  cancion <- search_song(paste0(nombre_cancion, nombre_artista))
  url_cancion <- cancion$song_lyrics_url[1] 
  letra <- get_lyrics_url(url_cancion)
  plain_text <- paste(letra$line, collapse = " ")
  plain_text <- str_remove_all(plain_text, pattern = "\\p{P}")
  return(plain_text)
}

# En caso de querer comprobar el correcto funcionamiento de la función, se puede usar una cancion que no este en el listado subido para el siguiente comando:

sacar_letras("nombre_cancion", "nombre_artista")

# Finalmente se crea un listado de letras mediante la iteracion con el comando "for"
  # Primero se crean dos listas vacias para cada decada

lista_letras_2010 <- list()
lista_letras_1960 <- list()

  # Se itera con ciclo "for" para el listado de canciones del 2010

for (i in 1 : nrow(canciones_2010)) {
  lyrics <- sacar_letras(canciones_2010$nombre_cancion[i], canciones_2010$nombre_artista[i])
  lista_letras_2010 <- append(lista_letras_2010, lyrics)
}

  # Se itera con ciclo "for" para el listado de canciones del 1960

for (i in 1 : nrow(canciones_1960)) {
  lyrics <- sacar_letras(canciones_1960$nombre_cancion[i], canciones_1960$nombre_artista[i])
  lista_letras_1960 <- append(lista_letras_1960, lyrics)
}

# De esta manera se crean dos listas de letras correspondientes a cada decada que serviran para el posterior analisis comparativo
