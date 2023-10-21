class Order

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street_address, :building, :telephone, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :street_address
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }

    validates :user_id
    validates :item_id

    validates :token
  end


  
  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Profile.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_address: street_address, telephone: telephone,building: building, history_id: history.id )
  end
end