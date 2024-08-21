class CreateExpenses < ActiveRecord::Migration[7.2]
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :amount
      t.date :date
      t.string :category

      t.timestamps
    end
  end
end
