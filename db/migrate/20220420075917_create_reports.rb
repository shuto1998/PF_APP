class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer :customer_id
      t.integer :corporate_id
      t.text :report_text 
      t.string :resu
      
      t.timestamps
    end
  end
end
