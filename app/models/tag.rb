class Tag < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slugged_title, use: :slugged
	has_and_belongs_to_many :blogs
  has_and_belongs_to_many :photos
  has_and_belongs_to_many :projects

	def slugged_title
		"#{tag_type} #{tag}"
	end

  def self.find_or_instantiate(tag, tag_type)
    t = Tag.where(:tag => tag, :tag_type => tag_type).first
    if t.nil?
      t = Tag.create(:tag => tag, :tag_type => tag_type)
    end
    return t
  end

  def remove_blog(blog)
    Tag.connection.execute("delete from blogs_tags where blog_id = #{blog.id} and tag_id = #{self.id}")
  end

  def add_blog(blog)
    Tag.connection.execute("insert into blogs_tags(blog_id, tag_id) values (#{blog.id}, #{self.id})")
  end

  def remove_photo(photo)
    Tag.connection.execute("delete from photos_tags where photo_id = #{photo.id} and tag_id = #{self.id}")
  end

  def add_photo(photo)
    Tag.connection.execute("insert into photos_tags(photo_id, tag_id) values (#{photo.id}, #{self.id})")
  end

  def remove_project(project)
    Tag.connection.execute("delete from projects_tags where project_id = #{project.id} and tag_id = #{self.id}")
  end

  def add_project(project)
    Tag.connection.execute("insert into projects_tags(project_id, tag_id) values (#{project.id}, #{self.id})")
  end

	def books
		books = []
		self.blogs.each do |b|
			b.books.each do |book|
				books << book
			end
		end
		if books.empty?
			return false
		end
		return books
	end

end
