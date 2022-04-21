class AddAdressToCorporates < ActiveRecord::Migration[6.1]
  def change
    add_column :corporates, :address, :string
  end
end
