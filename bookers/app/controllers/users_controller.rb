class UsersController < ApplicationController

	def edit
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
		@booker = Booker.new
	end

	
end
