class Agreement < ActiveRecord::Base
  attr_accessible :title, :description, :is_admin, :project_id,
    :user_id, :content, :user_amount, :invitee_id, :is_active_user, :is_active_admin
  
  belongs_to :user
  belongs_to :project
  # belongs_to :invitee, class_name: "User" 
  
  validates :title, presence: true

  def is_active?
    if self.is_active_user == true && self.is_active_admin == true
      return true
    else
      return false
    end
  end
  
  def is_active_admin?
    if self.is_active_admin == true
      return true
    else
      return false
    end
  end
  
  def is_active_user?
    if self.is_active_user == true
      return true
    else
      return false
    end
  end
end
