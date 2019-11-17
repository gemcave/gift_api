class GiftsController < ApplicationController
	def index
		gifts = Gift.all
		render json: { gifts: gifts }, status: 200
  end

	def create
		gift = Gift.new(gifts_params)
		if gift.save
			render json: gift, status: 200
		else
			render json: {message: gift.errors.full_messages}, status: 400
		end
	end
	
	private

	def gifts_params
		params.require(:gifts).permit(:name)
	end
end
