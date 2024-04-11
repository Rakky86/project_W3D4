require 'httparty'
require 'nokogiri'




def get_crypto_prices
    response = HTTParty.get('https://coinmarketcap.com/all/views/all/')
    parsed_html = Nokogiri::HTML(response.body)
  
    crypto_prices = []
  
    parsed_html.css('.cmc-table-row').each do |row|
      name = row.css('.cmc-link').text.strip
      price = row.css('.cmc-table__cell--sort-by__price').text.strip.gsub(',', '').to_f
  
      crypto_prices << { name => price } unless name.empty?
    end
  
    crypto_prices
  end
  
  crypto_prices = get_crypto_prices
  
  crypto_prices.each do |crypto|
    puts crypto
  end

  puts "#{get_crypto_prices}"
  