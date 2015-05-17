#encoding: UTF-8
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "DressInsouciantly"
    xml.description "Sewing, Weaving, Reading, Random"
    xml.link "https://www.dressinsouciantly.com"

    xml.image do
      xml.url image_tag("welcome.jpg")
      xml.title "DressInsouciantly"
      xml.description "Sewing, Weaving, Reading, Random"
      xml.link "https://www.dressinsouciantly.com"
      xml.width 144
      xml.heigh 57
    end

    for blog in @blogs
      xml.item do
        xml.title blog.title
        xml.pubDate blog.posted_at.to_s(:rfc822)
        xml.link blog_url(blog)
        xml.guid blog_url(blog)

        image_url = image_tag(blog.fizz_photo.filepath, :class => "rss")
        image_caption = blog.fizz_photo.credits
        image_align = ""
        image_tag = "<p><img src='#{image_url}' alt='#{image_caption}' title='#{image_caption}' align='#{image_align}' /></p>"
        text = image_tag + blog.body
        xml.description text
      end
    end
  end
end
