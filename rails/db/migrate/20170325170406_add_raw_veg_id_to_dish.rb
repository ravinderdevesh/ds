class AddRawVegIdToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :raw_veg_id, :integer
  end
end
