class LearnController < ApplicationController

	def index
		@featured_blog = Blog.featured_blogs("tutorial")[0]
		@learn_feed = Blog.featured_blogs("tutorial", 10)
	end

end
