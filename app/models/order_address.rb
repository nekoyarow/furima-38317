class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zipcode, :area_id, :city, :address1, :address2, :phone, :order_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zipcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :address1
    validates :phone, format: {with: /\A\d{10,11}\z/, message: "is invalid." }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zipcode: zipcode, area_id: area_id, city: city, address1: address1, address2: address2, phone: phone, order_id: order_id)
  end
end