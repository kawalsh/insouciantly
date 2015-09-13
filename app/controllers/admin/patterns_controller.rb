class Admin::PatternsController < ApplicationController
	http_basic_authenticate_with name: "kdubs", password: "ghbX!"
	layout "admin"
	require 'open-uri'

	def index
    @patterns = Pattern.all
	end

	def edit
		@pattern = Pattern.find(params[:id])
	end

	def update
		@pattern = Pattern.find(params[:id])
		respond_to do |format|
			if @pattern.update_attributes(pattern_params)
				format.html { redirect_to admin_patterns_url }
				format.xml  { head :ok }
			else
				format.html { render :action => "edit" }
				format.xml  { render :xml => @pattern.errors, :status => :unprocessable_entity }
			end
		end
	end

	def new
		@pattern = Pattern.new
		respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pattern }
    end
	end

	def create
		@pattern = Pattern.new(pattern_params)
    respond_to do |format|
	    if @pattern.save
	      format.html { redirect_to admin_patterns_url }
	      format.xml  { render :xml => @pattern, :status => :created, :location => @pattern }
	    else
	      format.html { render :action => "new" }
	      format.xml  { render :xml => @pattern.errors, :status => :unprocessable_entity }
	  	end
  	end
	end

	private

	def pattern_params
	  params.require(:pattern).permit(:name, :company, :stars, :review, :man_link)
	end

end
