class Building < ActiveRecord::Base
  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :postal_code
  belongs_to :owner
  has_one :building_ownership
end
