class AddListingIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :listing_id, :integer
  end
end
