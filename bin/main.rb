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

