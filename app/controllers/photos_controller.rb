class PhotosController < ApplicationController
	before_action :authenticate_user!

	def create
		@place = Place.find(params[:place_id])
		
		@place.photos.create(pht_params.merge(:user => current_user))

		redirect_to place_path(@place)

	end

	private
	def pht_params
		params.require(:photo).permit(:caption)
	end
end
