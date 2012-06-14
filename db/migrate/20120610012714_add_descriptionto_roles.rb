class AddDescriptiontoRoles < ActiveRecord::Migration
  def up
	  add_column :roles, :description, :string
	  change_column :roles, :classification, :string  
  end

  def down
	  remove_column :roles, :description, :string
	  change_column :roles, :classification, :integer  
  end
end
