class CreateInfoDishes < ActiveRecord::Migration
  def change
    create_table :info_dishes do |t|
      t.string :place
      t.integer :dish_id
      t.string :nutrition
      t.string :description

      t.timestamps null: false
    end
  end
end
