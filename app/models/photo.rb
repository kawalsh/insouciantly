class Photo < ActiveRecord::Base
	belongs_to :project
	belongs_to :blog
	has_and_belongs_to_many :tags

	def filepath
		if self.project_id
			return "project_photos/#{self.project_id}/#{self.filename}"
		elsif self.blog_id
			return "blog_photos/#{self.blog_id}/#{self.filename}"
		else
			return "photos/#{self.filename}"
		end
	end


end
