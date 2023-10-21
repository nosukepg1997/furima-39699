class Profile < ApplicationRecord
  belongs_to :history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
