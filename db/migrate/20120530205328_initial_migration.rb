class InitialMigration < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :password_digest

      t.timestamps
    end

    create_table :clients do |t|
      t.string :name
      t.string :email
      
      t.timestamps
    end

    create_table :projects do |t|
      t.string :title
      t.string :client_email
      t.integer :client_id
      t.boolean :is_active
      t.integer :project_amount
      
      t.timestamps
    end

    create_table :agreements do |t|
      t.string :title
      t.string :description
      t.string :content
      t.integer :project_id
      t.integer :user_id
      t.boolean :is_admin
      t.integer :user_amount

      t.timestamps
    end
  end
end
