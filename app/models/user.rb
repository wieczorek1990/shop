class User < ActiveRecord::Base
  rolify
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  attr_accessible :date_of_birth, :first_name, :last_name, :newsletter, :telephone_number
  has_one :profile
  has_many :addresses
  has_one :basket
  has_many :orders
  validate :user_must_be_adult
  validates_format_of :telephone_number, :with => /(\d{9})|(\+\d{11})/

  private
    def user_must_be_adult
      if self.date_of_birth > Date.today - 18.years
        errors.add(:date_of_birth, 'must be adult')
      end
    end
end
