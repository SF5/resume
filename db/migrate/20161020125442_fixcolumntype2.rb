class Fixcolumntype2 < ActiveRecord::Migration[5.0]
  def change
    change_column :experiences,  :description, :text, :limit => nil
  end
end
