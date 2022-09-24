class Product < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area, :state, :category, :load, :delivery_day
end
