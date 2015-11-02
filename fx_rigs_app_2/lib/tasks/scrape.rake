require 'nokogiri' # gem install nokogiri
require "open-uri"

DOMAIN = "http://www.gear4music.com"


def parse_product_page(page_uri, category)
  page = Nokogiri::HTML(open(DOMAIN + page_uri))
  title = page.css("h1.product").text.encode('ISO-8859-1')
  price = page.css(".main-price .c-val").text.encode('ISO-8859-1')
  image_url = page.css(".main-image").attr("src").to_s.encode('ISO-8859-1')
  short_description = page.css(".short-description").text.encode('ISO-8859-1')

  puts "-----" * 20
  puts "title (#{title})"
  puts "category (#{category})"
  puts "£#{price}"
  puts image_url
  puts short_description

  pedal = Pedal.find_or_create_by(title: title)

  pedal.category            = category
  pedal.price               = price
  pedal.image_url           = image_url
  pedal.short_description   = short_description 

  pedal.save

  # Pedal.create({
  #   title: title,
  #   price: price
  #   ## etc
  #   })
end

def parse_category_page(page_uri, category)
  page = Nokogiri::HTML(open(DOMAIN + page_uri))
  page.css(".result-list").css("li").each do |item| 
    product_uri = item.css("a")[0].attr("href")
    parse_product_page(product_uri, category)
  end
end

def main
  page = Nokogiri::HTML(open("http://www.gear4music.com/guitar-effects.html"))

  pedal_types = page.css(".brands-list")[0].css("li")

  pedal_types.each do |pedal_type|
    title = pedal_type.attr("title")
    uri = pedal_type.css("a").attr("href").value
    parse_category_page uri, title
  end
end


namespace :scrape do
  desc "TODO"
  task pedals: :environment do
    main
  end

end

