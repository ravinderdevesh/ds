class AddDishIdToRawVeg < ActiveRecord::Migration
  def change
    add_column :raw_vegs, :dish_id, :integer
  end
end
