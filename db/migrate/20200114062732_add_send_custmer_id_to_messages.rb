class AddSendCustmerIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :send_customer_id, :string
  end
end
