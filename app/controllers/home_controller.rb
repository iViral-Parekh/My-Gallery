class HomeController < ApplicationController
  def index
  	@photos = Photo.all.order(created_at: :desc).limit(25)
  end
end
