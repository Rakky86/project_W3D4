
require 'httparty'
require 'nokogiri'

def extract_emails(url)
  response = HTTParty.get(url)
  parsed_html = Nokogiri::HTML(response.body)
  
 
  links = parsed_html.xpath("/html/body/div[1]/main/div/div/div/section[2]/div/ul/li/a")


  emails = []

  links.each do |link|
    emails << link.text.strip
  end

  emails
end


url = 'https://www.assemblee-nationale.fr/dyn/deputes/PA605036'
emails = extract_emails(url)


puts emails


