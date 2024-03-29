class Tag < ApplicationRecord

  has_many :characters_and_tags
  has_many :characters, through: :characters_and_tags
  has_many :materials_and_tags
  has_many :materials, through: :materials_and_tags

  belongs_to :customer

end
