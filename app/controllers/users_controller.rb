class UsersController < ApplicationController
	def index
		@users=User.page(params[:page]).per(2)	
	end
	def new
		@user=User.new
	end
	def show
		@user=User.find(params[:id])
	end
	def create
		user=User.new(params[:user])
		if user.save	
			session[:user_id] = user.id		
			redirect_to :root
		else
			# flash[:error]=@user.errors.full_messages
			render 'new'
		end
	end

end
