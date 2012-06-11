class Vote < ActiveRecord::Base
  attr_accessible :voter_id, :votee_id, :rank
                  
  has_many :users 

end
