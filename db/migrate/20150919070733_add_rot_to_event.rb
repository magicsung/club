class AddRotToEvent < ActiveRecord::Migration
  def change
    add_column :events, :rot, :boolean, default: true
  end
end
