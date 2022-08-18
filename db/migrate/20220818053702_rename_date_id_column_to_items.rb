class RenameDateIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :date_id, :shipdate_id
  end
end
