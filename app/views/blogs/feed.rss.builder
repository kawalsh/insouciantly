#encoding: UTF-8
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "DressInsouciantly"
    xml.description "Sewing, Weaving, Reading, Random"
    xml.link "https://www.dressinsouciantly.com"

    xml.image do
      xml.url image_url("welcome.jpg")
      xml.title "DressInsouciantly"
      xml.description "Sewing, Weaving, Reading, Random"
      xml.link "https://www.dressinsouciantly.com"
      xml.width 144
      xml.height 57
    end

    for blog in @blogs
      xml.item do
        xml.title blog.title
        xml.pubDate blog.posted_at.to_s(:rfc822)
        xml.link blog_url(blog)+"/iframe"
        xml.guid blog_url(blog)+"/iframe"

        image_url = image_url(blog.fizz_photo.filepath)
        image_caption = blog.fizz_photo.credits
        image_align = ""
        image_tag = "<img src='#{image_url}' alt='' width='100%'><br />"
        text = image_tag + blog.body
        xml.description text
      end
    end
  end
end
