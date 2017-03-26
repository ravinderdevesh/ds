class DataController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def data
  	rawvegs = params[:vegs]
	rawvegs_u = []
	rawvegs.each do |rv|
		rawvegs_u << rv.second
	end  	
	map = {}
  	answer = []
  	rawvegs.each do |veg|
  		veg = RawVeg.where(:name => veg.second).first
  		if veg
	  		dishes = veg.dishes
	  		dishes.each do |dish|
				if !map[dish.name] 
					map[dish.name] = true
		  			priority = 0
		  			d_vegs = dish.raw_vegs
		  			d_vegs.each do |v|
		  				if rawvegs_u.include? v.name
		  					priority = priority +1
		  				end
		  			end		
		  			priority = priority / rawvegs.length		
		  			entry = [dish.name , priority]
		  			answer<<entry
	  			end
	  		end
  		end
  	end

  	@finalAnswer = []
  	
  	answer.each do |ans|
  		if ans.second > 0.4
  			@finalAnswer << ans.first
  		end
  	end

  	render :answer

  end

end