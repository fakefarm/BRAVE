class Agreement < ActiveRecord::Base
  attr_accessible :title, :description, :is_admin, :project_id, :user_id
  
  belongs_to :user
  belongs_to :project
end
