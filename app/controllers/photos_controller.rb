class PhotosController < ApplicationController
	def create
		Photo.create(post_params)
		redirect_to user_path(current_user)
	end

	def new
		@album_id = params[:album_id]
	end

	private

	def post_params
		params.require(:photo).permit(:caption, :owner, :image, :album_id)
	end
end
