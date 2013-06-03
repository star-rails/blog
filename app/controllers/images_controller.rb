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
    @comment = Comment.new
    @comments = @image.comments
  end

  def index
  end

  def add_comment
    if params[:img_id]
      img = Image.find(params[:img_id].to_i)
      img.comments.create params[:comment].merge({:user_id=>current_user.id})
      redirect_to params[:ref]
    end
  end
end
