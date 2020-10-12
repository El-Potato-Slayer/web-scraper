require 'Nokogiri'
require 'open-uri'

class Scraper
  attr_accessor :page, :doc

  def initialize(page_url)
    @page = URI.parse(page_url)
    @doc = Nokogiri::HTML(@page.open)
  end
end
