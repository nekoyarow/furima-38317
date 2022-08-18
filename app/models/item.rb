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
  validates :price, presence: true
  validates :user, presence: true
end
