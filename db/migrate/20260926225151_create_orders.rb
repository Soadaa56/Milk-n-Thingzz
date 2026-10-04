class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :user, null: true, foreign_key: { on_delete: :nullify }

      t.string :status, null: false, default: "pending"
      t.datetime :fulfilled_at

      t.decimal :subtotal, precision: 7, scale: 2, null: false
      t.decimal :shipping_total, precision: 7, scale: 2
      t.decimal :tax_total, precision: 7, scale: 2
      t.decimal :total, precision: 7, scale: 2

      t.string :stripe_checkout_session_id
      t.string :stripe_payment_intent_id

      t.timestamps
    end
  end
end
