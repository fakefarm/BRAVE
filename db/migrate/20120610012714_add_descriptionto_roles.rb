class AddDescriptiontoRoles < ActiveRecord::Migration
  def up
  remove_column :roles, :classification, :integer
  add_column :roles, :description, :string
  add_column :roles, :classification, :string
 
  
  end

  def down
  end
end
