require 'Nokogiri'
require 'open-uri'

class Scraper
  attr_reader :page, :doc

  def initialize(page_url)
    @page = URI.parse(page_url)
    @doc = Nokogiri::HTML(@page.open)
  end

  def add_product(selected_page, page_number)
    initialize(selected_page + page_number)
    arr = []
    product_listing = @doc.css('div.product-card')
    product_listing.each do |product|
      title = product.css('div.product-card__title').text
      price = 'R' + product.css('span.price-item--regular').text.delete_suffix("\n").split(' ')[-1]
      arr << Product.new(title, price)
    end
    arr
  end
end
