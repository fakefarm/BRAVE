class Member < ActiveRecord::Base
  attr_accessible :agreement_id, :user

belongs_to :agreement

end
