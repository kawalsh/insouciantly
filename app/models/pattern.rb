class Pattern < ActiveRecord::Base

  def tag
    return Tag.first(:conditions => "tag_type = 'pattern' and tag = '#{self.name}'")
  end

  def photos
    return Photo.joins(:tags).where(tags: {tag: self.name})
  end

  def blogs
    return Blog.joins(:tags).where(tags: {tag: self.name})
  end

  def projects
    return Project.joins(:tags).where(tags: {tag: self.name})
  end

  def line_art
    "https://s3-us-west-2.amazonaws.com/insouciantly/patterns/#{self.id}lineart.png"
  end


end
