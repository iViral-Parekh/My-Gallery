class PhotosController < ApplicationController
	def create
		photo = Photo.new(post_params)
		photo.save
		if photo.errors.any?
			photo.errors[:image].each do |error|
				flash[:alert] = error
			end
		else
			flash[:notice] = "Photo Uploaded Successfully"
		end
		if user_signed_in?
			redirect_to user_path(current_user)
		else
			redirect_to root_path
		end
	end

	def new
		@album_id = params[:album_id]
	end

	private

	def post_params
		params.require(:photo).permit(:caption, :owner, :image, :album_id)
	end
end
