#encoding: UTF-8
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "DressInsouciantly"
    xml.description "Sewing, Weaving, Reading, Random"
    xml.link "https://www.dressinsouciantly.com"

    for article in @blogs
      xml.item do
        xml.title article.title
        xml.description article.body
        xml.pubDate article.posted_at.to_s(:rfc822)
        xml.link blog_url(article)
        xml.guid blog_url(article)

        text = article.body
		# if you like, do something with your content text here e.g. insert image tags.
		# Optional. I'm doing this on my website.
        if article.fizz_photo
            image_url = article.fizz_photo.filepath
            image_caption = article.fizz_photo.credits
            image_align = ""
            image_tag = "
                <p><img src='" + image_url +  "' alt='" + image_caption + "' title='" + image_caption + "' align='" + image_align  + "' /></p>
              "
            text = text.sub('{image}', image_tag)
        end
        xml.description "<p>" + text + "</p>"

      end
    end
  end
end
