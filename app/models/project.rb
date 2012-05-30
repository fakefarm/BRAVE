class Project < ActiveRecord::Base
   attr_accessible :title, :client_email, :is_active, :project_amount
   
   has_many :agreements
   has_many :users, :through => :agreements
end
