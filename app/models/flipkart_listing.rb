class FlipkartListing < ApplicationRecord
  validates :url, presence: true, uniqueness: true
end
