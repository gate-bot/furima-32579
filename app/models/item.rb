class Item < ApplicationRecord
  belongs_to :user
  has_one :user_item
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product_name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9999999 }
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :bearer
  belongs_to :prefecture
  belongs_to :delivery_date

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :bearer_id
    validates :prefecture_id
    validates :delivery_date_id
  end

end
