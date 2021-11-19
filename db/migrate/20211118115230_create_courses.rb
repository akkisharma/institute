class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.decimal :credits, precision: 8, scale: 2, null: false
      t.integer :months_duration, null: false

      t.timestamps
    end
    add_index :courses, :name, unique: true
  end
end
