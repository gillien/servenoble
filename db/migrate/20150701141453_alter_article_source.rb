class AlterArticleSource < ActiveRecord::Migration
  def change
    add_column :articles, :status,        :integer, default: 0
    add_column :articles, :comments,      :integer, default: 0
    add_column :articles, :author,        :string
    add_column :articles, :published_at,  :datetime

    add_index :articles, :published_at

    reversible do |dir|
      dir.up do
        Article.destroy_all

        change_column :articles, :source_id, :string, null: false
      end

      dir.down do
        remove_column :articles, :source_id
        add_column :articles, :source_id, :integer, default: 0
      end
    end
  end
end
