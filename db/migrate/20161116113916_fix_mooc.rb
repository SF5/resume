class FixMooc < ActiveRecord::Migration[5.0]
  def change
    change_column :moocs,  :institute, :text, :limit => nil
    change_column :moocs,  :year, :string, :limit => nil
  end
end
