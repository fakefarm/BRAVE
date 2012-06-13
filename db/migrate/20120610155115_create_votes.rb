class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
   
      t.integer :voter_id
      t.integer :rank
      t.integer :votee_id
      t.integer :project_id
      t.timestamps
    end
  end
end

``