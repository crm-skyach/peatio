class AddAccountType < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :type, :string, default: :spot, null: false, after: :currency_id
    remove_index :accounts, column: %i[currency_id member_id]
    add_index :accounts, %i[currency_id member_id type], unique: true, name: 'index_accounts_on_currency_id_and_member_id_and_type_and_unique'
  end
end
