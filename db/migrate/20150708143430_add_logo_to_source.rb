class AddLogoToSource < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        add_attachment :sources, :logo
      end

      dir.down do
        remove_attachment :sources, :logo
      end
    end
  end
end
