class CreatePortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.string :type
      t.text :description
      t.text :link
      t.string :image

      t.timestamps
    end
  end
end
