class PlacesController < ApplicationController

	def index
		# @posts = Place.all
		@places = Place.paginate(:page => params[:page])

	end

	def new
		@place = Place.new
	end

	def create
		Place.create(p_params)
		redirect_to root_path
	end

	private
	def p_params
		params.require(:place).permit(:name, :address, :description)
	end

end
