class AddInviteeToAgreements < ActiveRecord::Migration
  def change
    add_column :agreements, :invitee_id, :integer
  end
end
