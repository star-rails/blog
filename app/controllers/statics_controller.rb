class StaticsController < ApplicationController
	def home
		@images = Image.page(params[:page]).per(4)
	end

	def index		
	end

	def show		
	end
	def new
		
	end
end
