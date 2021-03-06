class TagsController < ApplicationController

  def index
    if params[:commit] == "search"
      @tags = Tag.where(:tag => params[:tag_phrase])
      unless @tags.nil? or @tags.length > 1
        redirect_to tag_path(@tags[0], :view => params[:view])
      end
    end
  end

  def show
    @tag = Tag.friendly.find(params[:id])
    if params[:view].nil? or params[:view] == ""
      if @tag.tag_type == "page"
        params[:view] = "blogs"
      elsif @tag.tag_type == "pattern"
        pattern = Pattern.where(name: @tag.tag).take
        redirect_to pattern_path(pattern)
      elsif @tag.tag_type == "company" or @tag.tag_type == "archive"
        params[:view] = "companies"
      elsif @tag.tag_type == "genre"
        params[:view] = "books"
        @books = @tag.books
      end
    end
    @blogs = @tag.blogs.where(:status => "posted").order("posted_at DESC")
    @photos = @tag.photos
    @projects = @tag.projects
  end

end
