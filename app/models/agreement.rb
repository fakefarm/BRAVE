class Agreement < ActiveRecord::Base
  attr_accessible :title, :description, :is_admin, :project_id, :user_id, :content, :user_amount
  
  belongs_to :user
  belongs_to :project
  has_many :members
  
  validates_presence_of :title
  
end
