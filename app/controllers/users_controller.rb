class UsersController < ApplicationController
  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @hash = @spotify_user.to_hash

    #puts "USER#SPOTIFY HASH IS #{@hash}"

    @country = @spotify_user.country #=> "US"
    #puts "COUNTRY: #{@country}"
    @email = @spotify_user.email   #=> "example@email.com"

    @user = User.create(token: @hash, email: @email)
    @playlists = @spotify_user.playlists(limit: 5)



    @seeds = {track: "Delicate", artist: "Taylor Swift", genre: "rock"}
    @track = RSpotify::Base.search(@seeds[:track], 'track', limit: 1) # using song keywords to get song id
    @t_id = @track.first.id # since the call above returns an array of (presumably) 1 track artist

    # do the same thing to get the artist id
    @artist = RSpotify::Base.search(@seeds[:artist], 'artist', limit: 1)
    @a_id = @artist.first.id

    @max_acousticness = 1.0 # form submission format might be different
    @max_danceability = 1.0
    @max_energy = 1.0
    @max_instrumentalness = 1.0
    @max_liveness = 1.0

    #recommendations = RSpotify::Recommendations.generate(seed_artists: [@t_id], seed_tracks: [@a_id], max_acousticness: @max_acousticness, max_danceability: @max_danceability, max_energy: @max_energy, max_instrumentalness: @max_instrumentalness, max_liveness: @max_liveness) 
    recommendations = RSpotify::Recommendations.generate(seed_artists: ['4NHQUGzhtTLFvgF5SZesLK'], seed_tracks: ['0c6xIDDpzE81m2q797ordA'], max_acousticness: @max_acousticness, max_danceability: @max_danceability, max_energy: @max_energy, max_instrumentalness: @max_instrumentalness, max_liveness: @max_liveness) 


    @new_playlist = @spotify_user.create_playlist!('Recommendations 1')
    #puts "PLAYLIST: #{playlist}"
    @new_playlist.add_tracks!(recommendations.tracks)
    

    # playlist = spotify_user.create_playlist!('zzzzzzzzzzzzzzzzzzzzzz')
    # puts "PLAYLIST: #{playlist}"
    # # Add tracks to a playlist in user's Spotify account
    # tracks = RSpotify::Track.search('Know')
    # puts "TRACKS: #{tracks.first}"
    # playlist.add_tracks!(tracks)
    # puts playlist.tracks.first.name #=> "Somebody That I Used To Know"
  end
end
