class WelcomeController < ApplicationController

  def index
    @blogs = Blog.where(:status => "posted").order("posted_at DESC").take(20)
  end
end
