class HomeController < ApplicationController
  def index
  	@albums = Album.all.order(created_at: :desc).limit(25)
  end
end
