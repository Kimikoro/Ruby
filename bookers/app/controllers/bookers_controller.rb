class BookersController < ApplicationController

before_action :authenticate_user!, except: [:top, :about]
before_action :correct_user, only: [:edit, :update]

  def top
  end
  
  def about
  end



  def new
    @booker = Booker.new
  end

  def create
    booker = Booker.new(booker_params)
    booker.user_id = current_user.id
    booker.save
    redirect_to bookers_path
  end

  

  def index
    @booker = Booker.new
    @bookers = Booker.all
  end

  def show
    @booker = Booker.new
    @post = Booker.find(params[:id])
  end

  def edit
    @booker = Booker.find(params[:id])
  end

  def update
    booker = Booker.find(params[:id])
    booker.update(booker_params)
    redirect_to bookers_path
  end

  def destroy
    booker = Booker.find(params[:id])
    booker.destroy
    redirect_to bookers_path
  end

  private 
   def booker_params
    params.require(:booker).permit(:title, :body, :user_id)
  end
  def correct_user
    user = Booker.find(params[:id])       # URLのidをもとにBookerモデルから1つレコードを取り出す
    if current_user.id != user.user.id    # 現在のユーザーのidカラムの値が上で取り出したレコードのユーザーのidが違ったらリダイレクト
      redirect_to booker_path
    end
    end


end
