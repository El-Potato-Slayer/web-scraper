require './lib/scraper'

describe '#initialize?' do
  scraper = Scraper.new("https://www.google.com")

  it 'checks if the url is parsed into a Tempfile' do
    expect(scraper.instance_variable_get(:@page)).to be_an URI::HTTPS
  end

  it 'checks if the Tempfile is parsed into a Nokogiri HTML document' do
    expect(scraper.instance_variable_get(:@doc)).to be_an Nokogiri::HTML::Document
  end
end