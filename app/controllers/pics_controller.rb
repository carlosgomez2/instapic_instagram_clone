class PicsController < ApplicationController
  before_action :set_picture

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def new
    @pic = Pic.new
  end

  def show
  end

  def create
    @pic = Pic.new(pic_params)

    if @pic.save
      redirect_to @pic, notice: "Yay! Uploaded success!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: "Congrats! Pic was updated."
    else
      render 'edit'
    end
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description)
  end

  def set_picture
    @pic = Pic.find(params[:id]) if params[:id]
  end

end
