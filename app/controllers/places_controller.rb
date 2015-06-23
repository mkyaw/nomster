class PlacesController < ApplicationController

	def index
		# @posts = Place.all
		@places = Place.paginate(:page => params[:page])

	end

	def new
		@place = Place.new
	end

end
