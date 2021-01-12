require 'rails_helper'

RSpec.describe FormObject, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @form_object = FactoryBot.build(:form_object, user_id: user.id, item_id: item.id)
    sleep(1)
  end


  describe '商品購入機能の保存' do

  context '商品購入がうまくいくとき' do

  it "必要な情報を適切に入力すると、商品の購入ができること" do
    expect(@form_object).to be_valid
  end
end


context '商品購入うまくいかない場合' do

  it "tokenが空ではでは購入できないこと" do
    @form_object.token = nil
    @form_object.valid?
    expect(@form_object.errors.full_messages).to include("Token can't be blank")
  end

  it "postal_codeが空では購入できないこと" do
    @form_object.postal_code = nil
    @form_object.valid?
    expect(@form_object.errors.full_messages).to include("Postal code can't be blank")
  end

  it "prefecture_idが--では購入できない" do
    @form_object.prefecture_id = 1
    @form_object.valid?
    expect(@form_object.errors.full_messages).to include("Prefecture can't be blank")
  end

  it "municipalityが空では購入できないこと" do
    @form_object.municipality = nil
    @form_object.valid?
    expect(@form_object.errors.full_messages).to include("Municipality can't be blank")
  end

  it "address_numが空では購入できないこと" do
    @form_object.address_num = nil
    @form_object.valid?
    expect(@form_object.errors.full_messages).to include("Address num can't be blank")
  end

  it "phone_numが空では購入できないこと" do
    @form_object.phone_num = nil
    @form_object.valid?
    expect(@form_object.errors.full_messages).to include("Phone num can't be blank")
  end

  it "postal_codeにハイフンがないと購入できないこと" do
    @form_object.postal_code = "11111111"
    @form_object.valid?
    expect(@form_object.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
   end

   it "phone_numは11桁以内でないと購入できないこと" do
    @form_object.phone_num = "1111111111"
    @form_object.valid?
    expect(@form_object.errors.full_messages).to include("Phone num is too short (minimum is 11 characters)")
   end

   it "phone_numは数字のみでないと購入できないこと" do
    @form_object.phone_num = "111-1111-1111"
    @form_object.valid?
    expect(@form_object.errors.full_messages).to include("Phone num is invalid")
   end

   it "user_idは空では購入できないこと" do
    @form_object.user_id = nil
    @form_object.valid?
    expect(@form_object.errors.full_messages).to include("User can't be blank")
   end

   it "item_idは空では購入できないこと" do
    @form_object.item_id = nil
    @form_object.valid?
    expect(@form_object.errors.full_messages).to include("Item can't be blank")
   end
  end
 end
end