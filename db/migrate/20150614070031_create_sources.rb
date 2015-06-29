class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources, id: false do |t|
      t.string :key, null: false
      t.string :uri
      t.string :description

      t.timestamps
    end

    add_index :sources, :key, unique: true
  end
end
