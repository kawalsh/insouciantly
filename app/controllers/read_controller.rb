class ReadController < ApplicationController

	def index
		@featured_blog = Blog.featured_blogs("book")[0]
		@read_feed = Blog.featured_blogs("book", 10)
		@latest_rec = Recommendation.where.not(status: "pending", book_id: nil).order(updated_at: :desc).take
	end

end
