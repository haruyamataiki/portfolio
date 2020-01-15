class AddCustomerIdToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :customer_id, :integer
  end
end
