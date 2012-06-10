class Role < ActiveRecord::Base
  attr_accessible  :classification, :description

 belongs_to :user

end

