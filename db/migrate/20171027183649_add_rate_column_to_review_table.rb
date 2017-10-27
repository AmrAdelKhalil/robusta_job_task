class AddRateColumnToReviewTable < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :rate, :integer
  end
end
