class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.date :created_at
      t.string :subject
      t.string :string
      t.text :content
      t.text :link

      t.timestamps
    end
  end
end