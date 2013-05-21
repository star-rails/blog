class SessionsController < ApplicationController
    def new
    	@user = User.new
    end

    def create
    	@user=User.new
        user=User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            flash[:success]="欢迎登录！"
            redirect_to users_path
        else
        	@user=User.new
            # flash[:error]=@user.error.full_messagess
            render 'new'
        end
    end
end
