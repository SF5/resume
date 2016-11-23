class Fixcolumntype4 < ActiveRecord::Migration[5.0]
  def change
    rename_column :portfolios, :type, :type_of_project
  end
end
