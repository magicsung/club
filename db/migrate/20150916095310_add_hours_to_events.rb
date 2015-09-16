class AddHoursToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :hours, :string
  end
end
