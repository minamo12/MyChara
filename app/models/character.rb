class Character < ApplicationRecord
  has_many :characters_and_tags
  has_many :characters_and_categories
  has_many :tags, through: :characters_and_tags
  has_many :categories, through: :characters_and_categories

  belongs_to :customer

  has_one_attached :image
  has_one_attached :number_a_image
  has_one_attached :number_b_image
  has_one_attached :number_c_image


  def self.search(keyword)
    where(["name like? OR explanation like?", "%#{keyword}%", "%#{keyword}%"])
  end


  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  	end
  	image.variant(resize_to_limit: [width, height]).processed
  end

  def get_number_a_image(width, height)
    unless number_a_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      number_a_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  	end
  	number_a_image.variant(resize_to_limit: [width, height]).processed
  end

  def get_number_b_image(width, height)
    unless number_b_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      number_b_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  	end
  	number_b_image.variant(resize_to_limit: [width, height]).processed
  end

  def get_number_c_image(width, height)
    unless number_c_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      number_c_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  	end
  	number_c_image.variant(resize_to_limit: [width, height]).processed
  end
end
