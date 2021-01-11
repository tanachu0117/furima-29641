class Address < ApplicationRecord
  with_options presence: true do
    validates :postal_code        
    validates :prefecture_id      , numericality: { other_than: 0 } 
    validates :city               
    validates :city_number        ,format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :building_name      
    validates :phone_number       , length: { maximum: 11 }
  end
  belongs_to :order
end