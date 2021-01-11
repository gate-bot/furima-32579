class FormObject
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address_num, :building_name, :phone_num, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipality
    validates :address_num
    validates :phone_num, length: { maximum: 11 }
    validates :prefecture_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}

  def save
    user_item = UserItem.create( user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address_num: address_num, building_name: building_name, phone_num: phone_num, user_item_id: user_item.id)
  end
end