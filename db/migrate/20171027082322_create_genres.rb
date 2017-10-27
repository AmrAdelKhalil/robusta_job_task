class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :genres do |t|
      t.string :name
      t.references :movie
      t.timestamps
    end
  end
end