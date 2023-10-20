class Profile < ApplicationRecord
  belongs_to :history

  #validates :post_code, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'is invalid' }
  #validates :prefecture_id, numericality: { other_than: 1 }
  #validates :city, presence: true
  #validates :street_address, presence: true
  #validates :telephone, presence: true
  #validates :history, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
