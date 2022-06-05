task update_listings: :environment do
  include ScraperHelper
  old_data = FlipkartListing.where('last_fetched_at < ?', 1.week.ago)
  old_data.each do |data|
    new_scraped_data = scrape_data_from_url(data.url, data)
    new_scraped_data.save!
  end
end
