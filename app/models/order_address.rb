class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zipcode, :area_id, :city, :address1, :address2, :phone, :order_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zipcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :address1
    validates :phone, format: {with: /\A\d{10,11}\z/, message: "is invalid." }
    validates :order_id
  end
end