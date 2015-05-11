class AboutController < ApplicationController

	def index
		@featured_blog = Blog.featured_blogs("about")[0]
		@about_feed = Blog.featured_blogs("about", 5)
	end

end
