class Client < ActiveRecord::Base
  attr_accessible :name, :email

  validates_presence_of :name
  validates_presence_of :email

end
