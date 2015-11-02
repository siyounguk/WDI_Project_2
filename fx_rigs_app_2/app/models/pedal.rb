class Pedal < ActiveRecord::Base
  has_and_belongs_to_many :rigs
  has_and_belongs_to_many :users


  require 'nokogiri' # gem install nokogiri
  require "open-uri"

  DOMAIN = "http://www.gear4music.com"




  def parse_product_page(page_uri, category)
    page = Nokogiri::HTML(open(DOMAIN + page_uri))
    title = page.css("h1.product").text
    price = page.css(".main-price .c-val").text
    image_url = page.css(".main-image").attr("src")
    short_description = page.css(".short-description").text

    puts "-----" * 20
    puts "title (#{category})"
    puts "£#{price}"
    puts image_url
    puts short_description

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
    agent = Mechanize.new

    page = Nokogiri::HTML(open("http://www.gear4music.com/guitar-effects.html"))

    pedal_types = page.css(".brands-list")[0].css("li")



    pedal_types.each do |pedal_type|
      title = pedal_type.attr("title")
      uri = pedal_type.css("a").attr("href").value
      parse_category_page uri, title
    end
  end
end
