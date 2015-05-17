class Project < ActiveRecord::Base
	has_many :blogs, -> {order "blogs.posted_at desc"}
	has_many :photos
	has_and_belongs_to_many :tags, -> { order "tags.tag" }

	def fizz_photo
		return Photo.where(:project_id => self.id, :fizz => true).last
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
		self.blogs.each do |bl|
			bl.tags.each do |t|
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
