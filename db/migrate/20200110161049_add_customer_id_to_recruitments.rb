class AddCustomerIdToRecruitments < ActiveRecord::Migration[5.2]
  def change
    add_column :recruitments, :customer_id, :integer
  end
end
