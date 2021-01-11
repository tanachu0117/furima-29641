class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :prefecture
  has_one    :address
end
