class RenamePurchasesIdColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :purchases_id, :order_id
  end
end
