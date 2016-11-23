class FixOu < ActiveRecord::Migration[5.0]
  def change
    change_column :open_universities,  :course, :text, :limit => nil
    change_column :open_universities,  :code, :string, :limit => nil
    change_column :open_universities,  :year, :string, :limit => nil
  end
end
