class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions 

  has_one_attached :image
  belongs_to :load
  belongs_to :area
  belongs_to :delivery
  belongs_to :category
  belongs_to :state
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price,  numericality: { in: 300..9999999 }
    validates :image
    validates :user_id
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :load_id
    validates :area_id
    validates :delivery_id
    validates :category_id
    validates :state_id
  end

  
end