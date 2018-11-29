class PlaylistController < ActionController::Base

	def collect
		#collects user preferences
		@hash = params.to_unsafe_h[:hash]
		puts "IN COLLECT HASH IS #{@hash}"
		render 'collect'
	end

	def parse

		# Assuming the user typed in the name/selected a seed track (input: name), limited to one as of now

		@playlist = {track: "Under the Sea", artist: "Taylor Swift", genre: "rock"}
		@track = RSpotify::Base.search(@playlist[:track], 'track', limit: 1) # using song keywords to get song id
		@t_id = @track.first.id # since the call above returns an array of (presumably) 1 track artist

		# do the same thing to get the artist id
		@artist = RSpotify::Base.search(@playlist[:artist], 'artist', limit: 1)
		@a_id = @artist.first.id

		#try to valiate that id's are strings, though they naturally should be
		@playlist.seed_tracks = [@t_id]
		@playlist.seed_artists = [@a_id]
		@playlist.seed_genres = [@playlist[:genre]]

		# @max_acousticness = params[:acousticness] # form submission format might be different
		# @max_danceability = params[:danceability]
		# @max_energy = params[:energy]
		# @max_instrumentalness = params[:instrumentalness]
		# @max_liveness = params[:liveness]


		@max_acousticness = 0.5 # form submission format might be different
		@max_danceability = 0.5

		@max_energy = 0.5
		@max_instrumentalness = 0.7
		@max_liveness = 0.2


	end


	def generate
		@hash = params[:hash]
		@spotify_user = RSpotify::User.new(@hash)

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

    #recommendations = RSpotify::Recommendations.generate(seed_artists: [@t_id], seed_tracks: [@a_id], max_acousticness: @max_acousticness, max_danceability: @max_danceability, max_energy: @max_energy, max_instrumentalness: @max_instrumentalness, max_liveness: @max_liveness) #target_loudness: @max_loudness
    recommendations = RSpotify::Recommendations.generate(seed_artists: ['4NHQUGzhtTLFvgF5SZesLK'], seed_tracks: ['0c6xIDDpzE81m2q797ordA'], max_acousticness: @max_acousticness, max_danceability: @max_danceability, max_energy: @max_energy, max_instrumentalness: @max_instrumentalness, max_liveness: @max_liveness) #target_loudness: @max_loudness)


    @new_playlist = @spotify_user.create_playlist!('Recommendations 1')
		puts "NEW PLAYLIST !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! #{@new_playlist}"
    #puts "PLAYLIST: #{playlist}"
    @new_playlist.add_tracks!(recommendations.tracks)

	end
end
