class AboutController < ApplicationController

	def index
		@featured_blog = Blog.featured_blogs("about")[0]
		@about_feed = Blog.featured_blogs("about", 5)
		@photos = Photo.joins(photos_tags: :tag).where("tags.tag = 'me'").order("id DESC")
	end

end
