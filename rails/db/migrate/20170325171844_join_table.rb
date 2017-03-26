class JoinTable < ActiveRecord::Migration
  def change
  	create_join_table :dishes, :raw_vegs
  end
end
