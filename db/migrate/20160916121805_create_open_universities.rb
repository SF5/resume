class CreateOpenUniversities < ActiveRecord::Migration[5.0]
  def change
    create_table :open_universities do |t|
      t.string :course
      t.text :code
      t.text :year

      t.timestamps
    end
  end
end
