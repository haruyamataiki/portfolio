class AddCustomerRefAndRoomRefToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :customer, foreign_key: true
    add_reference :messages, :room, foreign_key: true
    change_column_null :messages, :customer_id, false
    change_column_null :messages, :room_id, false
  end
end
