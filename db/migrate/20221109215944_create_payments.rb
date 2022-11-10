class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.date :received_on
      t.references :campaign, null: false, foreign_key: true
      t.decimal :capital
      t.decimal :interest
      t.decimal :taxes
      t.decimal :withheld_taxes
      t.decimal :fee
      t.decimal :total

      t.timestamps
    end
  end
end
