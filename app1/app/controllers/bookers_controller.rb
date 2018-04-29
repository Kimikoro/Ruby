class BookersController < ApplicationController

  def top
  end

  def new
    @booker = Booker.new
    @bookers = Booker.all
  end

  def create
    booker = Booker.new(booker_params)
    booker.save
    redirect_to booker_path(booker.id), notice: "Book was successfully created."
  end

  def destroy
    booker = Booker.find(params[:id])
    booker.destroy
    redirect_to new_booker_path, notice: "Book was successfully destroyed."
  end

  def index
  end

  def show
    @booker = Booker.find(params[:id])
  end

  def edit
    @booker = Booker.find(params[:id])
  end

  def update
    booker = Booker.find(params[:id])
    booker.update(booker_params)
    redirect_to booker_path(booker.id), notice:"Book was successfully updated."
  end

  private
  def booker_params
    params.require(:booker).permit(:title, :body)
  end

end
