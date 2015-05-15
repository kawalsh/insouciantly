class Admin::BlogsController < ApplicationController
	http_basic_authenticate_with name: "kdubs", password: "ghbX!"
	layout "admin"

	def index
		@pending = Blog.where(:status => 'pending').order("created_at DESC")
	end

	def show
		@blog = Blog.find(params[:id])
	end

	def new
		@blog = Blog.new
  	respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blog }
    end
	end

	def edit
		@blog = Blog.find(params[:id])
		if params[:commit] == "remove_tag"
			tag = Tag.find(params[:tag])
			tag.remove_blog(@blog)
		elsif params[:commit] == "add tag"
			tag = Tag.find_or_instantiate(params[:tag], params[:tag_type])
			tag.add_blog(@blog)
		elsif params[:commit] == "publish"
			@blog.posted_at = Time.now
			@blog.status = "posted"
			@blog.save
			redirect_to root_url
			return
		end
	end

	def create
		@blog = Blog.new(blog_params)
    respond_to do |format|
	    if @blog.save
	      format.html { redirect_to admin_blog_url(@blog) }
	      format.xml  { render :xml => @blog, :status => :created, :location => @blog }
	    else
	      format.html { render :action => "new" }
	      format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
	  	end
  	end
	end

	def update
		@blog = Blog.find(params[:id])
		respond_to do |format|
    	if @blog.update_attributes(blog_params)
    		format.html { redirect_to edit_admin_blog_path(@blog) }
    		format.xml  { head :ok }
    	else
    		format.html { render :action => "edit" }
    		format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
    	end
    end
	end

	private

	def blog_params
	  params.require(:blog).permit(:title, :body, :project_id)
	end

end
