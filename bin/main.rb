require_relative '../lib/product'
require_relative '../lib/scraper'
require 'tty-prompt'
require 'tty-progressbar'
require 'csv'

def select_category
  prompt = TTY::Prompt.new
  selected_page = prompt.select('Choose a category to scrape', cycle: true) do |menu|
    menu.choice 'Sweets & Gum', 'https://www.sweetcity.co.za/collections/sweets-gums?page='
    menu.choice 'Chocolates', 'https://www.sweetcity.co.za/collections/chocolates?page='
    menu.choice 'Snacks & Drinks', 'https://www.sweetcity.co.za/collections/essentials?page='
    menu.choice 'Gifts & Novelties', 'https://www.sweetcity.co.za/collections/essentials-1?page='
  end
  selected_page
end

def prompt_csv
  prompt = TTY::Prompt.new
  answer = prompt.select('Would you like to save the list to a csv file?', cycle: true) do |menu|
    menu.choice 'Yes', true
    menu.choice 'No', false
  end
  answer
end

def list_products(products)
  puts "\n\n"
  products.each_with_index do |product, index|
    puts "#{index + 1}. Name: #{product.name}\n    Price: #{product.price}\n\n"
  end
end

def generate_csv(file, arr)
  CSV.open(file + '.csv', 'w') do |csv|
    arr.each do |item|
      csv << [item.name, item.price]
    end
  end
end

selected_page = select_category

page_number = 1
scraper = Scraper.new("#{selected_page}#{page_number}")
last_page = scraper.doc.css('li.pagination__text').text.split(' ')[-1].to_i
total_products = scraper.doc.css('span.filters-toolbar__product-count').text.split(' ')[0].to_i
products = []

bar = TTY::ProgressBar.new 'loading [:bar] :percent' do |config|
  config.total = total_products
  config.width = 30
  config.complete = '█'
  config.head = ''
end
bar.ratio = 0.1

while page_number <= last_page
  products += scraper.add_product(selected_page, page_number.to_s)
  bar.advance((total_products / last_page).to_f.ceil)
  page_number += 1
end

list_products(products)

answer = prompt_csv
if answer
  puts 'Please enter the name of the file (files with the same name will be overwritten): '
  filename = gets.chomp
  generate_csv(filename, products)
end
