class Blog < ActiveRecord::Base
	belongs_to :project
	has_many :books
	has_many :photos
	has_and_belongs_to_many :tags, -> { order "tags.tag" }

	def fizz_photo
		return Photo.where(:blog_id => self.id, :fizz => true).take
	end

	def not_fizz_photos
		if self.photos.length > 1
			return Photo.where(:blog_id => self.id, :fizz => false)
		end
		return false
	end

	def book
		return Book.where(:blog_id => self.id).take
	end

	def self.featured_blogs(page, limit = 1)
		return Blog.joins(blogs_tags: :tag).where("blogs.status = 'posted'").where("tags.tag_type = 'page' and tags.tag = ?", page).order("blogs.posted_at DESC").take(limit)
	end

	def page
		self.tags.each do |tag|
			if tag.tag_type == "page"
				return tag.tag
			end
		end
	end

	def associated_tags
		tags = []
		self.photos.each do |p|
			p.tags.each do |t|
				if !tags.include?(t)
					tags << t
				end
			end
		end
		self.project.tags.each do |t|
			if !tags.include?(t)
				tags << t
			end
		end
		self.books.each do |b|
			b.tags.each do |t|
				if !tags.include?(t)
					tags << t
				end
			end
		end
		self.tags.each do |t|
			if tags.include?(t)
				tags.delete(t)
			end
		end
		return tags
	end

end