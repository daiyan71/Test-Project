class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.references :semester, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.decimal :gpa

      t.timestamps
    end
  end
end
