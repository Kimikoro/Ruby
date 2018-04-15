class CupsController < ApplicationController
  def top
  end

  def new
    @cup = Cup.new
    @cups = Cup.all
  end

  def create
    cup = Cup.new(cup_params)
    cup.save
    redirect_to cups_main_path
  end

  def index
    # @cup = Cup.find(params[:id])
  end

  def show
    @cup = Cup.find(params[:id])
  end

  def edit
    @cup = Cup.find(params[:id])
  end

  def update
  cup = Cup.find(params[:id])
  cup.update(cup_params)
  flash[:notice] = "Book was successfully updated."
  redirect_to cup_path(cup.id)
end




  def destroy
    cup = Cup.find(params[:id])
    cup.destroy
    redirect_to cups_main_path(cup.id)
  end

  private
  def cup_params
  params.require(:cup).permit(:title, :body)
  end

end

