class RemoveGpaFromResults < ActiveRecord::Migration[6.0]
  def change
    remove_column :results, :gpa, :float
  end
end
