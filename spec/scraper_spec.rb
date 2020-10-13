require './lib/scraper'

describe '#initialize?' do
  scraper = Scraper.new('https://www.google.com')

  it 'checks if the url is parsed into a Tempfile' do
    expect(scraper.instance_variable_get(:@page)).to be_an URI::HTTPS
  end

  it 'checks if the Tempfile is parsed into a Nokogiri HTML document' do
    expect(scraper.instance_variable_get(:@doc)).to be_an Nokogiri::HTML::Document
  end
end

describe Scraper do
  page = "https://www.sweetcity.co.za/collections/essentials-1?page="
  scraper = Scraper.new(page)
  
  describe "#add_product" do
    it "checks if items are added to arr" do
      expect(scraper.add_product(page, "1").count).to be > 0
    end

    it "should return an array" do
      expect(scraper.add_product(page, "1")).to be_an Array
    end
  end
end
