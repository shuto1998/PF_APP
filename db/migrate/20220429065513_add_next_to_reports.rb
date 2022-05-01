class AddNextToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :next, :datetime
  end
end
