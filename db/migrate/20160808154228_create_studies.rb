class CreateStudies < ActiveRecord::Migration[5.0]
  def change
    create_table :studies do |t|
      t.text :course
      t.text :years
      t.text :institute

      t.timestamps
    end
  end
end
