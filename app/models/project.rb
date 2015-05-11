class Project < ActiveRecord::Base
	has_many :blogs
	has_many :photos
	has_and_belongs_to_many :tags

	def fizz_photo
		return Photo.where(:project_id => self.id, :fizz => true).take
	end

end
