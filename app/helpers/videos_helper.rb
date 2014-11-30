module VideosHelper

	def embed (link)
		link_id = link.split("=").last
		content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{link_id}")		 
	end

end
