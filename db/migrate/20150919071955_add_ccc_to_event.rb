class AddCccToEvent < ActiveRecord::Migration
  def change
    add_column :events, :ccc, :string, after: :hours
  end
end
