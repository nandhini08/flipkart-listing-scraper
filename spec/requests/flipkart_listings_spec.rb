require 'rails_helper'

RSpec.describe '/flipkart_listings', type: :request do

  let(:listing) {create(:flipkart_listing)}
  describe 'GET /index' do
    it 'renders a successful response' do
      get api_v1_flipkart_listings_url
      expect(response).to be_successful
    end

    it 'fetch all listings' do
      listing
      get api_v1_flipkart_listings_url
      expect(assigns(:listings)).to include(listing)
    end
  end
end
