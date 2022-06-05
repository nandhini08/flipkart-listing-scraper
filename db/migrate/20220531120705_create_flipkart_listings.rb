class CreateFlipkartListings < ActiveRecord::Migration[7.0]
  def change
    create_table :flipkart_listings do |t|
      t.text :url, null: false
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :mobile
      t.datetime :last_fetched_at
      t.timestamps
    end
  end
end
