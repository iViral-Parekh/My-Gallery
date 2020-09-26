class AlbumsController < ApplicationController
	def create
		album = Album.create(post_params)
		if album.errors.any?
			album.errors[:image].each do |error|
				flash[:alert] = error
			end
		else
			flash[:notice] = "Album Created Successfully"
		end
		redirect_to user_path(current_user)
	end

	def show
		@album = Album.find(params[:id])
	end

	def index
		@albums = Album.all.order(created_at: :desc)
	end

	private
	def post_params
		params.require(:album).permit(:name, :image, :owner, :user_id)
	end
end
