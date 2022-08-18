class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :area
  belongs_to :date

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :cost_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :date_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, presence: true
  validates :user, presence: true
end
