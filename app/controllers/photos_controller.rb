class PhotosController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :show]
	def create
		photo = Photo.new(post_params)
		flash[:alert] = photo.errors[:image].first unless photo.save
		redirect_to user_path(current_user)
	end

	def new
		@album_id = params[:album_id]
	end

	def show
		@photo = Photo.find(params[:id])
	end

	private

	def post_params
		params.require(:photo).permit(:caption, :owner, :image, :album_id)
	end
end
