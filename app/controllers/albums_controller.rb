class AlbumsController < ApplicationController
	def create
		Album.create(post_params)
		redirect_to root_path
	end

	def show
		@album = Album.find(params[:id])
	end

	private
	def post_params
		params.require(:album).permit(:name, :image, :owner, :user_id)
	end
end
