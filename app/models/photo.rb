class Photo < ActiveRecord::Base
	belongs_to :project
	belongs_to :blog
	has_and_belongs_to_many :tags, -> { order "tags.tag" }

	def filepath
		if self.project_id
			return "https://s3-us-west-2.amazonaws.com/insouciantly/project_photos/#{self.project_id}/#{self.filename}"
		elsif self.blog_id
			return "https://s3-us-west-2.amazonaws.com/insouciantly/blog_photos/#{self.blog_id}/#{self.filename}"
		else
			return "https://s3-us-west-2.amazonaws.com/insouciantly/photos/#{self.filename}"
		end
	end

	def associated_tags
		tags = []
		if self.project
			self.project.tags.each do |t|
				if !tags.include?(t)
					tags << t
				end
			end
			self.project.photos.each do |p|
				p.tags.each do |t|
					if !tags.include?(t)
						tags << t
					end
				end
			end
		end
		if self.blog
			self.blog.tags.each do |t|
				if !tags.include?(t)
					tags << t
				end
			end
			self.blog.photos.each do |p|
				p.tags.each do |t|
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
