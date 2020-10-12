require './lib/product'

describe '#initialize?' do
  product = Product.new('Swagger Bagger', '$15000')

  it "checks if name was correctly initialized to 'Swagger Bagger'" do
    expect(product.instance_variable_get(:@name)).to eq('Swagger Bagger')
  end

  it 'checks if name was correctly initialized to a String' do
    expect(product.instance_variable_get(:@name)).to be_a String
  end

  it "checks if price was correctly initialized to '$15000'" do
    expect(product.instance_variable_get(:@price)).to eq('$15000')
  end

  it 'checks if price was correctly initialized to a String' do
    expect(product.instance_variable_get(:@price)).to be_a String
  end
end
