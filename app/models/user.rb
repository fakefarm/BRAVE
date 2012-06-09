class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :role

  
  has_secure_password
  
  has_many :agreements
  has_many :projects, :through => :agreements

  # validates :name,  presence: true, length: { maximum: 50 }
  #  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
  def pending_admin_agreements
    self.agreements.find(:all, :conditions => { :is_active_admin => false })
  end
  
  def pending_user_agreements
    self.agreements.find(:all, :conditions => { :is_active_user => false })
  end

end
