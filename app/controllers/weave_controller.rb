class WeaveController < ApplicationController

	def index
		@featured_blog = Blog.featured_blogs("weave")[0]
		@weave_feed = Blog.featured_blogs("weave", 5)
	end

end
