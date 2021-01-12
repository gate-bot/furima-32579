class UserItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_item, only: [:index, :create ]
  
    def index
      @form_object = FormObject.new
      if current_user.id != @item.id && @item.user_item.present?
         redirect_to root_path
      end
    end
  
    def create
      @form_object = FormObject.new(user_items_params)
        if @form_object.valid?
        pay_item
        @form_object.save
        redirect_to root_path
      else
        render :index
      end
    end
  
    private
  
    def user_items_params
      params.require(:form_object).permit(:price,:postal_code, :prefecture_id, :municipality, :address_num, :building_name, :phone_num,).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
    end
  
    def set_item
      @item = Item.find(params[:item_id])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: user_items_params[:token],
        currency: 'jpy'
      )
    end
  
end
