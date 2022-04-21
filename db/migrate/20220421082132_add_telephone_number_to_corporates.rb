class AddTelephoneNumberToCorporates < ActiveRecord::Migration[6.1]
  def change
    add_column :corporates, :telephone_number, :integer
  end
end
