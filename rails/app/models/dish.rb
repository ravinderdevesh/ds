class Dish < ActiveRecord::Base
	has_and_belongs_to_many :raw_vegs
	has_one :info_dish 
end
