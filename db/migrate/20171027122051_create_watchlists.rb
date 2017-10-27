class CreateWatchlists < ActiveRecord::Migration[5.1]
  def change
    create_table :watchlists do |t|
      t.references :user, index: true
      t.references :movie, index: true
      t.timestamps
    end
  end
end
