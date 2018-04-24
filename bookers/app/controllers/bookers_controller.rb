class BookersController < ApplicationController

  def top
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
    booker.user_id = current_user.id
    booker.save
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



end
