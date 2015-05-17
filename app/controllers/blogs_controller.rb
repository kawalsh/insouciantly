class BlogsController < ApplicationController

  def index

  end

  def show
    @blog = Blog.find(params[:id])
  end

  def feed
    @blogs = Blog.where(:status => "posted").order("posted_at desc")
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

end
