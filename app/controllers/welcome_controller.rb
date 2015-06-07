class WelcomeController < ApplicationController

  def index
    if params[:page].nil?
      params[:page] = 1
    end
    logger.info "in controller, page is #{params[:page]}"
    @blogs = Blog.where(:status => "posted").paginate(:page => params[:page], :per_page => 12).order("posted_at DESC")
  end
end
