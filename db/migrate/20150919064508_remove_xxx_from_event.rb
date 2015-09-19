class RemoveXxxFromEvent < ActiveRecord::Migration
  def up
    remove_column :events, :xxx
  end

  def down
    add_column :events, :xxx, :integer
  end
end
