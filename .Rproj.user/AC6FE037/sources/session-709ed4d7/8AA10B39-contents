install.packages("geniusr")
library(geniusr)

genius_token()
# Find artist ID
search_artist("The Dakrness") # 22667
songs <- get_artist_songs_df(22667) 

# Get all song IDs
ids <- c(as.character(songs$song_id))

# Create empty dataframe to house them
allLyrics <- data.frame()

# Add lyrics to that df
for (id in ids) {
  allLyrics <- rbind(get_lyrics_id(id), allLyrics)
}
# Above loop behaves strange
}dsdsd
d