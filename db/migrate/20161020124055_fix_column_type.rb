class FixColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :experiences, :year, :string, :limit => nil
  end
end
