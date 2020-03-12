class PagesController < ApplicationController
	





	def search
		if params[:search].blank?
			redirect_to(root_path, alert: "Empty field!") and return  
		else
			@parameter = params[:search].downcase.to_s
			@catpara = Category.where("lower(title) = ?",@parameter.downcase)
			@propara = Product.where("lower(title) = ?",@parameter.downcase)

			if @catpara.empty?
				if @propara.empty?
					@results="No Item Exists Please go back to home page"
				else 
					@results = Product.where("lower(title) = ?",@parameter.downcase).pluck(:title).flatten.join(' ').gsub(/[""]/,' ')
	 		    end
	 		else
	 			b=Category.where("lower(title) = ?",@parameter.downcase).ids
	 			Rails.logger.debug "************"
	 			Rails.logger.debug b
	 			b=b[0].to_i
	 			#Rails.logger.debug c
	 			@results=Category.find(b).products.pluck(:title).flatten.join(' ').gsub(/[""]/,' ')
	 			Rails.logger.debug "************"
	 			Rails.logger.debug @results
	 			
			end

		end
	end	
end








