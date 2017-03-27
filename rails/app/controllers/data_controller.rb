class DataController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def predict

  		image_url = params[:url]
  		 @predictions = Clarifai::Rails::Detector.new(image_url).image.tags_with_percent
  		 puts @predictions
  		 render :predict
  end


  def data
  	
	rawvegs_u = []
	length = params[:length].to_i
	
	while length >= 0

		rawvegs_u<<params["vegs"+length.to_s]
		length = length - 1;
	end



	if rawvegs_u 
		
		map = {}
	  	answer = []
	  	rawvegs_u.each do |veg|
	  		veg = RawVeg.where(:name => veg).first
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
puts " "
puts " "
puts " "
			  			puts priority
			  			puts rawvegs_u.length
			  			puts " "
			  			puts " "
			  			priority = priority.to_f / rawvegs_u.length
			  					
			  			entry = [dish.name , priority]
			  			
			  			answer<<entry
		  			end
		  		end
	  		end
	  	end
	end
  	@finalAnswer = []
  	
  	if answer
	  	answer.each do |ans|
	  		if ans.second > 0.4
	  			@finalAnswer << ans.first
	  		end
	  	end
  	end
  	render :answer

  end

end