class Item < ApplicationRecord
  with_options presence: true do 
  validates :image 
  validates :name
  validates :description
  end
  
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :delivery_fee_id
  validates :shipment_source_id
  validates :day_to_ship_id
  end
  
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: 'に半角数字を使用してください' }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999_999 }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre   
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :day_to_ship
  belongs_to :shipment_source
end
