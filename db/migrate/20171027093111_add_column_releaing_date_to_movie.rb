class AddColumnReleaingDateToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :releasing_date, :date
  end
end
