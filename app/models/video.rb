class Video < ActiveRecord::Base
	before_create :video_info
	validates :link, presence: true



	def video_info
		begin
			client = YouTubeIt::Client.new(dev_key: 'AIzaSyDPecwzHBUXnzu49P5HKWYev1GcSX8qlio' )	
			video = client.video_by(link)
			self.title = video.title
			self.duration = the_duration(video.duration)
			self.author = video.author.name
			self.likes = video.rating.likes
			self.dislikes = video.rating.dislikes
		end
	end


	def poster
		link_id = link.split("=").last
		"https://img.youtube.com/vi/#{link_id}/hqdefault.jpg"
	end


	private
	 def the_duration(t)
	 	hours = (t/3600)
	 	min = ((t - ( hours * 3600)) / 60)
	 	sec = (t - (hours * 3600) - (min * 60))

	 	hours = '0' + hours.to_s if hours.to_i < 10
	 	min = '0' + min.to_s if min.to_i < 10
  		sec = '0' + sec.to_s if sec.to_i < 10
 
        hours.to_s + ':' + min.to_s + ':' + sec.to_s

	 end

end