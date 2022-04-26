class RemoveResuFromReports < ActiveRecord::Migration[6.1]
  def change
    remove_column :reports, :resu, :string
  end
end
