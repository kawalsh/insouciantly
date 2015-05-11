class ReadController < ApplicationController

	def index
		@featured_blog = Blog.featured_blogs("book")[0]
		@read_feed = Blog.featured_blogs("book", 5)
	end

end
