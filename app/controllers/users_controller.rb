class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@albums = current_user.present? ? current_user.albums.order(created_at: :desc) : Album.all.order(created_at: :desc)
		count = 0
		@albums.each do |album|
			count += album.photos.count
		end
		@photos_count = count
	end
end
