class Blog < ActiveRecord::Base
	belongs_to :project
	has_many :books
	has_many :photos
	has_and_belongs_to_many :tags

	def fizz_photo
		return Photo.where(:blog_id => self.id, :fizz => true).take
	end

	def book
		return Book.where(:blog_id => self.id).take
	end

	def self.featured_blogs(page, limit = 1)
		return Blog.joins(blogs_tags: :tag).where("blogs.status = 'posted'").where("tags.tag_type = 'page' and tags.tag = ?", page).order("blogs.posted_at DESC").take(limit)
	end

end
