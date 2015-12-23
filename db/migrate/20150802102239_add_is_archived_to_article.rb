class AddIsArchivedToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :is_read,     :boolean, default: false

    add_column :sources,  :language,    :string,  default: ''
  end
end
