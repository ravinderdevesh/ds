class CreateRawVegs < ActiveRecord::Migration
  def change
    create_table :raw_vegs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
