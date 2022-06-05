require 'rails_helper'

RSpec.describe Api::V1::FlipkartListingsController, type: :request do
  describe '#index' do
    let(:listing) do
      { data: [{
            id: '1',
            type: 'flipkart_listing',
            attributes: {
              id: 1,
              url: 'test',
              title: 'Baby Moo Sleeping Bag Flying Animals Pink Sleeping Bag',
              description: 'Warm, comfortable, soft and safe.',
              price: '220.99'
            }
          }]
      }
    end
    let(:json) { FlipkartListingSerializer.new(listing) }

    before do
      create :flipkart_listing
    end
    it 'renders' do
      get api_v1_flipkart_listings_path
      expect(response.body).to eq listing.to_json
      expect(response).to have_http_status(:ok)
    end
  end
end
