class SewController < ApplicationController

	def index
		@featured_blog = Blog.featured_blogs("sew")[0]
		@sew_feed = Blog.featured_blogs("sew", 5)
	end

end
