#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "DressInsouciantly"
    xml.author "Kelly Walsh"
    xml.description "Sewing, Weaving, Reading, Random"
    xml.link "https://www.dressinsouciantly.com"
    xml.language "en"

    for article in @blogs
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        xml.author "Kelly Walsh"
        xml.pubDate article.posted_at.to_s(:rfc822)
        xml.link "https://www.dressinsouciantly.com/blogs/" + article.id.to_s
        xml.guid article.id

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
