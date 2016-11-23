class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title
      t.date :created_at
      t.string :subject
      t.text :content
      t.text :link

      t.timestamps
    end
  end
end
