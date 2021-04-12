class AddColumnsToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :payment_method, :string
    add_column :purchases, :delivery_type, :string
  end
end
