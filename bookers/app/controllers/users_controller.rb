class UsersController < ApplicationController

	def edit
		@user = User.find(params[:id])
	end

	def show
		@users = User.all
	end

	def index
		@users = User.all
	end
end
