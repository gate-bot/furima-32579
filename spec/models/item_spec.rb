require 'rails_helper'
RSpec.describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "必須事項を正しく記入していれば出品できる" do
        expect(@item).to be_valid
      end
    end
  

    context '出品がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "product_nameが空だと出品できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "explanationが空では出品できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "category_idが--では出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "state_idが--では出品できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it "bearer_idが--では出品できない" do
        @item.bearer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Bearer must be other than 1")
      end
      it "prefecture_idが--では出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "delivery_date_idが--では出品できない" do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
      end
      it "priceが空だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300円未満だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが10000000円以上だと出品できない" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが半角英数混合だと出品できない" do
          @item.price = "a12345"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが半角英語だと出品できない" do
          @item.price = "aaaa"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが全角数字だと出品できない" do
        @item.price = "１１１"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end