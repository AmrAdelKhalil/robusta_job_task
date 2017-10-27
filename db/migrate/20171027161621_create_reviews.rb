class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :description
      t.references :user
      t.references :movie
      t.timestamps
    end
  end
end
