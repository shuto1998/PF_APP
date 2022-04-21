class AddPhoneNumberToCorporates < ActiveRecord::Migration[6.1]
  def change
    add_column :corporates, :phone_number, :string
  end
end
