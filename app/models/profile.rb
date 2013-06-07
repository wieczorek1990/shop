class Profile < ActiveRecord::Base
  attr_accessible :date_of_birth, :first_name, :last_name, :newsletter, :telephone_number
  belongs_to :user
end
