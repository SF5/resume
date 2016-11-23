class RemoveStringFromArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :string, :string
  end
end
