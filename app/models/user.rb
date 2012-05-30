class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  
  has_secure_password
  
  has_many :agreements
  has_many :projects, :through => :agreements
  
end
