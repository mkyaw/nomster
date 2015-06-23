class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]

	def index
		# @places = Place.all
		@places = Place.paginate(:page => params[:page])

	end

	def new
		@place = Place.new
	end

	def create
		current_user.places.create(p_params)
		redirect_to root_path
	end

	def show
		@place = Place.find(params[:id])
	end

	def edit
		@place = Place.find(params[:id])
	end

	private
	def p_params
		params.require(:place).permit(:name, :address, :description)
	end

end
