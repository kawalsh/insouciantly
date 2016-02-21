class BlogsController < ApplicationController

  def iframe
    @blog = Blog.friendly.find(params[:id])
    response.headers["X-FRAME-OPTIONS"] = "ALLOW-FROM http://bloglovin.com"
    render :partial => "iframe_blog", :locals => {:blog => @blog}, :layout => "iframe"
  end

  def index

  end

  def show
    @blog = Blog.friendly.find(params[:id])
  end

  def feed
    @blogs = Blog.where(:status => "posted").order("posted_at desc")
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

end
