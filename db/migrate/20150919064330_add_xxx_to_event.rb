class AddXxxToEvent < ActiveRecord::Migration
  def change
    add_column :events, :xxx, :integer
  end
end
