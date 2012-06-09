class Agreement < ActiveRecord::Base
  attr_accessible :title, :description, :is_admin, :project_id,
    :user_id, :content, :user_amount, :invitee_id, :is_active_user, :is_active_admin
  
  belongs_to :user
  belongs_to :project
  # belongs_to :invitee, class_name: "User" 
  
  validates :title, presence: true

end
