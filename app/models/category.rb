class Category < ApplicationRecord

  has_many :characters_and_categories
  has_many :characters, through: :characters_and_categories

  belongs_to :customer
end
