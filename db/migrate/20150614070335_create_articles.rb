class CreateArticles < ActiveRecord::Migration
  def change
    enable_extension :hstore

    create_table :articles do |t|
      t.string  :entry_id, null: false
      t.string  :uri
      t.string  :title
      t.text  :description
      t.hstore  :content, default: {}
      t.text    :categories, array: true, default: []
      t.integer :facebook, default: 0
      t.integer :linkedin, default: 0
      t.integer :twitter, default: 0
      t.belongs_to :source, null: false

      t.timestamps
    end

    add_index :articles, :entry_id, unique: true
  end
end
