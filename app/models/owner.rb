class Owner < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  has_one :building
  has_one :building_ownership, through: :building
end
