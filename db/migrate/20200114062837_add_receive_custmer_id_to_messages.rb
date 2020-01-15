class AddReceiveCustmerIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :receive_customer_id, :string
  end
end
