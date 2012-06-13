class Vote < ActiveRecord::Base
  attr_accessible :voter_id, :votee_id, :rank, :project_id
                  
  has_many :users 
  belongs_to :project

end
