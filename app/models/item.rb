class Item < ApplicationRecord

  with_options presence: true do
    validates :category_id        , numericality: { other_than: 0 }
    validates :item_state_id      , numericality: { other_than: 0 } 
    validates :shipping_fee_id    , numericality: { other_than: 0 } 
    validates :prefecture_id      , numericality: { other_than: 0 } 
    validates :shipping_days_id   , numericality: { other_than: 0 }
    validates :name                
    validates :detail               
    validates :image                
    validates :price              , format: { with: /\A[0-9]+\z/ }
    validates :price              , numericality: { greater_than: 300 }
    validates :price              , numericality: { less_than: 9999999 }
    validates :price              , numericality: { only_integer: true}
  end

  belongs_to :user
  has_one_attached :image  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :item_state
  belongs_to :shipping_fee
  belongs_to :shipping_days
end


