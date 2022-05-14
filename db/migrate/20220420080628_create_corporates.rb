class CreateCorporates < ActiveRecord::Migration[6.1]
  def change
    create_table :corporates do |t|
      t.integer :report_id
      t.string :name
      t.string :name_kana
      t.integer :annual_saleses
      t.string :industories
      t.integer :employees
      t.integer :bases
      t.string :corporate_info
      t.timestamps
    end
  end
end
