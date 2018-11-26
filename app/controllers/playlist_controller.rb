class PlaylistController < ActionController::Base


	def parse
		@playlist = Playlist.create(user_params) 
		# Assuming the user typed in the name/selected a seed track (input: name), limited to one as of now

		@track = RSpotify::Base.search(@playlist[:track], 'track', limit: 1) # using song keywords to get song id
		@t_id = @track.first.id # since the call above returns an array of (presumably) 1 track artist

		# do the same thing to get the artist id
		@artist = RSpotify::Base.search(@playlist[:artist], 'artist', limit: 1)
		@a_id = @artist.first.id

		# try to valiate that id's are strings, though they naturally should be
		@playlist.seed_tracks = [@t_id] 
		@playlist.seed_artists = [@a_id]
		@playlist.seed_genres = [@playlist[:genre]] #@R - easiest way to do this would be a drop down, so I'm going to assume drop down	
	end

	def user_params
		#params.require(:preference).permit(:, :ndex) # should require certain form responses?
		#more so R's thing
	end

	def generate
		# 
		recommendations = RSpotify::Recommendations.generate(seed_tracks: @playlist.seed_tracks, seed_genres: @playlist.seed_genres, seed_artists: @playlist.seed_artists, target_energy: 1.0)
	end
end