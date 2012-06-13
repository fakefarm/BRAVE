class Client < ActiveRecord::Base
  attr_accessible :name, :email
 
  # has_one :Project
  validates_presence_of :name
  validates_presence_of :email

end
