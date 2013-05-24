class StaticsController < ApplicationController
	def home
		@images = Image.all
	end

	def index		
	end

	def show
		
	end
end
