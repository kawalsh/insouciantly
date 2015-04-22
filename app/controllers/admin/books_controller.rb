class Admin::BooksController < ApplicationController
	http_basic_authenticate_with name: "kdubs", password: "ghbX!"
end