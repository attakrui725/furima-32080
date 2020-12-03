class UserPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture, :city, :address, :building, :phone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :phone_number, format: { with:	/\A\d{10,11}\z/, message: 'is invalid. Phone number Input only number' }
  end
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
