class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden
  belongs_to :category
  belongs_to :day
  belongs_to :prefecture
  belongs_to :status
  
  has_one_attached :image

  belongs_to :user
  has_one :order

  validates :image, :name, :introduce, :price, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates_inclusion_of :price, in: 300..9_999_999

  validates :burden_id, :category_id, :day_id, :prefecture_id, :status_id, numericality: { other_than: 1 }
end
