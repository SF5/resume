class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :experiences, :type, :type_of_job
  end
end
