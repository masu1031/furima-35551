class RenameDyaIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :dya_id, :day_id
  end
end
