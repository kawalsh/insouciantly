class Admin::PhotosController < ApplicationController
	http_basic_authenticate_with name: "kdubs", password: "ghbX!"
	layout "admin"

	def index
		@photos = Photo.all.order(:id => :desc)
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def new
		@photo = Photo.new
  	respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
	end

	def edit
		@photo = Photo.find(params[:id])
		if params[:commit] == "remove_tag"
			tag = Tag.find(params[:tag])
			tag.remove_photo(@photo)
		elsif params[:commit] == "add tag"
			tag = Tag.find_or_instantiate(params[:tag], params[:tag_type])
			tag.add_photo(@photo)
		end
	end

	def create
		@photo = Photo.new(photo_params)
    respond_to do |format|
	    if @photo.save
	      format.html { redirect_to edit_admin_photo_url(@photo) }
	      format.xml  { render :xml => @photo, :status => :created, :location => @photo }
	    else
	      format.html { render :action => "new" }
	      format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
	  	end
  	end
	end

	def update
		@photo = Photo.find(params[:id])
		respond_to do |format|
    	if @photo.update_attributes(photo_params)
    		format.html { redirect_to admin_photos_path }
    		format.xml  { head :ok }
    	else
    		format.html { render :action => "edit" }
    		format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
    	end
    end
	end

	private

	def photo_params
	  params.require(:photo).permit(:filename, :credits, :project_id, :blog_id, :fizz)
	end
end
