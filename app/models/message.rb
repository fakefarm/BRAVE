class Message < ActiveRecord::Base
  attr_accessible :content, :project_id, :user_id
  
  belongs_to :project
  belongs_to :user
  
  validates :content, presence: true
end
