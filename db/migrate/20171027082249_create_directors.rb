class CreateDirectors < ActiveRecord::Migration[5.1]
  def change
    create_table :directors do |t|

      t.timestamps
    end
  end
end
