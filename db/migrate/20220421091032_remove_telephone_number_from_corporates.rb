class RemoveTelephoneNumberFromCorporates < ActiveRecord::Migration[6.1]
  def change
    remove_column :corporates, :telephone_number, :integer
  end
end
