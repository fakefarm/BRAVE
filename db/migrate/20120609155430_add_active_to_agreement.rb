class AddActiveToAgreement < ActiveRecord::Migration
  def change
    add_column :agreements, :is_active, :boolean
  end
end
