class Book < ActiveRecord::Base
	belongs_to :blog
	require 'open-uri'

	def tags
		return self.blog.tags.where(:tag_type => "genre")
	end

	def gr_api
		unless self.gr_id.nil?
			begin
			  doc = Nokogiri::XML(open("https://www.goodreads.com/book/show/#{self.gr_id}?key=ce4utqaMUHy6JrwVcSijQ&"))
			  title = doc.xpath('//title')[0].content
				link = doc.xpath('//link')[0].content
				author = doc.xpath('//author//name')[0].content
				author_url = doc.xpath('//author//link')[0].content
				img_url = doc.xpath('//image_url')[0].content
				return {:title => title, :link => link, :author => author, :author_url => author_url, :img_url => img_url}
			rescue
				return false
			end
		end
		return false
	end
end
