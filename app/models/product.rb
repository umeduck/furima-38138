class Product < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price,  length: { :minimum: 300, maxlength: 9999999, message: 'Price is out of setting range' }, format: { with: /\A[0-9]+\z/ ,message: 'is invalid. Include half-width characters' }
    validates :image
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :load_id
    validates :area_id
    validates :delivery_day_id
    validates :category_id
    validates :state_id
  end


  belongs_to :area, :state, :category, :load, :delivery_day, :user
end
