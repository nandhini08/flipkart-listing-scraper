class FlipkartListingSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id, :url, :title, :description, :price
end
