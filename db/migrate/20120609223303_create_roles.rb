class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :classification
      t.timestamps
    end
  end

  
    
end
