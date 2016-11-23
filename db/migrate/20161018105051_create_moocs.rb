class CreateMoocs < ActiveRecord::Migration[5.0]
  def change
    create_table :moocs do |t|
      t.string :institute
      t.text :course
      t.text :year
      t.boolean :verified, :default => false
      
      t.timestamps
    end
  end
end
