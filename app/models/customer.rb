class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:name]

  validates_uniqueness_of :name
  validates_presence_of :name

  has_many :categories, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :characters, dependent: :destroy
  has_many :inquiries, dependent: :destroy

  def self.customer_name_search(customer_name)
    where(["name like?", "%#{customer_name}%"])
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["name = :value", { :value => name }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def active_for_authentication?
    super && (is_active == true)
  end

end
