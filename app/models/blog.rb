class Blog < ActiveRecord::Base
	extend FriendlyId
	friendly_id :slugged_title, use: :slugged
	belongs_to :project
	has_many :books
	has_many :photos
	has_and_belongs_to_many :tags, -> { order "tags.tag" }

	def slugged_title
		slug = ""
		if self.posted_at
			slug += "#{self.posted_at.strftime('%Y%m%d')} "
		end
		if self.page
			slug += "#{self.page} "
		end
		if !self.title.nil?
			slug += "#{self.title}"
		end
		if slug.blank?
			slug += "#{self.id}-untitled"
		end
		return slug
	end

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
		return "dress"
	end

	def patterns
		patterns = []
		self.tags.each do |tag|
			if tag.tag_type == "pattern"
				patterns << Pattern.where(name: tag.tag).take
			end
		end
		return patterns
	end

	def associated_tags
		tags = []
		if !self.photos.blank?
			self.photos.each do |p|
				p.tags.each do |t|
					if !tags.include?(t)
						tags << t
					end
				end
			end
		end
		if !self.project.nil?
			self.project.tags.each do |t|
				if !tags.include?(t)
					tags << t
				end
			end
		end
		if !self.books.blank?
			self.books.each do |b|
				b.tags.each do |t|
					if !tags.include?(t)
						tags << t
					end
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
