class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@albums = current_user.albums.order(created_at: :desc)
	end
end
