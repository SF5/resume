class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.text :year
      t.string :type
      t.string :description
      t.text :employer

      t.timestamps
    end
  end
end
