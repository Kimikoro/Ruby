class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]



	def home
	    redirect_to user_path(current_user.id)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
	    if @user.update(user_params)
      	 redirect_to user_path(@user.id), success: "Successfully updated your Profile."
    	else
      	 redirect_to user_path(@user.id), danger: "Unfortunately failed to update."
   		end
	end

	def show
		# UserモデルからURLのIDに対応したレコードを取り出す？
		@user = User.find(params[:id])
		@booker = Booker.new
		# 取り出したレコードに対応したBookerモデルのすべてを取り出す？
		@bookers = @user.bookers.all
	end

	def create
  	end

	def index
		@users = User.page(params[:page]).reverse_order
		@booker = Booker.new
	end

	private
   	def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :user_id )
  	end
  	def booker_params
    params.require(:booker).permit(:title, :body, :user_id)
	end
	def correct_user
    user = User.find(params[:id])       # URLのidをもとにUserモデルから1つレコードを取り出す
    if current_user.id != user.id    # 現在のユーザーのidカラムの値が上で取り出したレコードのユーザーのidが違ったらリダイレクト
      redirect_to booker_path
    end
    end

end
