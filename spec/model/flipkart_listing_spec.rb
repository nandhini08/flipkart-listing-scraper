require 'rails_helper'

RSpec.describe FlipkartListing, type: :model do
  describe 'validations' do
    subject { create(:flipkart_listing) }
    it { is_expected.to validate_presence_of(:url)}
    it { is_expected.to validate_uniqueness_of(:url) }
  end
end
