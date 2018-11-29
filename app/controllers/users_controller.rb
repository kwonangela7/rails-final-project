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
  end
end
