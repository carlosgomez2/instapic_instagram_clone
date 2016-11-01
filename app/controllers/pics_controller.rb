class PicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_picture, only: [:show, :edit, :update, :destroy, :upvote]

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def new
    @pic = current_user.pics.build
  end

  def show
  end

  def create
    @pic = current_user.pics.build(pic_params)

    if @pic.save
      redirect_to @pic, notice: "Yay! Pic upload success!"
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

  def destroy
    @pic.destroy
    redirect_to root_url
  end

  def upvote
    @pic.upvote_by current_user
    redirect_to :back
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description, :image)
  end

  def set_picture
    @pic = Pic.find(params[:id]) if params[:id]
  end

end
