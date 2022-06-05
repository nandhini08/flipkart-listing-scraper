module Api
  module V1
    class FlipkartListingsController < ApplicationController
      require 'nokogiri'
      include ScraperHelper

      protect_from_forgery with: :null_session
      def index
        @listings = FlipkartListing.all
        render json: FlipkartListingSerializer.new(@listings).serialized_json
      end

      def scrape_data
        scraped_data = FlipkartListing.new
        url = params[:url]
        updated_scraped_data = scrape_data_from_url(url, scraped_data)
        if updated_scraped_data.save
          render json: FlipkartListingSerializer.new(updated_scraped_data)
        else
          render json: "Error in scraping listing - Please retry", status: :unprocessable_entity
        end
      end

      def scraper_params
        params.permit(:url)
      end
    end
  end
end
