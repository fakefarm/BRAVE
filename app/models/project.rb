class Project < ActiveRecord::Base
   attr_accessible :title, :client_email, :is_active, :project_amount, :client_id
   
   has_many :agreements
   has_many :users, :through => :agreements
   
   
   def admin
    admin_agreement_array = self.agreements.find(:all, :conditions => { :is_admin => true})
    admin = admin_agreement_array[0].user.name
  end
  
end