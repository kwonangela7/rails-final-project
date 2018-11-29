class UsersController < ApplicationController
  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @hash = @spotify_user.to_hash
    puts @hash
    @country = @spotify_user.country #=> "US"
    puts "COUNTRY: #{@country}"
    @email = @spotify_user.email   #=> "example@email.com"

    @user = User.create(token: @hash, email: @email)
    @playlists = @spotify_user.playlists(limit: 5)

    
    # playlist = spotify_user.create_playlist!('zzzzzzzzzzzzzzzzzzzzzz')
    # puts "PLAYLIST: #{playlist}"
    # # Add tracks to a playlist in user's Spotify account
    # tracks = RSpotify::Track.search('Know')
    # puts "TRACKS: #{tracks.first}"
    # playlist.add_tracks!(tracks)
    # puts playlist.tracks.first.name #=> "Somebody That I Used To Know"



    # Access and modify user's music library
    # spotify_user.save_tracks!(tracks)
    # spotify_user.saved_tracks.size #=> 20
    # spotify_user.remove_tracks!(tracks)

    # albums = RSpotify::Album.search('launeddas')
    # spotify_user.save_albums!(albums)
    # spotify_user.saved_albums.size #=> 10
    # spotify_user.remove_albums!(albums)

    # Use Spotify Follow features
    # spotify_user.follow(playlist)
    # spotify_user.follows?(artists)
    # spotify_user.unfollow(users)

    # Get user's top played artists and tracks
    # @artists = spotify_user.top_artists #=> (Artist array)
    # @tracks = spotify_user.top_tracks(time_range: 'short_term') #=> (Track array)
    # Check doc for more
  end
end
