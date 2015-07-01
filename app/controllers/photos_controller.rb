class PhotosController < ApplicationController
	# before filter
	before_action :authenticate_user!
	
	# create action for Photos controller
	def create
		# @place is assigned to Place by place_id
		@place = Place.find(params[:place_id])
		
		# photo is created according to the parameters 
		# set by pht_params below
		# NO MORE => photo is also associated with current user
		@place.photos.create(pht_params)
		
		# redirect to place page
		redirect_to place_path(@place)
		
	end

	private
	# parameters set for photos that permit 
	# only message and rating
	def pht_params
		params.require(:photo).permit(:caption, :picture)
	end

end
