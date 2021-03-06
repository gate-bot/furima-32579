class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :redirect_action, only: [:edit]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if @item.user_item.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
       redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
      redirect_to root_path
   else
      render :show
   end
  end

  private

  def redirect_action
  unless current_user.id == @item.user.id
    redirect_to action: :index
  end
end

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :state_id, :bearer_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
