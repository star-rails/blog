class SessionsController < ApplicationController
    def new
    	@user = User.new
    end

    def create
    #   @user=User.new
    #   user=User.find_by_email(params[:user][:email])
    #     if user && user.authenticate(params[:user][:password])
    #         flash[:success]="欢迎登录！"
    #         redirect_to users_path
    #     else
    #         flash[:error]=@user.error.full_messagess
    #         render 'new'
    #     end
    	@user = User.where(params[:user]).first
    	puts "******************user=#{@user}"
        if @user.present?
        	session[:user_id] = @user.id
        	flash[:success]="欢迎登录！"       	

        else
	    	@user = User.new
        	session[:user_id] = nil
        	if session[:error_login_times].blank?
               session[:error_login_times] = 0
            else
                session[:error_login_times] += 1
        	end
    #       显示登录次数；
    #       puts "**************session[:error_login_times]=#{session[:error_login_times]}"
        	if session[:error_login_times]>2
        	    flash[:error]="请登录!！"
        	    session[:error_login_times] = 0
        	else
                flash[:error]="邮箱或密码错误！"
                return render 'new'
            end
    	end	 
        redirect_to :root
    end

    def destroy
    	session[:user_id] = @current_user = nil
    	redirect_to '/'
    end
end
