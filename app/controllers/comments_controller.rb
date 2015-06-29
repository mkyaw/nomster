class CommentsController < ApplicationController
	
	# before filter
	before_action :authenticate_user!
	
	# create action for Comments controller
	def create
		# @place is assigned to Place by place_id
		@place = Place.find(params[:place_id])
		
		# comment is created according to the parameters 
		# set by cmt_params below
		@place.comments.create(cmt_params.merge(:user => current_user))

		# redirect to place page
		redirect_to place_path(@place)
	end

	private
	# parameters set for comments that permit 
	# only message and rating
	def cmt_params
		params.require(:comment).permit(:message, :rating)
	end
end
