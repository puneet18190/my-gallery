class PicturesController < ApplicationController
	def index
		@data = Picture.all
	end

	def create
		obj = Picture.new
	  	obj.image = params[:picture][:image]
	  	obj.save
	  	redirect_to root_url
	end

	def new
		@data = Picture.new
	end

	def destroy
		@pic = Picture.find(params[:id])
		id = @pic.image_url.split("/").last.split(".").first
		Cloudinary::Uploader.destroy(id)
		@pic.delete
		redirect_to "/pictures"
	end
end
