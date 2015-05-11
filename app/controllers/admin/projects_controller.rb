class Admin::ProjectsController < ApplicationController
	http_basic_authenticate_with name: "kdubs", password: "ghbX!"
	layout "admin"

	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
  	respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
	end

	def edit
		@project = Project.find(params[:id])
		if params[:commit] == "remove_tag"
			tag = Tag.find(params[:tag])
			tag.remove_project(@project)
		elsif params[:commit] == "add tag"
			tag = Tag.find_or_instantiate(params[:tag], params[:tag_type])
			tag.add_project(@project)
		end
	end

	def create
		@project = Project.new(project_params)
    respond_to do |format|
	    if @project.save
	      format.html { redirect_to admin_projects_path }
	      format.xml  { render :xml => @project, :status => :created, :location => @project }
       else
	      format.html { render :action => "new" }
	      format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
    	end
    end
	end

	def update
		@project = Project.find(params[:id])
		respond_to do |format|
    	if @project.update_attributes(project_params)
  			format.html { redirect_to admin_project_path(@project) }
    		format.xml  { head :ok }
    	else
    		format.html { render :action => "edit" }
    		format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
    	end
    end
	end

	private

	def project_params
	  params.require(:project).permit(:name, :short_description)
	end

end
