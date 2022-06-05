module ScraperHelper
  require 'net/http'
  require 'nokogiri'

  def scrape_data_from_url(url, scraped_data)
    doc = Nokogiri::HTML(Net::HTTP.get(URI(url)))
    scraped_data.url = url
    scraped_data.title = doc.css('.B_NuCI')&.inner_text
    scraped_data.description = doc.css('._1mXcCf')&.text
    scraped_data.price = doc.css('._30jeq3._16Jk6d')&.text&.delete("^0-9")
    scraped_data.last_fetched_at = Time.now
    scraped_data
  end

end
