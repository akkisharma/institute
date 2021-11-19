class CreateTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :tutors do |t|
      t.references :course, null: false, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :mobile, null: false
      t.date :doj, null: false

      t.timestamps
    end
    add_index :tutors, :email, unique: true
    add_index :tutors, :mobile, unique: true
  end
end
