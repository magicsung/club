class RemoveRankFromEvent < ActiveRecord::Migration
  def up
    remove_column :events, :rank
  end

  def down
    add_column :events, :rank, :integer
  end
end
