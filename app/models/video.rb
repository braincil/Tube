class Video < ActiveRecord::Base
	before_create :video_info
	validates :link, presence: true



	def video_info
		begin
			client = YouTubeIt::Client.new(dev_key: 'AIzaSyDPecwzHBUXnzu49P5HKWYev1GcSX8qlio' )	
			video = client.video_by(link)
			self.title = video.title
			self.likes = video.rating.likes
			self.dislikes = video.rating.dislikes

		end
	end
end