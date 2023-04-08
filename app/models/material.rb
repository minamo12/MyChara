class Material < ApplicationRecord

  has_many :materials_and_tags
  has_many :materials_and_categories
  has_many :tags, through: :materials_and_tags
  has_many :categories, through: :materials_and_categories

  belongs_to :customer
end
