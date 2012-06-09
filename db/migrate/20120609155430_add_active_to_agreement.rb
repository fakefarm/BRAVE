class AddActiveToAgreement < ActiveRecord::Migration
  def change
    add_column :agreements, :is_active_admin, :boolean
    add_column :agreements, :is_active_user, :boolean
  end
end
