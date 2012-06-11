class AddColumnstoVote < ActiveRecord::Migration
  def change
    add_column :votes, :voter_id, :integer
     add_column :votes, :votee_id, :integer
     add_column :votes, :rank, :integer
  end

  def down
  end
end
