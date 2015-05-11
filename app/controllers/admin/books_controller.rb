class Admin::BooksController < ApplicationController
	http_basic_authenticate_with name: "kdubs", password: "ghbX!"
	layout "admin"
	require 'open-uri'
	
	def index

	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		respond_to do |format|
			if @book.update_attributes(book_params)
				format.html { redirect_to admin_books_url }
				format.xml  { head :ok }
			else
				format.html { render :action => "edit" }
				format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
			end
		end
	end

	def new
		@book = Book.new
		respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book }
    end
	end

	def create
		@book = Book.new(book_params)
    respond_to do |format|
	    if @book.save
	      format.html { redirect_to admin_books_url }
	      format.xml  { render :xml => @book, :status => :created, :location => @book }
	    else
	      format.html { render :action => "new" }
	      format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
	  	end
  	end
	end

	private

	def book_params
	  params.require(:book).permit(:blog_id, :stars, :gr_id)
	end

end
