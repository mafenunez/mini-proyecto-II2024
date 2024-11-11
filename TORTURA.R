# instalar paquetes
install.packages("remotes")
library(remotes)

remotes::install_github("giovanni-cutri/geniusr")
library(geniusr)

# crear token
Sys.setenv(GENIUS_API_TOKEN = "WdpkaOPzecLuH0-EF30G2mF-i2jGtzCWydOUWwSnoILDwHK5OTc5Cc2NH9nRTMWG")

print(Sys.getenv("GENIUS_API_TOKEN"))
genius_token()

# subimos canciones
canciones_2010 <- read.csv2("canciones2010.csv", encoding = "utf-8")
canciones_1960 <- read.csv2("canciones1960.csv", encoding = "utf-8")

# crear función
  # borrar paréntesis y signos de puntuación / solo dejar texto
sacar_letras <- function(nombre_cancion, nombre_artista){
  cancion <- search_song(paste0(nombre_cancion, nombre_artista))
  url_cancion <- cancion$song_lyrics_url[1]
  letra <- get_lyrics_url(url_cancion)
  plain_text <- paste(letra$line, collapse = " ")
  return(plain_text)
}

# crear listados de letras
  # evaluar si hacer ambas en el mismo for o dos operaciones distintas
lista_letras <- list()
for (i in 1 : nrow(canciones_2010)) {
  lyrics <- sacar_letras(canciones_2010$nombre_cancion[i], canciones_2010$nombre_artista[i])
  lista_letras <- append(lista_letras, lyrics)
}

lista_letras_1960 <- list()
for (i in 1 : nrow(canciones_1960)) {
  lyrics <- sacar_letras(canciones_1960$nombre_cancion[i], canciones_1960$nombre_artista[i])
  lista_letras_1960 <- append(lista_letras_1960, lyrics)
}


# get lyric bigrams
  unnest_tokens(bigram, line, token = "ngrams", n = 2) %>%
  # look for good morning
  filter(bigram == "good morning") %>% 
  # count bigram frequency
  nrow()

# client_id = hgk1jQpyfHCXTJY8y-3G1DXIg5dkuX9vkcrSdiQ133r8tkKkMeqG4fsE2pELIL-l
# client_secret = vn_kz-w8_wU-y2dNMIWTh4SPXRpOb1HHV8sqej80gxkxkq1lfTqyOT5nd_Sb_yHdNoWoA0ucrl9OjNoAAhthAg
# client_access_token = QUzGFFvhghgRu7LhZ9Kmq4hd9eQATRLIiyoshXgXwo2yKZkxQcgMfu1ci-jXHvJF
  
  lista_canciones_2010 <- as.list(canciones_2010)
  lista_canciones_2010[[2]][1]

  # get lyrics
  get_lyrics_search(artist_name = "J Balvin & Bad Bunny",
                    song_title = "LA CANCIÓN")  
  
  print(letras, n = 23)
  
  sacar_letras(canciones_1960[[1]][28], canciones_1960[[2]][28])
  
  
  search_song(paste0("estas cosas del amor", "leonardo favio"))