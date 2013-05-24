module SessionsHelper
	def current_user
		if session[:user_id].present?
			@user ||= User.where(id: session[:user_id]).first
		end
	end
end
