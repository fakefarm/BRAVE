class Project < ActiveRecord::Base
   attr_accessible :title, :client_email, :is_active, :project_amount, :client_id
   
   has_many :agreements, dependent: :destroy
   has_many :users, :through => :agreements
   # belongs_to :client, class_name: 'User'
   has_many :messages

  validates_presence_of :title
   
  def admin
    admin_agreement_array = self.agreements.find(:all, :conditions => { :is_admin => true})
    admin = admin_agreement_array[0].user
  end

  def client
    User.find_by_email(self.client_email).name
  end

	def is_approved?
		all_project_agreements = self.agreements
		approve_project_agreements = self.agreements.where(is_active_admin: true).where(is_active_user: true)
		if all_project_agreements.count == approve_project_agreements.count
				return true
			else
				return false
		end
	end

end