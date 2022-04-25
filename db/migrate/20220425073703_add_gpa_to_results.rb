class AddGpaToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :gpa, :decimal, precision: 5, scale: 3
  end
end
