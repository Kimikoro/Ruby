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
	    @user.update(user_params)
	    redirect_to user_path(@user.id)
	end

	def show
		@user = User.find(params[:id])
		@booker = Booker.new
		@bookers = @user.bookers.all
	end

	def create
    booker = Booker.new(booker_params)
    booker.user_id = current_user.id
    booker.save
    redirect_to bookers_path
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
