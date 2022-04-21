class AddNameKanaToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :name_kana, :string
  end
end
