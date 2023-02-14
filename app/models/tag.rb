class Tag < ApplicationRecord
  
  has_many :characters_and_tags

  belongs_to :customer
  
end
