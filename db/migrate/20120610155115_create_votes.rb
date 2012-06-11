class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
   
   add_column :votes, :voter_id, :integer
   add_column :votes, :votee_id, :integer
   add_column :votes, :rank, :integer
   
      t.timestamps
    end
  end
end

``