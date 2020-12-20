class Item < ApplicationRecord
  validates :name, presence: true
  validates :detail, presence: true
  validates :category_id, presence: true
  validates :item_state_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_days_id, presence: true
  validates :price, presence: true

  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { greater_than: 300 }
  validates :price, numericality: { less_than: 9999999 }
  validates :price, numericality: { only_integer: true}

  belongs_to :user
end
