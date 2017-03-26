class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :time
      t.string :vedio_link
      t.string :image_link

      t.timestamps null: false
    end
  end
end
