class ImagesController < ApplicationController
  def new
  	@image=Image.new
  end
  def create
  	image = Image.new :title => params[:image][:title],
  	                  :content => params[:image][:content]
  	upload = PhotoUploader.new
  	upload.store! params[:image][:src]
  	image.src = upload
  	if image.save
  		redirect_to "/"
  	else
  		flash[:notice] = "errors"
  		render :new
  	end
  end

  def show
    @image=Image.find_by_src(params[:src].to_s.split('/').last)
  end

  def index
  end
end
