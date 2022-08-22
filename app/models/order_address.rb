class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zipcode, :area_id, :city, :address1, :address2, :phone, :order_id
end