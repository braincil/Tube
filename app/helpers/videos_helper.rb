module VideosHelper

	def embed (link)
		youtube_id =  /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
		content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{link}")		 
	end

end
