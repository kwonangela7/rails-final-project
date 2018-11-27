class PlaylistController < ActionController::Base


	def parse

		# commented out since we're not using seeds in our recommender, just attributes.
		# Assuming the user typed in the name/selected a seed track (input: name), limited to one as of now
		# @track = RSpotify::Base.search(@playlist[:track], 'track', limit: 1) # using song keywords to get song id
		# @t_id = @track.first.id # since the call above returns an array of (presumably) 1 track artist

		# # do the same thing to get the artist id
		# @artist = RSpotify::Base.search(@playlist[:artist], 'artist', limit: 1)
		# @a_id = @artist.first.id

		# try to valiate that id's are strings, though they naturally should be
		# @playlist.seed_tracks = [@t_id] 
		# @playlist.seed_artists = [@a_id]
		# @playlist.seed_genres = [@playlist[:genre]] 
	
		# @max_acousticness = params[:acousticness] # form submission format might be different
		# @max_danceability = params[:danceability]
		# @max_energy = params[:energy]
		# @max_instrumentalness = params[:instrumentalness]
		# @max_liveness = params[:liveness]
		# @max_loudness = params[:loudness]

		@max_acousticness = 0.5 # form submission format might be different
		@max_danceability = 0.5 
		@max_energy = 0.5
		@max_instrumentalness = 0.7
		@max_liveness = 0.2
		#@max_loudness = params[:loudness] # Values typical range between -60 and 0 db.


	end

	# def user_params
	# 	#params.require(:preference).permit(:, :ndex) # should require certain form responses?
	# 	#more so R's thing
	# end

	def generate
		recommendations = RSpotify::Recommendations.generate(seed_artists: ['4NHQUGzhtTLFvgF5SZesLK'], seed_tracks: ['0c6xIDDpzE81m2q797ordA'])#, max_acousticness: @max_acousticness, max_danceability: @max_danceability, max_energy: @max_energy, max_instrumentalness: @max_instrumentalness, max_liveness: @max_liveness) #target_loudness: @max_loudness) 
		@recs = recommendations
		@tracks = recommendations.tracks.present? # find out how to display this
	end
end