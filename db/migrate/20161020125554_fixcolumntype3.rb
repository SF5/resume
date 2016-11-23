class Fixcolumntype3 < ActiveRecord::Migration[5.0]
  def change
    change_column :experiences, :employer, :string , :limit => nil
  end
end
