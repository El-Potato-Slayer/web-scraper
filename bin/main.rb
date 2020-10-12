require_relative "../lib/product"
require_relative "../lib/scraper"
require 'tty-prompt'
require 'tty-progressbar'

def get_category
  prompt = TTY::Prompt.new
  selected_page = prompt.select("Choose a category to scrape", cycle: true) do |menu|
    menu.choice "Sweets & Gum", "https://www.sweetcity.co.za/collections/sweets-gums?page="
    menu.choice "Chocolates", "https://www.sweetcity.co.za/collections/chocolates?page="
    menu.choice "Snacks & Drinks", "https://www.sweetcity.co.za/collections/essentials?page="
    menu.choice "Gifts & Novelties", "https://www.sweetcity.co.za/collections/essentials-1?page="
  end
  selected_page
end

def add_product(selected_page, page_number)
  scraper = Scraper.new("#{selected_page}#{page_number}")
  arr = []
  product_listing = scraper.doc.css('div.product-card')
  product_listing.each do |product|
    title = product.css("div.product-card__title").text
    price = "R" + product.css("span.price-item--regular").text.delete_suffix("\n").split(" ")[-1]
    arr << Product.new(title, price)
  end
  arr
end

def list_products(products)
  puts "\n\n"
  counter = 1
  products.each do |product|
    puts "#{counter}. Name: #{product.name}\n    Price: #{product.price}\n\n"
    counter += 1
  end
end

selected_page = get_category()

page_number = 1
scraper = Scraper.new("#{selected_page}#{page_number}")
last_page = scraper.doc.css("li.pagination__text").text.split(" ")[-1].to_i
total_products = scraper.doc.css("span.filters-toolbar__product-count").text.split(" ")[0].to_i
products = []

bar = TTY::ProgressBar.new "[:bar] :percent" do |config|
  config.total = total_products
  config.width = 30 
  config.complete = "█"
  config.head = ""
end
bar.ratio = 0.1

while page_number <= last_page
  products += add_product(selected_page, page_number)
  bar.advance((total_products / last_page).to_f.ceil)
  page_number += 1
end

list_products(products)