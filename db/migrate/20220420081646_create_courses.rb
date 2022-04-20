class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :courseId
      t.string :courseName
      t.decimal :credit
      t.references :semester, null: false, foreign_key: true

      t.timestamps
    end
  end
end
