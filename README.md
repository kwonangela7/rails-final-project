Title: Rails Decal Project!!

**Team Members:** Angela Kwon, Matt Jeng, Rebecca Chuang

**Prompt:** Media Me Crazy

## **Abstract**

Our application allows users to enter in a preferred artist and track, and attributes (such as energy and danceability). These preferences generate a personalized playlist based off of their responses, which is added directly to their spotify account (and can be played from the spotify app or web player). Any 

## **Models:**

**User**

- has hash and email

**Preferences**

- has artist, track, and 5 attributes - acousticness, danceability, energy, instrumentalness, and liveness 
- belongs to a User

**Playlist**

- has songs
- belongs to a User

**Song**

- has song id
- belongs to a Playlist

## **Features:**

- Users can log in
- Users can view their playlists
- Users can enter their preferences for a personalized playlist
- Personalized playlists based off of a user's responses are generated
- Users can view songs on this playlist

## **Division of Labor:**

- Angela: playlist generation
- Matt: did everything authentication 
- Rebecca: created preferences form 
