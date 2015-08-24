class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
	before_action :set_place, :only => [:show, :edit, :update, :destroy]
	before_action :authorize_place, :only => [:edit, :update, :destroy]

	def index
		# @places = Place.all
		@places = Place.paginate(:page => params[:page])
	end

	def new
		@place = Place.new
	end

	def create
		@place = current_user.places.create(p_params)
		if @place.valid?
			redirect_to root_path
		else
			render :new, :status => :unprocessable_entity
		end
	end

	def show
		# @place = Place.find(params[:id])
		@comment = Comment.new
		@photo = Photo.new
	end

	def edit
	end

	def update
		# @place = Place.find(params[:id])
		# if @place.user != current_user
		# 	return render :text => "Not allowed", :status => :forbidden
		# end


		@place.update_attributes(p_params)
		if @place.valid?
			redirect_to root_path
		else
			render :edit, :status => :unprocessable_entity
		end
	end

	def destroy
		# @place = Place.find(params[:id])
		# if @place.user != current_user
		#	return render :text => "Not allowed", :status => :forbidden
		# end
		
		@place.destroy
		redirect_to root_path
	end

	private
	def p_params
		params.require(:place).permit(:name, :address, :description)
	end

	def set_place
		@place = Place.find(params[:id])
	end

	def authorize_place
		if @place.user != current_user
			return render :text => "Not allowed", :status => :forbidden
		end
	end

end
