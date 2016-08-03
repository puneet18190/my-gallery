class HomeController < ApplicationController
  def index
  	@data = Picture.all.sort_by(&:created_at)
  end

  def upload
  	@data = Picture.new
  end

  def upload_image
  	obj = Picture.new
  	obj.image = params[:picture][:image]
  	obj.save
  	redirect_to root_url
  end
end
