class HistoryAddress

  include ActiveModel::Model
  attr_accessor :product_id, :user_id, :postal_code, :area_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :product_id
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :city
    validates :house_number
    validates :phone_number, numericality: { only_integer: true}, length: { in: 10..11 }
  end

  def save
    history = History.create(product_id: product_id, user_id: user_id)

    Address.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, history_id: history.id)
  end
end