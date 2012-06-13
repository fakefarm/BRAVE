class AddDescriptiontoRoles < ActiveRecord::Migration
  def up
	  add_column :roles, :description, :string
	  add_column :roles, :classification, :string  
  end

  def down
	  remove_column :roles, :description, :string
	  remove_column :roles, :classification, :string  
  end
end
