class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.references :semester, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.decimal :marks

      t.timestamps
    end
  end
end
