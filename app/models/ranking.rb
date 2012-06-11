class Ranking < ActiveRecord::Base
  attr_accessible :avgrank, :user_id

  belongs_to :users

end
