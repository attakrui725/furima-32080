class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :shipment_source_id, numericality: { other_than: 1 }
  validates :day_to_ship_id, numericality: { other_than: 1 }
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: 'に半角数字を使用してください' }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999_999 }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre, :status, :delivery_fee, :day_to_ship, :shipment_source
end
