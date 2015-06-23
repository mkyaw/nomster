class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update]

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

		if @place.user != current_user
			return render :text => "Not allowed", :status => :forbidden
		end
	end

	def update
		@place = Place.find(params[:id])
		if @place.user != current_user
			return render :text => "Not allowed", :status => :forbidden
		end


		@place.update_attributes(p_params)
		redirect_to root_path
	end

	def destroy
		@place = Place.find(params[:id])
		@place.destroy
		redirect_to root_path
	end

	private
	def p_params
		params.require(:place).permit(:name, :address, :description)
	end

end
